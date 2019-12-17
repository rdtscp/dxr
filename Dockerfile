FROM ubuntu@sha256:0ca448cb174259ddb2ae6e213ebebe7590862d522fe38971e1175faedf0b6823

RUN apt-get update -y ; apt-get upgrade -y

COPY ./tooling/docker/set_up_ubuntu.sh /tmp/
RUN DEBIAN_FRONTEND=noninteractive /tmp/set_up_ubuntu.sh

COPY ./tooling/docker/set_up_common.sh /tmp/
RUN DEBIAN_FRONTEND=noninteractive /tmp/set_up_common.sh

COPY ./dxr /home/dxr/

RUN cd /home/dxr/ ; make