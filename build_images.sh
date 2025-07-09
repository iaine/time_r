#/bin/bash

#build the images using buildx for both architectures
docker buildx build --platform linux/amd64 -t amdr .

docker buildx build --platform linux/arm64 -t armr .

docker exec amdr /bin/sh -c "wget https://raw.githubusercontent.com/iaine/time_r/refs/heads/main/time_build_r.sh && chmod +x time_build_r.sh && ./time_build_r.sh"

docker exec armr /bin/sh -c "wget https://raw.githubusercontent.com/iaine/time_r/refs/heads/main/time_build_r.sh && chmod +x time_build_r.sh && ./time_build_r.sh"
