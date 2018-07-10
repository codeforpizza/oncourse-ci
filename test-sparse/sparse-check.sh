#!/bin/bash

# Service related variable
serviceName=$1
servicePath=$2

# git related variable
gitURI=$3
gitBranch=$4
gitToken=$5

echo "Running Sparse Checkout for $servicePath from $gitURI on branch $gitBranch"

# Initializing git folder
mkdir -p $serviceName
cd $serviceName

# Initializing git sparse
git init
git config core.sparsecheckout true

echo $servicePath >> .git/info/sparse-checkout

git remote add origin $gitURI

git pull origin $gitBranch

echo "Sparse Checkout Complete"

