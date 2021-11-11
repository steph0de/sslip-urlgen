# syntax=docker/dockerfile:1

FROM golang:1.17-alpine3.14 AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GIN_MODE=release go build -o /sslip-urlgen

FROM scratch
MAINTAINER Stephane EMILIEN <stephaneemilien+git@gmail.com>
LABEL org.opencontainers.image.description "Simple webservice to generate sslip.io urls"

ADD public /public
COPY --from=build /sslip-urlgen /sslip-urlgen
ENTRYPOINT ["/sslip-urlgen"]