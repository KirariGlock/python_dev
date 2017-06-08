# Dockerfile Python 3.6.1
This asset builds Python 3.6.1 development environment on CentOS.

# Installation
docker build -t="docker_dev" .

# Usage
docker run -v <hostpath>:/home -it docker_dev bash
