FROM ubuntu:20.04 AS build

RUN apt update && apt upgrade -y && apt install curl jq -y
RUN mkdir /harmony_node
WORKDIR /harmony_node

# Always use latest CLI
RUN curl -LO https://harmony.one/hmycli && mv hmycli hmy && chmod +x hmy

# Copy over helpers scripts
COPY create_bls_key.sh /harmony_node/
RUN chmod +x create_bls_key.sh

# these are the directories we will mount volumes to
RUN mkdir -p .hmy/blskeys

CMD ["./hmy", "cookbook"]