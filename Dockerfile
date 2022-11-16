# Use latest Fedora Linux as a target system
FROM fedora:latest

# Install required dependencies
RUN dnf install -y ansible make

# Add user me and add 'em to sudoers, additionally skip requirement to enter
# password when sudo processing commands :seenoevil:
RUN useradd -ms /usr/bin/bash me
RUN usermod -aG users me
RUN echo "%users ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# RUN groupadd admin
# RUN usermod -aG admin me

# Switch to user me, adapt the working directory
USER me
WORKDIR /home/me/env/

CMD ["make", "setup"]
