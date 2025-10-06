# --- Base image ---
FROM node:20-bullseye

# Set working directory inside container
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy only package files first (better caching)
COPY package.json pnpm-lock.yaml* ./

# Install dependencies
RUN pnpm install 

# Copy the rest of your project
COPY . .

# Build the project (if your project has a build step)
RUN pnpm build

# Expose app port (change if your app uses a different one)
EXPOSE 3000

# Start the app (adjust if you have a different start script)
CMD ["pnpm", "start"]
