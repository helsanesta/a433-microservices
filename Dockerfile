# mengunduh base image bernama node dari Docker Hub dengan tag 14-alpine3.15
FROM node:14-alpine3.15

# memasang beberapa package seperti python2, g++, dan make.
RUN apk add --no-cache python2 g++ make

# membuat directory baru bernama app di dalam container dan menjadikannya sebagai working directory
WORKDIR /app

# menyalin semua berkas yang ada di local working directory
COPY . .

# Menentukan agar aplikasi berjalan dalam production mode dan menggunakan container bernama item-dbsebagai database host
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies untuk production dan kemudian build aplikasi.
RUN npm install --production --unsafe-perm && npm run build

# Saat container diluncurkan, menjalankan server dengan perintah npm start.
CMD ["npm", "start"]

# mengekspos port yang akan digunakan oleh container, yakni 8080. 
EXPOSE 8080