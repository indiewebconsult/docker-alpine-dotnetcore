# Alpine Node 11
## Implementing:
### Python and yarn
FROM node:11-alpine
WORKDIR /
RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
		yarn \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/* 
