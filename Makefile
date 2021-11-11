## Build all binaries 
BIN_NAME=sslip-urlgen

build:
	CGO_ENABLED=0 GIN_MODE=release go build -ldflags "-s -w" -o ${BIN_NAME} .
build-img:
	CGO_ENABLED=0 GIN_MODE=release go build -ldflags "-s -w" -o ${BIN_NAME} .
	podman build -f ContainerFile -t ${BIN_NAME} .
clean:
	rm -f ${BIN_NAME}
run:
	go run .