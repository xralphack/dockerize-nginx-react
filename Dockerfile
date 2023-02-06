FROM node:16 as builder
WORKDIR /usr/src/app
COPY . .
RUN yarn
RUN npx browserslist@latest --update-db && yarn build

FROM nginx:alpine
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
