FROM debian:8

WORKDIR /code

COPY kras-en.nmea kras-en.nmea

RUN apt-get update && \
    apt-get install -y \
      gpsd-clients  \
      wget \
      python2.7 \
      python-gps
COPY . .

EXPOSE 2948

ENTRYPOINT ["python2", "/usr/bin/gpsfake", "-P", "2948", "-t", "-c 1", "-l", "-D5", "-n" , "kras-en.nmea"]
