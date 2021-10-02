FROM debian:buster

USER root

RUN apt-get -q update
RUN apt-get install -yq wget apt-transport-https gnupg2
RUN wget --quiet https://epicsdeb.bnl.gov/debian/repo-key.pub -O - | apt-key add -
RUN echo "deb https://epicsdeb.bnl.gov/debian/ buster main contrib" | tee /etc/apt/sources.list.d/nsls2.list
RUN apt-get update
RUN apt-get install -yq build-essential epics-dev

EXPOSE 5065/tcp 5064/tcp
EXPOSE 5065/udp 5064/udp

COPY test.db /tmp/test.db
CMD softIoc -d /tmp/test.db
