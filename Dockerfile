FROM python:slim-stretch
ENV PYTHONUNBUFFERED 1

ADD . /home/test

WORKDIR /home/test

RUN useradd -rm -d /home/test -s /bin/bash -g root -G sudo -u 1000 test

RUN chown -R test /home/test

RUN pip install -r requirements.txt

USER test

RUN export FLASK_APP=app.py

ENTRYPOINT [ "python", "app.py" ]