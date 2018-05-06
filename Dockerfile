FROM ubuntu:16.04
RUN mkdir /buildroot
WORKDIR /buildroot
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git build-essential automake autoconf libssl-dev net-tools
ADD https://github.com/erlang/otp/archive/OTP-19.2.tar.gz .
RUN tar zxf OTP-19.2.tar.gz
WORKDIR otp-OTP-19.2
RUN ./otp_build autoconf && \
    CFLAGS="-Os" ./configure --prefix=/buildroot/erlang/19.2 --without-termcap --disable-hipe && \
    make -j10
RUN mkdir -p /buildroot/erlang/19.2 && \
    make install
RUN mkdir -p /buildroot/rebar3/bin
ADD https://s3.amazonaws.com/rebar3/rebar3 /buildroot/rebar3/bin/rebar3
RUN chmod a+x /buildroot/rebar3/bin/rebar3
ENV PATH=/buildroot/erlang/19.2/bin:/buildroot/rebar3/bin:$PATH
RUN mkdir -p /buildroot/websocket_chat
WORKDIR /buildroot/websocket_chat
RUN git clone  https://github.com/Antibiotic/websocket_chat.git
WORKDIR /buildroot/websocket_chat/websocket_chat
RUN  make
EXPOSE 8080
CMD ["sh","-c","cd /buildroot/websocket_chat/websocket_chat && make start"]
