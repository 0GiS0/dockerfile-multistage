#This is the image that I use as base
FROM node:14-alpine

ENV NODE_ENV production

#Set the /app path as the working directory to host my application, install dependencies, etc..
WORKDIR /app

#Copy the files package.json and package-lock.json(the asterisk if it exists) in the root of my working directory, /app.
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]

#Install the dependencies of my application, by executing the command npm install
RUN npm install --silent --production && mv node_modules ../

#Copy the rest of the files to the /app directory
COPY . .

#Add as metadata the port my application listens on
EXPOSE 3000

#Add one more metadata which is which command will be executed when a container is generated from this image
CMD ["npm", "start"]