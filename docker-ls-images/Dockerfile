
# Best practice for Dockerfile's: specify exact versions whenever possible.
FROM busybox:4986bf8c1536
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>
RUN mkdir -p /images
VOLUME /images
CMD ["/bin/sh", "-c", "ls /images"]