FROM node:20-slim
WORKDIR /app
COPY . .
RUN npm ci && npm run build -w api && npm run build -w mcp
RUN npm install -g supergateway
ENV PORT=3000
ENV REVOLUTX_API_KEY=""
ENV REVOLUTX_PRIVATE_KEY=""
EXPOSE 3000
CMD supergateway --stdio "node /app/mcp/dist/index.js" --port 3000 --ssePath /sse --messagePath /message
