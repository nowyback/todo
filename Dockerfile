# Todoodle Server Docker Container
FROM node:16-alpine

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apk add --no-cache curl

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Create non-root user for security
RUN addgroup -g todoodle todoodle && \
    adduser -D -s /bin/sh -g todoodle todoodle

# Copy application files
COPY --chown=todoodle:todoodle . .

# Create necessary directories
RUN mkdir -p data logs backups && \
    chown -R todoodle:todoodle data logs backups

# Expose port
EXPOSE 3001

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3001/api/health || exit 1

# Switch to non-root user
USER todoodle

# Start the server
CMD ["npm", "start"]
