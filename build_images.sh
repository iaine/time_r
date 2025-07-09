#/bin/bash

#build the images using buildx for both architectures
docker buildx build --platform linux/amd64 -t amdr .

docker buildx build --platform linux/arm64 -t armr .

docker run -t amdr:latest /bin/bash -c "mkdir workspaces && cd workspaces && git clone https://github.com/r-devel/r-dev-env.git && cd r-dev-env && wget https://raw.githubusercontent.com/iaine/time_r/refs/heads/main/time_build_r.sh && chmod +x time_build_r.sh && ./time_build_r.sh"

docker run -t armr:latest /bin/bash -c "mkdir workspaces && cd workspaces && git clone https://github.com/r-devel/r-dev-env.git && cd r-dev-env && wget https://raw.githubusercontent.com/iaine/time_r/refs/heads/main/time_build_r.sh && chmod +x time_build_r.sh && ./time_build_r.sh"
