# Supported tags and respective `Dockerfile` links

-	[`latest` (*Dockerfile*)](https://github.com/InstaZDLL/docker-nginx-webdav/blob/master/Dockerfile)

[![](https://badge.imagelayers.io/sashgorokhov/webdav:latest.svg)](https://imagelayers.io/?images=sashgorokhov/webdav:latest 'Get your own badge on imagelayers.io')

# How to use this image

```console
$ docker run --name webdav -p 80:80 -v /media:/media -d nayeonyny/webdav
```
This will start a webdav server listening on the default port of 80.
Then access it via `http://localhost:80` or `http://host:80` in a browser.

This server will serve files located in your /media folder

Image's supported volumes:
- `/media` - served directory

To restrict access to only authorized users, you can define two environment variables: `USERNAME` and `PASSWORD`
```console
$ docker run --name webdav -p 80:80 -v /media:/media -e USERNAME=webdav -e PASSWORD=webdav -d nayeonyny/webdav
```

# Supported Docker versions

This image is officially supported on Docker version 1.10.2.
Support for older versions (down to 1.6) is provided on a best-effort basis.
Please see [the Docker installation documentation](https://docs.docker.com/installation/) for details on how to upgrade your Docker daemon.

## Environment Variables
The following environment variables can be set when running the Docker container:

| ENV          | Default value | Example | Description                         |
| ------------ | ------------- | ------- | ----------------------------------- |
| TLS\_DISABLE | true          | false   | The name of the WordPress database. |
| USERNAME     | none          | webdav  | The username for the WebDav.        |
| PASSWORD     | none          | webdav  | The password for the WebDav.        |

## Author

- [@sashgorokhov](https://github.com/sashgorokhov)
- [@InstaZDLL](https://github.com/InstaZDLL)


## License


```text
Copyright (c) 2016 Alexander Gorokhov
Copyright (C) 2024 Darwin Lamark

Licensed under the Academic Free License version 3.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://opensource.org/license/afl-3-0-php/

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
   [PlMe]: <https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>
   [PlGa]: <https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md>