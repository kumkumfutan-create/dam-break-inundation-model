FROM node:22-bookworm

WORKDIR /app

RUN corepack enable
RUN corepack prepare pnpm@10.18.0 --activate

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY patches ./patches

RUN pnpm install --no-frozen-lockfile

COPY . .

RUN pnpm build

ENV PORT=10000

EXPOSE 10000

CMD ["pnpm", "start"]
