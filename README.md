## Prerequisites

- Windows & Mac: Install Docker Hub
- Linux: Install Docker Engine

## Building and running the container:

docker compose up -d

## Running an example:

docker exec -it geant4 bash

cd /opt/geant4-source/examples/basic/B1
mkdir build
cd build
cmake ..
make
./exampleB1
