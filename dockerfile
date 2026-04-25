# ─── Stage 1: base ────────────────────────────────────────
FROM node:20-alpine AS base
WORKDIR /app
ENV NODE_ENV=production

# ─── Stage 2: build ───────────────────────────────────────
FROM base AS build

# 의존성 파일 먼저 복사 → 레이어 캐시 최대화
COPY package*.json ./
RUN npm install 

# 소스 복사 후 빌드 (TypeScript 등)
COPY . .

EXPOSE 3000

CMD ["npm", "start"]