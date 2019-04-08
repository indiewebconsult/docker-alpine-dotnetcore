# Alpine with latest Node 
## Implementing:
### Python and yarn
FROM node:current-alpine
WORKDIR /
RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
		yarn \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/* 
