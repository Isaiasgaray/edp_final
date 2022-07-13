FROM ubuntu:22.10

run apt-get update && apt-get upgrade -y && apt-get install bc -y

ADD ["scripts/", "archivos_de_prueba/zen.txt", "/usr/src/"]

WORKDIR /usr/src/

ENTRYPOINT ["bash", "main.sh"]
