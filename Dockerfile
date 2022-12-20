FROM --platform=linux/amd64  python:3.9
WORKDIR /usr/src
RUN apt-get -y update
RUN apt install wget
RUN apt install unzip  

RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/` curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN mkdir chrome
RUN unzip /tmp/chromedriver.zip chromedriver -d .
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY main.py .


RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \ 
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable 

CMD [ "python", "main.py" ]