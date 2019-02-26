# Imagine our service is called myannotator
docker build -t myannotator_image .

# Create container with specific name
# Source path has to be absolute
# Mem limits are specified at this time (create or run time) with
# -m 5g

# Env can be handled with this.
# docker create -e MYVAR1 --env MYVAR2=foo --env-file ./env.list 
# However env can also be hardcoded into the Dockerfile, at build time.
# EXPOSE is the big one.

# The EXPOSE instruction does not actually publish the port. It functions as a
# type of documentation between the person who builds the image and the person who
# runs the container, about which ports are intended to be published. To actually
# publish the port when running the container, use the -p flag on docker run to
# publish and map one or more ports, or the -P flag to publish all exposed ports
# and map them to high-order ports.


# docker run -p 127.0.0.1:80:8080/tcp ubuntu bash
#  This binds port 8080 of the container to TCP port 80 on 127.0.0.1 of the host
# > machine. You can also specify udp and sctp ports. The Docker User Guide explains
# > in detail how to manipulate ports in Docker.

# $ docker run --expose 80 ubuntu bash

# This exposes port 80 of the container without publishing the port to the host
# system’s interfaces.

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


    # ports:
    #  - "7005:8000"
    # image: aus_lga_six_way_v2
    # environment:
    #  - TWO_FISHES_HOST=casm1.casmconsulting.co.uk
    #  - TWO_FISHES_PORT=3033
    #  - DEBUG_APP_VERBOSITY=0
    # mem_limit: 4g
