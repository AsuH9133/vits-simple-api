INSTALL_DIR=/usr/local/moegoe-simple-api

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
PLAIN='\033[0m'

mkdir -p $INSTALL_DIR
cd $INSTALL_DIR
if [ ! -f config.py ]; then
    echo -e "${YELLOW}下载config.py\n${PLAIN}"
    wget -O $INSTALL_DIR/config.py https://raw.githubusercontent.com/Artrajz/MoeGoe-Simple-API/main/config.py
fi

echo -e "${YELLOW}下载docker-compose.yaml\n${PLAIN}"
wget -O $INSTALL_DIR/docker-compose.yaml https://raw.githubusercontent.com/Artrajz/MoeGoe-Simple-API/main/docker-compose.yaml

echo -e "${YELLOW}即将开始拉取镜像${PLAIN}"
echo -e "${YELLOW}镜像大小为5g，拉取会比较慢\n${PLAIN}"

docker compose pull
docker compose up -d

echo -e "\n已成功升级/安装MoeGoe-simple-api"
echo -e "配置文件目录为 $(realpath $INSTALL_DIR)"
echo -e "${YELLOW}如未导入vits模型则无法使用，请在配置文件目录中导入模型${PLAIN}"
echo -e "导入模型后需重新运行脚本或运行命令docker compose up -d以更新配置文件"
echo -e "${YELLOW}如有疑问可以在issues中提出${PLAIN}"
echo -e "https://github.com/Artrajz/MoeGoe-Simple-API"