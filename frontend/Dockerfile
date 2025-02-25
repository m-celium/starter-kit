FROM node:22-alpine AS builder

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

FROM node:22-alpine AS production

WORKDIR /app

COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/package.json .
COPY --from=builder /app/node_modules ./node_modules

RUN adduser -S frontend && \
    chown -R frontend /app

USER frontend

EXPOSE 3000 

CMD ["npm","run","start"]
