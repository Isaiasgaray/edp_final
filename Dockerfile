FROM ubuntu:22.10

RUN apt-get update && apt-get upgrade -y && apt-get install bc locales -y

RUN sed -i '/es_AR.UTF-8/ s/^# //g' /etc/locale.gen && locale-gen

ENV LANG es_AR.UTF-8
ENV LANGUAGE es_AR:es
ENV LC_ALL es_AR.UTF-8

ADD ["scripts/", "archivos_de_prueba/zen.txt", "/usr/src/"]

WORKDIR /usr/src/

ENTRYPOINT ["bash", "main.sh"]
