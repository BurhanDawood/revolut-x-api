FROM node:20-slim
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build -w api
RUN npm run build -w mcp
RUN npm install -g supergateway
EXPOSE 3000
CMD ["supergateway", "--stdio", "node mcp/dist/index.js", "--port", "3000", "--ssePath", "/sse", "--messagePath", "/message"]
