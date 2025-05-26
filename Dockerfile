FROM            docker.io/redhat/ubi9
RUN             dnf install python3.12-devel python3.12-pip gcc -y
RUN             useradd -u 1001 python
WORKDIR         /home/python
COPY            payment.ini payment.py rabbitmq.py requirements.txt /home/python/
RUN             pip3.12 install -r requirements.txt
ENTRYPOINT      ["uwsgi", "--ini", "payment.ini"]