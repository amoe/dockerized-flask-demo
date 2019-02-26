# Imagine our service is called myannotator
docker build -t myannotator_image .

# Create container with specific name
# Source path has to be absolute
docker create --name myannotator_container \
  --mount type=bind,source=$(pwd)/code,destination=/code,readonly \
  myannotator_image

# List containers to show it was created
docker ps -a

# start it, attached
docker start -a myannotator_container

# log in to it (from another terminal)
docker exec -it myannotator_container /bin/sh

# Inspect it.
docker inspect myannotator_container

#/dev/sda5 on /code type ext4 (ro,relatime,errors=remount-ro,data=ordered)


# This will return

        # "Mounts": [
        #     {
        #         "Type": "bind",
        #         "Source": "/home/amoe/dev/docker-bind-volume-demo/code",
        #         "Destination": "/data",
        #         "Mode": "",
        #         "RW": false,
        #         "Propagation": "rprivate"
        #     }

# Now make a change in app.py.
#  * Detected change in '/code/app.py', reloading

# Now you only need to rebuild if you change the infrastructure definitions.
