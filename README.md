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

    docker
    make

### Configuration

    if a private Docker repository to be used, change the first line in Makefile for the appropriate host name.

    docker push <your repo host name/image> to be used after the build is complete.

### Build

    make distclean
    make

    This takes a good cofee break. The build process is optimized for the USA East Coast, you mileage may slightly vary.

### Deployment

    skipped for simplicity. Any variation of Ansible / Vagrant / Kubernetes can be used. The tests are to be
    run at localhost.

### To run

    docker run -d --restart=always -p 5000:<your favorite port number> emc2/fiboserver

    The server is up at <your favorite port number>. Challenge it with a test, where it is run at port 5000.

### To test

    make test

    A successful test must be silent.

## Known bugs

    leading slashes `/' are ignored, thus "/2" is a legitimate input and produces 2 Fibonacci numbers. That is a feature of REST sitting behind.
