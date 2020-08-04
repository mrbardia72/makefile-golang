# makefile-golang
create project with makefile 
## 1. run command
```sh
sh install.sh
```
## 2. create structure api(gRPC) for golang
```sh
make api
```
## Output as follows

![alt text](https://i.ibb.co/7nmqx6J/test.png)

## push git
```sh
make git-push m="your-message" $u="https://github.com/your-username/your-repository.git"
```
## commit on git
```sh
make commit m="your-message"
```
## help command
```sh
make help
```
## Output as follows
```sh
proto                          proto the proto file.
server                         Build and run server.
client                         Build and run client.
dep                            Get the dependencies
pkg                            list all pkg golang
api                            api structur
help                           This help.
docker-build                   docker build
docker-run                     docker run
clean                          docker clean
docker-push                    docker push
commit                         commit to github exp. run--- make commit m="your-message"
git-push                       push to github exp. run--- make git-push m="your-message" $u="https://github.com/your-username/your-repository.git"
```