# Docker Image for Ember Testing

This Docker image, will setup a system so your ember tests can be executed inside the container itself.

## Supported tags and respective `Dockerfile` links

- [`latest` (Dockerfile)](https://github.com/CareerJSM/docker-emberjs-testing/blob/master/Dockerfile)

## Run the Image

```
docker run --rm -ti -v $PWD:/app -p 7357:7357 lugana707/emberjs-docker-testing:latest bash
```

### Run Your Tests

Now that you are in the container, you can run the following command

```
# ember test --server
```
