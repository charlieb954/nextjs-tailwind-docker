# Use a multistage build and production to create a smaller more efficient image

# Stage 1: Build - the application is built and dependencies are installed
FROM node:22-alpine AS builder

# Install necessary dependencies and set the working directory
RUN apk add --no-cache libc6-compat && \
    mkdir -p /app

WORKDIR /app

# Copy package files and install dependencies
COPY nextjs-tailwind-example/package.json nextjs-tailwind-example/package-lock.json ./
RUN npm ci

# Copy the rest of the application code and build the application
COPY nextjs-tailwind-example/ .

# Prune to remove unncessary development dependencies after the build
RUN npm run build && \
    npm prune --production

# Stage 2: Production - the built application is copied from the build stage and run. 
FROM node:22-alpine

# Set the working directory
WORKDIR /app

# Copy the built application from the builder stage
COPY --from=builder /app ./

# Use a non-root user to improve security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Set the command to run the application
CMD ["npm", "start"]