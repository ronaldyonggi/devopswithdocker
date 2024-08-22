FROM golang:1.23-alpine as build-stage

EXPOSE 8080

WORKDIR /go/src/app

COPY . .

# RUN adduser -D appuser && \
#     chown -R appuser . 

# USER appuser

RUN go build && \
    go test ./...

# PRODUCTION
FROM scratch

EXPOSE 8080 

WORKDIR /go/src/app
COPY --from=build-stage /go/src/app/server /go/src/app/server
