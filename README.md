# Mitsuba2_Docker

This repository has a dockerfile for [Mitsuba 2](https://github.com/mitsuba-renderer/mitsuba2).

Please check the following docker hub to see which version of Mitsuba this Dockerfile supports.  
https://hub.docker.com/r/zigzagzackey/mitsuba2_base  
https://hub.docker.com/r/zigzagzackey/mitsuba2_conda  

## How to Use Docker Image

### English
This section explains how to use mitsuba2_base:v2.1.0, which is a basic Docker configuration.  
Docker images created and published in this repository are available on the Docker hub.  
Therefore, you don't need to build it and pull it to use it.  
The commands used are as follows:  
```
docker pull zigzagzackey/mitsuba2_base:v2.1.0
```

If you want to run Docker image and launch a container, you can use the following command.  
```
docker run -it zigzagzackey/mitsuba2_base:v2.1.0
```

If you want to run the mitsuba 2 sample, follow the steps below.  
1. Clone [mitsuba-data](https://github.com/mitsuba-renderer/mitsuba-data).  

2. Execute the following command to launch the docker container.  
Depending on your environment, the clone directory path (= "/Users/ zigzagzackey/workspace") is different.
```
docker run -it -v /Users/zigzagzackey/workspace/mitsuba-data:/root/Mitsuba2_Install/mitsuba-data zigzagzackey/mitsuba2_base:v2.1.0
```

3. Execute the following command.
```
cd Mitsuba2_Install/mitsuba-data/scenes
mitsuba hello.xml
```

4. Done

### Japanese

基本的なDocker構成である”mitsuba2_base:v2.1.0”を元に，使用方法を説明します．  
本リポジトリで作成・公開されているDocker Imageは，Docker hub上で公開されています．  
したがって，使用する際には，buildする必要は無く，pullを行えば問題ありません．  
使用するコマンドは以下のものです．  
```
docker pull zigzagzackey/mitsuba2_base:v2.1.0
```

Docker imageを実行して，コンテナを立ち上げる場合は，以下のコマンドを使うと良いでしょう．  
```
docker run -it zigzagzackey/mitsuba2_base:v2.1.0
```

mitsuba 2のサンプルを実行したいときは，以下の手順を行いましょう．
1. [mitsuba-data](https://github.com/mitsuba-renderer/mitsuba-data)をクローンしてください．  

2. 以下のコマンドを実行して，Dockerコンテナを立ち上げます．  
あなたの環境によって，クローンディレクトリパス(= "/Users/zigzagzackey/workspace)の箇所は異なります．
```
docker run -it -v /Users/zigzagzackey/workspace/mitsuba-data:/root/Mitsuba2_Install/mitsuba-data zigzagzackey/mitsuba2_base:v2.1.0
```

3. 以下のコマンドを実行してください．
```
cd Mitsuba2_Install/mitsuba-data/scenes
mitsuba hello.xml
```

4. 終了

## How to Build Docker Image

### English

Run build_dockerimage.sh when you build the Dockerfile.

Please refer to the following to use build_dockerimage.sh.

Mitsuba v2.2.0の環境構築を行う mitsuba_base:v2.2.0の場合
```
./build_dockerimage.sh v2.2.0
```

### Japanese

Dockerfileをビルドする際には，build_dockerimage.shを実行します．

build_dockerimage.shの使用方法は以下を参考にしてください．

Mitsuba v2.2.0の環境構築を行う mitsuba_base:v2.2.0の場合
```
./build_dockerimage.sh v2.2.0
```