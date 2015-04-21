# Docker Windshaft

A Docker image with Windshaft and its dependencies preinstalled.

## Installation

1. [Install Docker](https://docs.docker.com/installation/) and [Compose](https://docs.docker.com/compose/#installation-and-set-up).

2. Clone this repository and change the working directory.

    ``` shell
    git clone https://github.com/TerraSeer/docker-windshaft.git
    cd docker-windshaft
    ```

4. Build the image.

    ``` shell
    docker build .
    ```

## Usage

Use this as a base Docker image using the [`FROM`](https://docs.docker.com/reference/builder/#from) instruction.

``` dockerfile
FROM christianbundy/windshaft:latest
```

You can also choose a [prebuilt tag](https://registry.hub.docker.com/u/christianbundy/windshaft/tags/manage/).

``` dockerfile
FROM christianbundy/windshaft:0.42.1
```

## Support

Please [open an issue](https://github.com/TerraSeer/docker-windshaft/issues/new) for support.

## Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](https://github.com/TerraSeer/docker-windshaft/compare/).
