FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

FROM node:22-alpine AS runtime

RUN adduser -S api

WORKDIR /app

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules

RUN apk add --no-cache tesseract-ocr 

RUN chown -R api /app
USER api
EXPOSE 3000

CMD ["node", "dist/main.js"]
