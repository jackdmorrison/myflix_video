docker stop nodeserver 
docker rm nodeserver 
cat password.txt | docker login --username jackmoinc --password-stdin
docker build -t jackmoinc/videoserv:two .
docker push jackmoinc/videoserv:two
docker pull jackmoinc/videoserv:two
docker run -d -it -p 80:80 -p 4000:4000 --name nodeserver jackmoinc/videoserv:two