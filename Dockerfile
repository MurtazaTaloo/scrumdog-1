FROM node:carbon

# Create app directory
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

RUN npm --depth 9999 update
RUN npm rebuild node-sass

# If you are building your code for production
# RUN npm install --only=production
COPY config.json.vanilla config.json

# Bundle app source
COPY . .


RUN npm run build

EXPOSE 4040

CMD [ "npm", "start" ]
