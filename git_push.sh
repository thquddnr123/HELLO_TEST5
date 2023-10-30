#!/bin/bash

# ReadCSV.sh 스크립트 안에 GET_USER_DATA 함수를 불러옵니다
#source /home/ubuntu/ACG/ReadCSV/ReadCSV.sh
source /home/ubuntu/ACG/main.sh
ID=$(EXPORT_ID_DIR)
GITHUB_USERNAME=$(GET_USER_DATA $ID 2)
GITHUB_TOKEN=$(GET_USER_DATA $ID 3)

echo $ID
echo ${GITHUB_USERNAME}
echo ${GITHUB_TOKEN}
# 1: id
# 2: username
# 3 : token
# 4 : email
# Repository name
REPO_NAME="HELLO_TEST4"

# Create the repository on GitHub using the PAT
curl -u "$GITHUB_USERNAME:$GITHUB_TOKEN" https://api.github.com/user/repos -d "{\"name\":\"$REPO_NAME\"}"

# Add, commit, and push the file to the newly created repository
git init
touch test.md
git add .
git commit -m "Initial commit"
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
git remote set-url origin https://$GITHUB_USERNAME@github.com/$GITHUB_USERNAME/$REPO_NAME.git
git branch -M main
git push -u origin main