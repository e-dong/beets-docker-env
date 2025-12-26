FROM python:3.12
RUN apt-get update -y && \
  apt-get install -y \
    libchromaprint1 \
    gstreamer1.0 \
    python3-gi \
    ffmpeg

# Setup permissions
ARG USERNAME
ARG UID
ARG GID
RUN groupadd --gid ${GID} ${USERNAME} && \
  useradd -u ${UID} -g ${GID} -m -s /bin/bash ${USERNAME}

RUN cd / && python3 -m venv venv && \
  chown -R ${UID}:${GID} /venv

# Setup folders
USER ${USERNAME}
ENV WORKDIR /work
WORKDIR ${WORKDIR}
RUN mkdir -p /home/${USERNAME}/.cache

RUN /venv/bin/pip install -U \
     pip \
     "beets[chroma]" \
     yt-dlp

RUN echo "source /venv/bin/activate" > /home/${USERNAME}/.bash_profile && \
  chmod u+x /home/${USERNAME}/.bash_profile
