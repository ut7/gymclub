FROM node:6

RUN npm install -g yarn
COPY yarn.lock package.json /code/
RUN yarn
COPY . /code/

WORKDIR /code
EXPOSE 8080
CMD ["node", "server.js"]

