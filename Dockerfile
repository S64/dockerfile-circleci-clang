FROM s6464/clang:latest

RUN apt-get update --yes && apt-get dist-upgrade --yes \
    && apt-get install --yes --no-install-recommends git make curl gnupg ca-certificates build-essential python2.7 cmake \
    && rm -rf /var/lib/apt/lists/*

ENV RUNNING_USER_NAME circleci
ENV RUNNING_USER_GROUP circleci
ENV RUNNING_USER_UID 3434
ENV RUNNING_USER_GID 3434

RUN groupadd --gid ${RUNNING_USER_GID} ${RUNNING_USER_GROUP} \
    && useradd --uid ${RUNNING_USER_UID} --gid ${RUNNING_USER_GID} --shell /bin/bash --create-home ${RUNNING_USER_NAME}
USER ${RUNNING_USER_NAME}
ENV HOME /home/${RUNNING_USER_NAME}
