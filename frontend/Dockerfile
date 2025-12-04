# Stage 1: Build
FROM node:18-alpine as build

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app files
COPY . .

# Build arguments
ARG REACT_APP_BASE_URL
ARG REACT_APP_IMAGE_URL

# Create .env.production file
RUN echo "REACT_APP_BASE_URL=${REACT_APP_BASE_URL}" > .env.production && \
    echo "REACT_APP_IMAGE_URL=${REACT_APP_IMAGE_URL}" >> .env.production

# Build React app
RUN npm run build

# Stage 2: Production
FROM nginx:alpine

# Copy built app
COPY --from=build /app/build /usr/share/nginx/html

# Copy nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]