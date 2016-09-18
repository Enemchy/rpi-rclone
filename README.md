# rpi-rclone
Build

`docker build --rm -t enemchy/rpi-rclone .`

Run
```
docker run -d \
    -v /storage/dropbox:/home/pi/rclone/Dropbox \
    -v /storage/rclone/.rclone.conf:/root/.rclone.conf \
    --name="rpi-rclone" \
    enemchy/rpi-rclone
  ```
