#!/bin/bash

#~git_push 함수
function CLONE_GIT_REPO() {
    # 매개변수를 받아옵니다.
    ID="$1"

    GITHUB_USERNAME=$(GET_USER_DATA "${id}" 2)
    GITHUB_TOKEN=$(GET_USER_DATA "${id}" 3)
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
}

CLONE_GIT_REPO ${GET_USER_DATA}