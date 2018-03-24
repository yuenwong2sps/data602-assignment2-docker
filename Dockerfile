FROM python:3.6.1-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache git
		 


WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN git clone https://yuenwong2sps:jonnyGithub2k@github.com/yuenwong2sps/data602-assignment2 data602-assignment2
EXPOSE 5000
CMD [ "python", "/usr/src/app/data602-assignment2/app.py" ]
