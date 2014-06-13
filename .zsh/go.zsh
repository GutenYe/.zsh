#!/bin/zsh

# fix archlinux
[[ -f /usr/share/zsh/site-functions/_go ]] && source /usr/share/zsh/site-functions/_go

# support functions for go cross compilation

MY_PLATFORMS=(darwin/386 darwin/amd64 freebsd/386 freebsd/amd64 linux/386 linux/amd64 linux/arm windows/386 windows/amd64)
MY_GOHOSTOS="linux"
MY_GOROOT="/home/guten/dev/src/go/go"

function cgo-enabled {
	if [ "$1" = "${MY_GOHOSTOS}" ]; then 
		echo 1
	else 
		echo 0
	fi
}

function go-alias {
	MY_GOOS=${1%/*}
	MY_GOARCH=${1#*/}
	eval "function go-${MY_GOOS}-${MY_GOARCH} { (CGO_ENABLED=$(cgo-enabled ${MY_GOOS} ${MY_GOARCH}) GOOS=${MY_GOOS} GOARCH=${MY_GOARCH} ${MY_GOROOT}/bin/go \$@ ) }"
}

function go-crosscompile-build {
	MY_GOOS=${1%/*}
	MY_GOARCH=${1#*/}
  cd ${MY_GOROOT}/src 
  CGO_ENABLED=$(cgo-enabled ${MY_GOOS} ${MY_GOARCH}) GOOS=${MY_GOOS} GOARCH=${MY_GOARCH} ./make.bash --no-clean 2>&1
  cd -
}

function go-crosscompile-build-all {
	for PLATFORM in $MY_PLATFORMS; do
		echo "go-crosscompile-build ${PLATFORM}"
		go-crosscompile-build ${PLATFORM} >/dev/null
	done
}	

function go-all {
	for PLATFORM in $MY_PLATFORMS; do
		MY_GOOS=${PLATFORM%/*}
        	MY_GOARCH=${PLATFORM#*/}
                CMD="go-${MY_GOOS}-${MY_GOARCH} $@"
                echo "$CMD"
                $CMD
        done
}

for MY_PLATFORM in $MY_PLATFORMS; do
	go-alias $MY_PLATFORM
done
