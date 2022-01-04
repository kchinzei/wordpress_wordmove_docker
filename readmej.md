# WordPress + WordMove using ftp on Docker

English version [here](readme.md).

## 用例

```shell
> docker-compose up -d
> docker exec -it (PRODUCTION_NAME)_wordmove_1 /bin/bash
root@brabra: ./mysql_fix.sh
root@brabra: wordmove pull --all
root@brabra: exit
> docker-compose stop
```

## このレポジトリについて

WordPressとwordmoveを持つDockerコンテナです．`.env`ファイルに環境固有の変数をまとめてあるので委嘱が容易です．wordmoveではsshとftpが利用できますが，このレポジトリではftpを使っています．macOSでテストしています．

### 警告

ftpはセキュアでなく，wordmoveでは既にオブソリートです．sshが使える場合はそちらの利用を進お勧めします．

## このレポジトリをテンプレートとするには

`.env`ファイルを編集してください．

### 警告

`.env`ファイルはパスワード等を含んでいるので，github等にアップロードしないこと．そのために`.gitignore`に含めてある．

## 仕組み

３つのコンテナが`docker-compose.yml`にて定義されている．

- `db`: mysqlサーバー
- `wp`: WordPressサーバー
- `wm`: wordmoveホスト

Wordmoveを使うには，`wm`コンテナにログインする (`docker exec -it...`)．
Wordmoveを使い始める前に，`mysql_fix.sh`を使って`mysql`データベースのユーザー権限を変更する．
mysql 5.7以降はデフォルトでユーザーに与えられる権限が狭く，wordmoveでエラーが出るためである．
シェルスクリプト`mysql_fix.sh`はwordmoveを使うための最小の準備をする．
その後，wordmoveを使うことができる．

mysqlデータベースは`data/mysql`に，WordPressファイルは`data/wordpress`に永続化される．

## License

The MIT License (MIT) Copyright (c) K. Chinzei (kchinzei@gmail.com) Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
