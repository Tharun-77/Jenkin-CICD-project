docker build . -t todo-node-app
PREV_BUILD_NUM=$((BUILD_NUMBER - 1))
docker kill todo-node-app-${PREV_BUILD_NUM} || true
docker run -d --name todo-node-app-${BUILD_NUMBER} -p 8000:8000 todo-node-app
docker rm -f todo-node-app-${PREV_BUILD_NUM} || true