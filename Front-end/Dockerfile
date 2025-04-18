# Use official Node.js image as base
FROM node:14

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json /app/
RUN npm install

# Copy the rest of the application
COPY . /app/

# Expose port 3000
EXPOSE 8080

# Start the front-end app
CMD ["npm", "run", "serve"]
