FROM python:3.12
RUN apt-get update -y && \
  apt-get install -y \
    libchromaprint1 \
    gstreamer1.0 \
    python3-gi \
    ffmpeg && \
    pip install -U \
     pip \
     "beets[chroma]"

# Setup permissions
ARG USERNAME
ARG UID
ARG GID
RUN groupadd --gid ${GID} ${USERNAME} && \
  useradd -u ${UID} -g ${GID} -M ${USERNAME}

# Setup folders
USER ${USERNAME}
ENV WORKDIR /work
WORKDIR ${WORKDIR}
