cat > config.env <<- "EOF"
REPO_PKG = package user \n\n   \n\n func main() { \n\n\n }
cmd_c =cmd/client
cmd_s =cmd/server
service_c =service/client
service_s =service/server
repo_user =repository/user
main_pkg =package main \n\n   \n\n func main() { \n\n\n }
EOF

cat > version.sh <<- "EOF"
go version
EOF

chmod a+x version.sh
