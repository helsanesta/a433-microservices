# build sebuah Docker image menggunakan Dockerfile yang tadi dibuat dengan nama item-app dan tag v1.
docker build -t item-app:v1 .

# Melihat daftar image di lokal
docker images

# Mengubah nama image agar sesuai dengan format Docker Hub
docker tag item-app:v1 helsanesta/proyek1-item-app:v1

# Login ke Docker Hub Via terminal
echo $PASSWORD_DOCKER_HUB | docker login -u helsanesta --password-stdin

# Mengunggah image ke Docker Hub
docker push helsanesta/proyek1-item-app:v1