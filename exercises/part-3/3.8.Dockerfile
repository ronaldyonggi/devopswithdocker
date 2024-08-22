# Note that this project can't work with a node version higher than 16!! Read the readme
FROM node:16.20.2-bookworm-slim AS build-stage

# Set starting directory WITHIN CONTAINER to be /usr/src/app
WORKDIR /usr/src/app

COPY package* .

RUN npm install && \
    npm install -g serve

# Now copy everything else
COPY . .

# Build static files
RUN npm run build


# Production stage
FROM node:16.20.2-bookworm-slim

EXPOSE 5000

RUN useradd -m appuser && \
    npm install -g serve

WORKDIR /usr/src/app

COPY --from=build-stage /usr/src/app/build /usr/src/app/build

RUN chown -R appuser .

USER appuser