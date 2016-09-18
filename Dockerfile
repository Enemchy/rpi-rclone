FROM hypriot/rpi-golang

MAINTAINER enchy <liquidest@gmail.com>

WORKDIR /root

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends unzip wget cron

RUN wget http://downloads.rclone.org/rclone-v1.33-linux-arm.zip \
        && unzip rclone-v1.33-linux-arm.zip \
        && mv rclone-v1.33-linux-arm/rclone /bin \
        && chmod 755 /bin/rclone \
        && mkdir /root/rclone \
        && touch /var/log/cron.log \
        && crontab -l | { cat; echo "*/2 * * * * rclone move Dropbox:/torrents /home/pi/rclone/Dropbox/ >> /var/log/cron.log 2>&1"; } | crontab -

CMD cron && tail -f /var/log/cron.log
