FROM python:alpine

RUN apk update && apk upgrade && \
    apk add --no-cache git

RUN apk --update add --no-cache \ 
    gcc \
    freetype-dev

RUN apk add python py-pip python-dev 

# Install dependencies
RUN apk add --no-cache --virtual .build-deps \
    gfortran \
    musl-dev \
    g++
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h



WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN git clone https://yuenwong2sps:jonnyGithub2k@github.com/yuenwong2sps/data602-assignment2 data602-assignment2
EXPOSE 5000
CMD [ "python", "/usr/src/app/data602-assignment2/app.py" ]
