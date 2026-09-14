# Use Node.js 24 (Alpine for a smaller footprint) as required by package.json
FROM node:24-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker layer caching
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application for production (compiles to dist/)
RUN npm run build

# Expose the default Vite preview port
EXPOSE 4173

# Start the built-in Vite server and bind it to all network interfaces
#CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0", "--port", "4173"]
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "4173"]
