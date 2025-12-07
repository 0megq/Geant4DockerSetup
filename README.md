# Geant4 with Qt Visualization Dockerized

This is a dockerized version of the [Geant4 installation for Linux tutorial by Physics Matters](https://www.youtube.com/watch?v=4DTumUo3IKw). This makes it easy to follow along with the rest of the [Physics Matters Geant4 tutorials](https://www.youtube.com/watch?v=xpHeGwHqyzQ&list=PLLybgCU6QCGUYAOwtyI4U8cRL6ig0p3c7&index=3) whether you're on Windows, Linux, or Mac.

## Prerequisites

- Windows & Mac: Install Docker Hub
- Linux: Install Docker Engine

## Building the container

```sh
docker compose up -d
```

## Running the container

```sh
# Start the container
docker start geant4

# Enter the container interactively, alternatively use VSCode and the Docker extension
docker exec -it geant4 bash

# Now you can do whatever geant4 things you want in the container.
# Type `exit` to leave the container

# Stop the container once you've exited it
docker stop geant4
```

## Running an example

```sh
cd /opt/geant4-source/examples/basic/B1
mkdir build
cd build
cmake ..
make
./exampleB1
```
