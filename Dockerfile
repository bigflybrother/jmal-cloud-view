FROM node:12 as builder

WORKDIR /app
COPY ./ /app/
RUN npm install --registry https://registry.npm.taobao.org


RUN npm run build



FROM centos

# put nginx-1.12.2.tar.gz into /usr/local/src and unpack nginx
ADD nginx-1.18.0.tar.gz /usr/local/src

# running required command

RUN yum install -y gcc gcc-c++ glibc make autoconf openssl openssl-devel 
RUN yum install -y libxslt-devel -y gd gd-devel pcre pcre-devel

RUN useradd -M -s /sbin/nologin nginx
# 
# change dir to /usr/local/src/nginx-1.18.0
WORKDIR /usr/local/src/nginx-1.18.0


COPY --from=builder /app/nginx-dav-ext-module-master nginx-dav-ext-module-master
# execute command to compile nginx
RUN ./configure --user=nginx --group=nginx --prefix=/usr/local/nginx --with-file-aio --with-http_ssl_module --with-http_addition_module --with-http_xslt_module --with-http_image_filter_module  --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_auth_request_module --with-http_random_index_module --with-http_secure_link_module --with-http_degradation_module --with-http_stub_status_module --add-module=nginx-dav-ext-module-master  && make && make install



COPY --from=builder /app/dist /usr/local/nginx/html
COPY --from=builder /app/nginx.conf /usr/local/nginx/conf/nginx.conf
COPY --from=builder /app/run.sh /run.sh

WORKDIR /usr/local/nginx/sbin
# set env default value.
EXPOSE 80

CMD /run.sh && ./nginx -g "daemon off;"