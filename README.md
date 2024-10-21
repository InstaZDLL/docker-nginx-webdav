# Supported tags and respective `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/InstaZDLL/docker-nginx-webdav/blob/master/Dockerfile)

[![Version](https://img.shields.io/github/v/release/InstaZDLL/docker-nginx-webdav?style=for-the-badge)](https://github.com/InstaZDLL/docker-nginx-webdav/releases)
[![AFLv3 License](https://img.shields.io/github/license/InstaZDLL/docker-nginx-webdav?logo=e&style=for-the-badge)](https://opensource.org/license/afl-3-0-php)
[![Last commit](https://img.shields.io/github/last-commit/InstaZDLL/docker-nginx-webdav?style=for-the-badge)](https://github.com/InstaZDLL/docker-nginx-webdav/commits/main)
![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/InstaZDLL/docker-nginx-webdav/total?style=for-the-badge&color=%230080ff)

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

## How to use this image

```console
$ docker run --name webdav -p 80:80 -v /media:/media -d nayeonyny/nginx-webdav
```

This will start a webdav server listening on the default port of 80.
Then access it via `http://localhost:80` or `http://host:80` in a browser.

This server will serve files located in your /media folder

Image's supported volumes:

- `/media` - served directory

- `/ssl` - served tls certificate directory

To restrict access to only authorized users, you can define two environment variables: `USERNAME` and `PASSWORD`

```console
$ docker run --name webdav -p 80:80 -v /media:/media -e USERNAME=webdav -e PASSWORD=webdav -d nayeonyny/nginx-webdav
```

## Supported Docker versions

This image is officially supported on Docker version 1.10.2.
Support for older versions (down to 1.6) is provided on a best-effort basis.
Please see [the Docker installation documentation](https://docs.docker.com/installation/) for details on how to upgrade your Docker daemon.

## Environment Variables

The following environment variables can be set when running the Docker container:

| ENV            | Default value | Example | Description                                                   |
| -------------- | ------------- | ------- | ------------------------------------------------------------- |
| TLS\_DISABLE   | true          | false   | The name of the WordPress database.                           |
| OPTIMIZED\_FTC | true          | false   | Will set **sendfile_max_chunk 1m** to the nginx configuration |
| USERNAME       | none          | webdav  | The username for the WebDav.                                  |
| PASSWORD       | none          | webdav  | The password for the WebDav.                                  |

## Author

- [@sashgorokhov](https://github.com/sashgorokhov)
- [@InstaZDLL](https://github.com/InstaZDLL)

## License

```text
Copyright (c) 2016 Alexander Gorokhov
Copyright (C) 2024 Darwin Lamark

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
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