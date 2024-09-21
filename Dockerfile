FROM node:20 AS base

### <JANGAN DIGANTI>
ARG STUDENT_NAME
ARG STUDENT_NIM

ENV NUXT_STUDENT_NAME ${STUDENT_NAME}
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}
### </JANGAN DIGANTI>

# TODO: code disini
FROM node:20

WORKDIR /usr/src/app

COPY package.json pnpm-lock.yaml ./

RUN npm install

RUN npm run build

RUN npm install -g pnpm && pnpm install

COPY . .

RUN pnpm run build

EXPOSE 80

CMD ["pnpm", "start"]
