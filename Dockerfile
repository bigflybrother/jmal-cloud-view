FROM node:12 as builder

WORKDIR /app
COPY ./ /app/
RUN npm install --registry https://registry.npm.taobao.org

RUN npm run build

FROM nginx:1.16.1

# copy from node builder
COPY --from=builder /app/dist /usr/share/nginx/html
COPY --from=builder /app/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/run.sh run.sh

# set env default value.
EXPOSE 80

CMD /run.sh && \
    nginx -g "daemon off;"