#gnix con debian
FROM nginx:1.27.2-bookworm

#Variables para el certificado
ARG COMMON_NAME="Eduard Mirea"
ARG ORGANIZATION="IES El Caminas"
ARG ORGANIZATIONAL_UNIT="Informatica"
ARG CERT_DIR="/etc/nginx/ssl"

#Instalar herramientas necesarias
RUN apt-get update && apt-get install -y openssl && apt-get clean

#Crear directorio para certificados y generar certificado autofirmado
RUN mkdir -p ${CERT_DIR} && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout ${CERT_DIR}/server.key \
    -out ${CERT_DIR}/server.crt \
    -subj "/CN=${COMMON_NAME}/O=${ORGANIZATION}/OU=${ORGANIZATIONAL_UNIT}"

#Crear usuario para el área privada
RUN apt-get update && apt-get install -y apache2-utils && apt-get clean && \
    htpasswd -bc /etc/nginx/.htpasswd profe ieselcaminas

#archivos de la web
COPY ./sitiowebdaw /usr/share/nginx/html

#archivo de configuración de nginx
COPY ./configuracion/nginx.conf /etc/nginx/nginx.conf

#Exponer los puertos HTTP y HTTPS
EXPOSE 80 443

#Comando para iniciar el servidor NGINX en foreground
CMD ["nginx", "-g", "daemon off;"]