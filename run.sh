#!/bin/bash

set -x
set -e

absolute_path="/etc/nginx/nginx.conf"

mv ${absolute_path} ${absolute_path}.old
cat ${absolute_path}.old |
sed s#API_SERVER_URL#${API_SERVER_URL}#g    >  ${absolute_path}

