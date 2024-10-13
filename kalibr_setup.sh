#!/usr/bin/env bash
# set -x
# set -e

# 获取项目根路径
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

sudo apt-get -y install python3-wxgtk4.0
sudo apt-get -y install python3-igraph
sudo apt-get -y install python3-scipy
sudo apt-get -y install libv4l-dev
sudo apt-get -y install libdw-dev

# Kalibr
KALIBR_DIR="${PROJECT_DIR}/src/kalibr"
if [ ! -d "${KALIBR_DIR}" ]; then
    echo "Downloading Kalibr..."
    git clone https://github.com/ethz-asl/kalibr.git "${KALIBR_DIR}"
    # 下载 IMU 标定相关的组件到 Kalibr 目录下
    git clone https://github.com/gaowenliang/imu_utils.git "${KALIBR_DIR}/imu_utils"
    pushd "${PROJECT_DIR}"
    catkin_make -j4
    popd
else
    echo "Kalibr is already installed."
fi

popd >/dev/null

set +x
echo ""
echo "************************************"
echo "Kalibr setup completed successfully!"
echo "************************************"
