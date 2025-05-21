FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get install -y wget
RUN wget http://archive.ubuntu.com/ubuntu/pool/universe/q/qbittorrent/qbittorrent-nox_4.1.7-1ubuntu3_amd64.deb
RUN apt-get install ./qbittorrent-nox_4.1.7-1ubuntu3_amd64.deb -y --allow-downgrades

RUN python3 -m venv mltbenv

COPY requirements.txt .
RUN mltbenv/bin/pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
