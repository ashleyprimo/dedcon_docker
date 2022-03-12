FROM i386/alpine:latest

# 32bit Compat
RUN apk add --no-cache libstdc++ libc6-compat

# Setup Dedcon Directory
RUN mkdir /dedcon
ADD ./dedcon /dedcon

# Set working dir
WORKDIR /dedcon

# Download Dedcon
RUN wget http://dedcon.simamo.de/bin/dedcon-i686-pc-linux-gnu-1.6.0.tar.bz2 -P /dedcon/
RUN echo "5c64122b4004a18c09ded6f814f5fb6a61c3bfa3e9a4f8390cdab2a3fbf54d35  dedcon-i686-pc-linux-gnu-1.6.0.tar.bz2" | sha256sum -c
RUN tar -xvf /dedcon/dedcon-i686-pc-linux-gnu-1.6.0.tar.bz2 -C /dedcon/
RUN rm /dedcon/dedcon-i686-pc-linux-gnu-1.6.0.tar.bz2
RUN mv /dedcon/dedcon-i686-pc-linux-gnu-1.6.0 /dedcon/bin

# Set runtime permission
RUN chmod +x /dedcon/bin/dedcon
RUN chmod +x /dedcon/run.sh

# Expose Default Port
EXPOSE 5010/udp

# Set runtime script
CMD ["./run.sh", "config"]
