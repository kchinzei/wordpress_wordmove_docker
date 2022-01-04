# WordPress + WordMove using ftp on Docker

日本語の説明は[こちら](readmej.md)

## Quick start

```shell
> docker-compose up -d
> docker exec -it (PRODUCTION_NAME)_wordmove_1 /bin/bash
root@brabra: ./mysql_fix.sh
root@brabra: wordmove pull --all
root@brabra: exit
> docker-compose stop
```

## Description

This docker is to build WordPress environment with wordmove. All implementation dependent parameters are stored in `.env` file and all you need to do is editing this file to use this container.
Wordmove can choose ssh or ftp based file transfer, it uses ftp to duplicate the remote environment.
Tested by docker on macOS.

### Warning

Ftp is not secure and already obsolete in WordMove. Ssh transfer is recommended when it is available.

## To use this as a template

Edit `.env` file.

### Warning

`.env` file contains critical information such as password. NEVER PUT IT IN GITHUB. For this purpose there is a `.gitignore` file.

## How it works

There are three containers as defined in `docker-compose.yml`.

- `db`: Mysql server
- `wp`: WordPress server
- `wm`: Wordmove host.

You need to login to wordmove container (by `docker exec -it...`).
Before using wordmove, you must modify user permission by `mysql` database by `mysql_fix.sh`,
because mysql 5.7 or greater narrows user permission for processing.
Shell script `mysql_fix.sh` does a least job for wordmove for you.

After that you can use wordmove.
The mysql database is persistently stored in `data/mysql` folder.
The WordPress files are persistently stored in `data/wordpress` folder.

## License

The MIT License (MIT) Copyright (c) K. Chinzei (kchinzei@gmail.com) Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
