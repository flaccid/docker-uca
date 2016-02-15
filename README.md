# docker-uca

RightScale's Universal Cloud Appliance in a Docker container.

## Usage

Refer to the documentation for general download and installation:
 - http://uca.surge.sh/uca/reference/install_uca.html
 - http://uca.surge.sh/uca/reference/register_uca.html

### Building the Docker image

Fetch the UCA binary package:

    $ ./fetch.sh

Build locally:

    $ docker build -t uca .

#### Tag and Push

    $ docker tag uca flaccid/uca
    $ docker push flaccid/uca

### Initial Configuration & Runtime

First we run the UCA in config mode (default) in the foreground
and let it exit once complete:

    $ docker run -it --rm --name uca \
        -v uca-data:/opt/uca
        -e WSTUNNEL_TOKEN=ACME-long-secret-tunnel-token-303 \
        -e REFRESH_TOKEN='e16a..92' \
        -e API_HOST=us-4.rightscale.com \
        -e WSTUNNEL_HOST=wstunnel10-1.rightscale.com uca

Then run the appliance detached using the named volume:

    $ docker run -itd --name uca -v uca-data:/opt/uca uca /opt/uca/uca run

Note: if needing to remove the lock file in the volume, run the container
with the following command:

    $ docker run -it -v uca-data:/opt/uca uca rm /opt/uca/uca-db.lock


License and Authors
-------------------
- Author: Chris Fordham (<chris@fordham-nagy.id.au>)

```text
Copyright 2015, Chris Fordham

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
