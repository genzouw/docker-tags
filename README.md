# Docker Tags

[![Docker Pulls](https://img.shields.io/docker/pulls/genzouw/docker-tags.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/docker-tags/)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/genzouw/docker-tags.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/docker-tags/)

[![dockeri.co](https://dockeri.co/image/genzouw/docker-tags)](https://hub.docker.com/r/genzouw/docker-tags)

## Description

This docker image print docker image tags that you choice.

* https://hub.docker.com/r/genzouw/docker-tags

## Requirements

* Docker

## Dependencies

**None**

## Usage

*If possible, it is recommended to set the following aliases in startup scripts such as `.bashrc` and` .bashrc`.*

```bash
# For Bash
echo 'alias docker-tags="docker run --rm genzouw/docker-tags"' >> ~/.bashrc
echo 'alias dtags="dtags"' >> ~/.bashrc

# For Zsh
echo 'alias docker-tags="docker run --rm genzouw/docker-tags"' >> ~/.zshrc
echo 'alias dtags="dtags"' >> ~/.zshrc
```

Let's use it immediately.

```bash
# Print tags for official image.
## The paging condition is 5 pages by default.
$ docker run --rm genzouw/docker-tags library/mysql
latest
8.0.17
8.0
8
5.7.27
5.7
5.6.45
5.6
5
8.0.16

# For official images, "library /" can be omitted.
$ docker run --rm genzouw/docker-tags mysql
latest
8.0.17
8.0
8
5.7.27
5.7
5.6.45
5.6
5
8.0.16

# Print tags for unofficial image
$ docker run --rm genzouw/docker-tags kafkamanager/kafka-manager
2.0.0.2
2.0.0.0-beta
latest
1.3.3.23
1.3.3.22

# To output all tags, add the "-f" option. This will take some time.
$ docker run --rm genzouw/docker-tags -f mysql

# To output the specified number of pages, add the "-p" option.
$ docker run --rm genzouw/docker-tags -p 8 mysql
```

## License

This software is released under the MIT License, see LICENSE.

## Author Information

[genzouw](https://genzouw.com)

* Twitter   : @genzouw ( https://twitter.com/genzouw )
* Facebook  : genzouw ( https://www.facebook.com/genzouw )
* LinkedIn  : genzouw ( https://www.linkedin.com/in/genzouw/ )
* Gmail     : genzouw@gmail.com
