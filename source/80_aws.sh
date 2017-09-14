function ecr_login {
    eval $(aws ecr get-login --region ap-southeast-2 --no-include-email --profile rescd)
}

function ecr_repos {
    aws ecr describe-repositories --profile rescd --region ap-southeast-2 | jq '.repositories[].repositoryName'
}

function ecr_repos_all {
    aws ecr describe-repositories --profile rescd --region ap-southeast-2
}

function ecr_images {
    aws ecr list-images --repository-name $1 --profile rescd --region ap-southeast-2 | jq '.imageIds[] | select(has("imageTag")) | .imageTag' | tr -d '"' | sort
}

function ecr_images_all {
    aws ecr list-images --repository-name $1 --profile rescd --region ap-southeast-2
}
