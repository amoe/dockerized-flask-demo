# notes

You should use the `--mount` option.

The argument consists of multiple key value pairs, separated by commas, eg

    key1=value1,key2=value2

Available keys:

    type=bind
    source=./code
    destination=/data
    readonly

Docker will not automatically create the source when using --mount option.

Bind mounts are created when using `docker create`.

   docker run -d -it --name devtest \
      --mount type=bind,source=./code,destination=/data \
     my-image
