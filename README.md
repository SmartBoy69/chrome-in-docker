# Run chrome within a docker container
  
Dockerfile for running chrome within a docker box. VNC inclusive.

# Getting started

Build the image:
```
$ docker build -t chrome-box:latest .
```
Start the container:
```
$ docker run --rm --name chrome-box -p 5900:5900 -e VNC_SERVER_PASSWORD=somesecurepassword --user chromeuser --privileged chrome-box:latest
```
This will result in a container where:
* an X11 server is installed
* a display is emulated with the help of xvfb
* the window manager fluxbox is installed
* chrome is installed and started
* you can access the screen with VNC on port 5900 with a vnc client of your choice


# What is this all about

* This whole thing is meant as a basis to testing web applications in an isolated environment (or even integrated within a continous integration pipeline)
* SECURITY WARNING: This will run Chrome somewhat isolated from your OS, but opens a VNC Server where everyone with your super secure password can watch you browsing. Not a very good idea...


# Credits

* Great thanks to https://github.com/stephen-fox/chrome-docker !!