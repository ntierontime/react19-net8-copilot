# Use an official Node.js runtime as the base image
FROM node:alpine

# Set the working directory in the container to /app
WORKDIR /app

# # Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# # Install the dependencies specified in package.json
RUN npm install

COPY . .

# Expose the port serve will use
EXPOSE 3333

# Build the React application
# RUN npm run build
CMD ["npm", "run", "dev"]
