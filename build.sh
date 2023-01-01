docker stop nodeserver 
docker rm nodeserver 
cat password.txt | docker login --username jackmoinc --password-stdin
docker build -t jackmoinc/videoserv:one .
docker push jackmoinc/videoserv:one
docker pull jackmoinc/videoserv:one
docker run -d -it -p 80:80 -p 8080:8080 --name nodeserver jackmoinc/videoserv:one