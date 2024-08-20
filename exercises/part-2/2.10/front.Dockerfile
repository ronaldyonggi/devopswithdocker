# Note that this project can't work with a node version higher than 16!! Read the readme
FROM node:16

EXPOSE 5000

# Set starting directory WITHIN CONTAINER to be /usr/src/app
WORKDIR /usr/src/app

# Separate layer of installing dependencies from installing everything. This speeds up layers caching
# in case we need to make changes with the code, so build only need to make change with the code part, 
# not with the dependencies.
COPY package* .
RUN npm install

# Now copy everything else
COPY . .

# ENV REACT_APP_BACKEND_URL=http://localhost:8080/api

# Build static files
RUN npm run build

# Install serve
RUN npm install -g serve

# CMD is executed when the container starts
# CMD [ "serve", "-s", "-l", "5000", "build" ]

# NOTE: Make sure to start frontend server at:

# docker run -p 8080:5000 example-frontend

# AND set backend server to run at:
# docker run -p 7070:8080

# In other words, just make sure 
# -the port at frontend's REACT_APP_BACKEND_URL matches the port where you are accessing the backend container 
# -the port at backend's REQUEST_ORIGIN env matches the port where you are accessing the frontend container 