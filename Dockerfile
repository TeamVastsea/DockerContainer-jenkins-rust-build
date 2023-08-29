FROM jenkins/jenkins:lts
LABEL authors="Snowball_233"

# 切换为 root 用户
USER root

# 初始化
RUN \
  ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
  echo 'Asia/Shanghai' > /etc/timezone && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y htop man vim neofetch

# 安装 Rustup
RUN \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# 将 Rust 工具链添加到 PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# 清除构建缓存
RUN \
  apt-get clean && \
  apt-get autoclean && \
  rm -rf /var/lib/apt/lists/*

# 切换为 jenkins 用户
USER jenkins