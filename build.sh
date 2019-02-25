docker build -t docker_bind_volume_demo .

# create container with auto generated name
docker create docker_bind_volume_demo

# start it
docker start 

# log in to it
docker exec -it dockerbindvolumedemo_web_1 /bin/sh

# This will return

        "Mounts": [
            {
                "Type": "volume",
                "Name": "67762a9623220ac1ef19550a55984c8ea5b31f234c3829adf2a19f805659ba7b",
                "Source": "/var/lib/docker/volumes/67762a9623220ac1ef19550a55984c8ea5b31f234c3829adf2a19f805659ba7b/_data",
                "Destination": "/data",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            }


# SO destination maps a thing

docker volume 

docker run -d \
  --name=nginxtest \
  --mount source=nginx-vol,destination=/usr/share/nginx/html,readonly \
  nginx:latest

