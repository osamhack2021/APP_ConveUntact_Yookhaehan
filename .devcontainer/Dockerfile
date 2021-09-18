# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.191.1/containers/codespaces-linux/.devcontainer/base.Dockerfile

FROM mcr.microsoft.com/vscode/devcontainers/universal:1-focal

USER root

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

USER codespace

RUN mkdir /home/codespace/opt && cd /home/codespace/opt && git clone https://github.com/flutter/flutter.git -b stable && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip && \
    unzip commandlinetools-linux-7583922_latest.zip && \
    mkdir android-sdk && mkdir android-sdk/platform-tools && mkdir android-sdk/cmdline-tools && \
    mv cmdline-tools android-sdk/cmdline-tools/latest && \
    rm commandlinetools-linux-7583922_latest.zip

ENV PATH $PATH:/home/codespace/opt/flutter/bin
ENV ANDROID_SDK_ROOT /home/codespace/opt/android-sdk
ENV PATH $PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
ENV PATH $PATH:$ANDROID_SDK_ROOT/platform-tools

RUN sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "platforms;android-30" "build-tools;30.0.3" && \
    flutter config --android-sdk $ANDROID_SDK_ROOT && \
    flutter precache 

