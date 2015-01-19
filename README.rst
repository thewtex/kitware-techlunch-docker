An Introduction Docker for Research Software Engineers
=======================================================
Kitware Tech Lunch
------------------

:Date:   2015-02-10
:Author: Matt McCormick <matt.mccormick@kitware.com>

Introduction
------------

Docker is a new technology that has caught the software industry by storm.
Docker is a new type of tool to easily build, ship, and run reproducible,
binary applications.  In this talk, we will introduce Docker from the
perspective of a scientific research software engineer.

We will

1) Generate an understanding of what Docker is by comparing it to existing
   technologies.
2) Give an introduction to basic Docker concepts.
3) Go through examples that demonstrate when and how it is advantageous to
   take advange of this tool.


Run the Presentation Live, Locally
-------------------------------

All the software required to run the presentation is available in the provided
Docker_ image. This image is based of the image_ presented on `Modern Scientific
Computing with Python`_ at IEEE NSS/MIC 2014.

Install Docker
..............

To install Docker, follow the `online installation instructions
<https://docs.docker.com/installation/>`_.

Import the Docker Image
.......................

There are two options to import the Docker image.

Pull the image from DockerHub_.
  DockerHub_ is an online repository of docker images that makes it easy to
  search, push, and pull images from public or private repositories. To
  download the image from DockerHub::

    docker pull thewtex/kitware-techlunch-docker

Build the image from its sources.
  Docker images are created from a set of instructions that are stored in a
  *Dockerfile*. These are the set of commands that are used to set up the
  image, like installing packages, compiling dependencies, editing
  configurations, etc.  To build the image::

    git clone https://github.com/thewtex/kitware-techlunch-docker
    cd kitware-techlunch-docker
    ./build.sh

Run the Docker Image
....................

To run the IPython notebook server::

  ./run.sh MakeAPassword

This command should be executed from the directory containing the `*.ipynb`
notebook files so `$PWD` will make the notebook files available to the docker
container. Replace *MakeAPassword* with a password of your choice.

Docker container port 8888, where the IPython notebook server is listening for
connections, will be forwarded to the localhost on port 443. To connect to the
notebook server, point your browser to *https://localhost/*.

.. note::

  On OSX and Windows, extra steps are required to find the address and the
  port that the container has been forwarded to.  In a Boot2Docker shell,
  run::

    boot2docker ip

  This should return an address like *192.168.59.103*.  Next, find the port
  in the docker environment with::

    docker port notebook 8888

  This should return a port like *49153*.

  Port your browser to the resulting address and port; for example:
  *https://192.168.59.103:49153*.

After connecting to the container, an "untrusted connection" warning from your
browser is expected.

To list the running containers::

  docker ps

To list the running and stopped containers::

  docker ps -a

To stop the container::

  docker stop techlunch

To start the container again::

  docker start techlunch

To remove the container::

  docker rm techlunch


.. _IPython: http://ipython.org/
.. _Docker: https://www.docker.com/
.. _DockerHub: https://hub.docker.com/
.. _Modern Scientific Computing With Python: https://github.com/thewtex/ieee-nss-mic-scipy-2014
.. _image: https://github.com/thewtex/docker-ieee-nss-mic-scipy-2014
