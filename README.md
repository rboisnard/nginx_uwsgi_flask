# Migrating a simple Flask application to NGINX/uWSGI
> ***work in progress***

Welcome here,

In this repository we have a fork of *[generate-tiny-url](https://github.com/tkrishtop/generate-tiny-url)*, a simple Flask application, which is ***modified to run with NGINX and uWSGI***. The main interest here is to show the changes required for that.

**The changes include**:
* Run the web application with uWSGI
* Serve the web application through NGINX
* Adapt the configuration for Heroku
* Modify the CI
* General cleanup

The result can be *[accessed here](https://nginx-uwsgi-flask.herokuapp.com/)*

![app_screenshot](readme/screenshot.png)

**Technical choices**:
* *Why not use Heroku's WSGI servicing solution? Because that's not what this repository is about, I intended to use NGINX*
* *Why not use NGINX wsgi capability by sharing a unix socket? Because Heroku doesn't allow sharing volumes between containers, I used a simple reverse proxy instead*
* *Why NGINX? Why uWSGI? Because creating random rules and exploring them is fun*

---
### Original info from *[generate-tiny-url](https://github.com/tkrishtop/generate-tiny-url)*

[This is] a Flask application for tiny URL generation.
The application itself is pretty basic, and the main interest
here is a fully automated GitHub Actions pipeline for the deployment on  Heroku:
* Build dockerized Flask application.
* Boot Flask container and fail if it's not running.
* GateKeeper: run test suite on booted container with application context 
and fail if tests are not 100%.
* Tag the container following Heroku naming conventions.
* Login to Heroku and Heroku registry and push the tagged image.
* Deploy pushed docker image on Heroku.