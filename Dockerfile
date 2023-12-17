FROM alpine:latest AS run

RUN apk update
RUN apk --no-cache add curl

RUN mkdir /harmony_node
WORKDIR /harmony_node

RUN curl -LO https://github.com/harmony-one/go-sdk/releases/download/v1.4.2/hmy && chmod +x hmy

# Copy over helpers scripts
COPY create_bls_key.sh /harmony_node/
RUN chmod +x create_bls_key.sh

# these are the directories we will mount volumes to
RUN mkdir -p .hmy/blskeys

CMD ["./hmy", "cookbook"]