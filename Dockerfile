FROM centos:7
# Added the following lines to fix the build
# per https://community.nethserver.org/t/problem-updating-nethserver-7-7-1908/17004/2
RUN yum --enablerepo=base clean metadata
RUN yum clean all
RUN yum repolist -v
RUN yum update -y && yum upgrade -y
# Same as original Dockerfile
RUN yum -y install epel-release
RUN yum -y install git ansible openssh-clients
WORKDIR /root
RUN git clone https://github.com/mtarking/cisco-nxos-ansible-vxlan-evpn
