FROM ubuntu
MAINTAINER Brian Morearty, brian@morearty.org
ADD . /opt/apps/partlines
WORKDIR /opt/apps/partlines
RUN ./partlines.sh
