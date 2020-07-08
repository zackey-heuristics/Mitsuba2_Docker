# Usage

## Pull
```
docker pull zigzagzackey/mitsuba2_conda:v2.1.0
```

## Run
```
docker run -it zigzagzackey/mitsuba2_conda:v2.1.0
```

## Run Example
```
docker run -it -v /Users/zigzagzackey/workspace/mitsuba-data:/root/Mitsuba2_Install/mitsuba-data zigzagzackey/mitsuba2_conda:v2.1.0
```

```
cd Mitsuba2_Install/mitsuba-data/scenes
mitsuba hello.xml
```