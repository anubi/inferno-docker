FROM debian:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y p7zip-full telnetd xinetd build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y libc6 lib32gcc-s1 lib32stdc++6

# Cannot run moo as x64
RUN ln -s /lib/x86_64-linux-gnu/libcrypt.so.1 /usr/lib/libcrypt.so.1
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libcrypt1:i386
RUN apt-get update && apt-get install -y libcrypt1:i386
RUN apt-get update && apt-get install -y net-tools iproute2

# Install dos2unix, only necessary if host os is windows
RUN apt-get update && \
    apt-get install -y dos2unix && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt/InfernoMOO

# Copy the archive into the container
COPY InfernoMOO.7z /tmp/
COPY restart.sh /opt/InfernoMOO/restart.sh

# ensures the script has unix line endings
RUN dos2unix /opt/InfernoMOO/restart.sh

# Extract the archive
RUN 7z x /tmp/InfernoMOO.7z -o/opt/InfernoMOO && rm /tmp/InfernoMOO.7z

# Compile InfernoMOO
WORKDIR /opt/InfernoMOO/InfernoMOOSource
RUN chmod +x configure && chmod +x Makefile && make && chmod +x moo

# Expose port 7779 for MOO access
EXPOSE 7779

# Start InfernoMOO server on container start
CMD ["/bin/bash", "/opt/InfernoMOO/restart.sh"]

#Use this to debug the container interactively by commenting out the above CMD and uncommenting this line:
#ENTRYPOINT ["tail", "-f", "/dev/null"]
#In such a scenario, you should cd to /opt/InfernoMOO and manually invoke:
#`./InfernoMOOSource/moo -l moo.log Databases/hell2010.db Databases/hell2010-save.db 7779 &`
#You may need to install helpers like top to be able to see if it's online, but 
#`ss -tulnp | grep 7779` should return a valid instance of the server