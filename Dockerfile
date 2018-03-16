# -- sh --
FROM shidima/ubuntu-pharo-seaside:0.0.2
MAINTAINER Christiaan Janssen, christiaan@drunkturtle.com


ADD . /home/deploy

EXPOSE 8080

CMD ./pharo Pharo.image ./deploy/seaside.st
