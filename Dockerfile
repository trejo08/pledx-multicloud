FROM plexinc/pms-docker
MAINTAINER trejo08

## Installing dependendencies
RUN \
  echo '==============================> preinstall dependencies' && \
  apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    unzip \
    zip \
    s3fs && \
  echo '==============================> dependencies installed' && \
  echo '==============================> postsinstall dependencies' && \
  curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
  unzip rclone-current-linux-amd64.zip && \
  cd rclone-*-linux-amd64 && \
  pwd && \
  ls -l && \
  cp rclone /usr/bin/ && \
  chown root:root /usr/bin/rclone && \
  chmod 755 /usr/bin/rclone && \
  echo '==============================> postsinstall dependencies installed'

## Checking paths for RCLONE and S3FS
RUN \
  which rclone && \
  which s3fs
RUN \
  rclone config show