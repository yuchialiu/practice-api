FROM mysql:8

EXPOSE 3306

COPY practice_user.sql /docker-entrypoint-initdb.d/practice_user.sql

FROM node:slim

EXPOSE 3000

COPY . .

RUN npm install

CMD ["node", "server.js"]
