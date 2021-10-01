FROM debian:buster

USER root

RUN apt-get -q update
RUN apt-get install -yq wget apt-transport-https gnupg2
RUN wget --quiet https://epicsdeb.bnl.gov/debian/repo-key.pub -O - | apt-key add -
RUN echo "deb https://epicsdeb.bnl.gov/debian/ buster main contrib" | tee /etc/apt/sources.list.d/nsls2.list
RUN apt-get update
RUN apt-get install -yq build-essential git epics-dev

RUN apt-get install -yq procps procserv telnet supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY test.db /tmp/test.db

CMD ["/usr/bin/supervisord"]
