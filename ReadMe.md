## fabric8 hawtio docker image

This project builds a [docker](http://docker.io/) image for running the [hawtio web console](http://hawt.io/) which is used by the [fabric8](http://fabric8.io/) project to provide a universal console to [Kubernetes](http://kubernetes.io) and [OpenShift](http://openshift.github.io/).

Exposes port: **8080**

### to run it:

    docker run -p 9282:8080 -it fabric8/hawtio

If you are running [Kubernetes](http://kubernetes.io) or [OpenShift](http://openshift.github.io/) then try this: (where KUBERNETES_MASTER should point to your master REST API such as <code>http://localhost:8080</code>)

    docker run -p 9282:8080 -it -e KUBERNETES_MASTER=$KUBERNETES_MASTER fabric8/hawtio

Then access it on your docker host at 9282.

* linux: if you have native docker then try: http://localhost:9282
* non-linux: it will be on the docker host such as: http://dockerhost:9282  where _dockerhost_ should point to the ip address returned by

    boot2docker ip

If you are not on linux [this article](http://viget.com/extend/how-to-use-docker-on-os-x-the-missing-guide) describes how its a good idea to define **dockerhost** to point to your boot2docker ip address via:

    echo $(docker-ip) dockerhost | sudo tee -a /etc/hosts

Then you can easily access anything running on your docker host without having to setup port forwarding.

Building the docker container locally
-------------------------------------

We have a Docker Index trusted build setup to automatically rebuild the fabric8/hawtio container whenever the [Dockerfile](https://github.com/fabric8io/hawtio-docker/blob/master/Dockerfile) is updated, so you shouldn't have to rebuild it locally. But if you want to, here's now to do it...

Once you have [installed docker](https://www.docker.io/gettingstarted/#h_installation) you should be able to create the containers via the following:

    git clone git@github.com:fabric8io/hawtio-docker.git
    cd hawtio-docker
    ./build.sh

The hawtio docker container should then build.
