# First n Fibonacci numbers

This is a web server implementing:

- The web service accepts a number, n, as input and returns the first n Fibonacci numbers, starting from 0. I.e. given n = 5, appropriate output would represent the sequence "0 1 1 2 3".
- Given a negative number, it responds with an appropriate error.


## The project shows

* use of Git
* use of Docker
* building Linux images from scratch
* Alpine Linux distribution
* deployment of CPAN modules
* web services using Poet::Mason framework
* REST service
* a web applicaiton and surrounding infrastructure ready to be maintained for the next 5 years

### Build prerequisites

* docker
* GNU make

The user should have sufficient rights to run `docker' without priviledge escalation, see
"[Giving non-root access](https://docs.docker.com/engine/installation/binaries/#giving-non-root-access)"
for further discussion.

### Configuration

If a remote Docker repository to be used, change the first line in Makefile for the appropriate host name.

    docker push <your repo host name/image>

to be used after the build is complete.

### Build

    make clean
    make

The build takes a good cofee break. It is optimized for the USA East Coast, you mileage may slightly vary.

### To test

    make test

A successful test must be silent.

### To run

    make serve

Starts the service at port 5000. If you run Docker at your localhost, simply open http://localhost:5000 and start entering the numbers.

To have web service available at port 5005, run:

    docker run -d --restart=always -p 5000:5005 emc2/fiboserver

Change 5005 to the desired, if necessary.

### Hosted Deployment

Skipped as provisioning/hosting is not defined. Any variation of Ansible / Vagrant / Kubernetes can be used as Docker images
are rather easy to handle.

## Known bugs

leading slashes `/' are ignored, thus "/2" is a legitimate input and produces 2 Fibonacci numbers. This is a _feature_ of REST sitting behind.
