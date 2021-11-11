#FROM docker.io/library/alpine:3.13.6
FROM scratch
MAINTAINER Stephane EMILIEN <stephaneemilien+git@gmail.com>
LABEL org.opencontainers.image.description "Simple webservice to generate sslip.io urls"

ADD sslip-urlgen /
ADD public /public
CMD ["/sslip-urlgen"]