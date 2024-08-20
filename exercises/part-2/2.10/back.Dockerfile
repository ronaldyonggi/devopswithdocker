FROM golang:1.16

EXPOSE 8080

WORKDIR /go/src/app

COPY . .

RUN go build

RUN go test ./...

# ENV PORT=8080
# ENV REQUEST_ORIGIN=http://localhost

# CMD ["./server"]

# NOTE: Make sure to start frontend server at:

# docker run -p 8080:5000 example-frontend

# AND set backend server to run at:
# docker run -p 7070:8080

# In other words, just make sure 
# -the port at frontend's REACT_APP_BACKEND_URL matches the port where you are accessing the backend container 
# -the port at backend's REQUEST_ORIGIN env matches the port where you are accessing the frontend container 