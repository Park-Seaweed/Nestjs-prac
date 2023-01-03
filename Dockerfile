# # Step 1
# ## base image for Step 1: Node 10
# FROM node:10 AS builder
# WORKDIR /app
# ## 프로젝트의 모든 파일을 WORKDIR(/app)로 복사한다
# COPY . .
# ## Nest.js project를 build 한다
# RUN npm install
# RUN npm run build
 
# # Step 2
# ## base image for Step 2: Node 10-alpine(light weight)
# FROM node:10-alpine
# WORKDIR /app
# ## Step 1의 builder에서 build된 프로젝트를 가져온다
# COPY --from=builder /app ./
# ## application 실행
# CMD ["npm", "run", "start:prod"]
# Base image
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN npm install --legacy-peer-deps

# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
RUN npm run build

# Start the server using the production build
CMD [ "node", "dist/main.js" ]
