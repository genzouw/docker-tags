# Docker Tags

## Description

This docker image print docker image tags that you choice.

* https://hub.docker.com/r/genzouw/docker-tags

## Requirements

* Docker

## Dependencies

**None**

## Usage

```bash
# Print tags for official image
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

# Print tags for unofficial image
$ docker run --rm genzouw/docker-tags kafkamanager/kafka-manager
2.0.0.2
2.0.0.0-beta
latest
1.3.3.23
1.3.3.22
```

## Relase Note

| date       | version | note                 |
| ---        | ---     | ---                  |
| 2019-08-07 | v1.0.1  | Add paging function. |
| 2019-07-23 | v1.0.0  | first release.       |

## License

This software is released under the MIT License, see LICENSE.

## Author Information

[genzouw](https://genzouw.com)

* Twitter   : @genzouw ( https://twitter.com/genzouw )
* Facebook  : genzouw ( https://www.facebook.com/genzouw )
* LinkedIn  : genzouw ( https://www.linkedin.com/in/genzouw/ )
* Gmail     : genzouw@gmail.com
