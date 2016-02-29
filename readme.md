# Dev box
In my current dev set up, we have a windows box where we have all our code. 
However since we adopted to docker, there has been a constant struggle with features not working on Windows.

This dev box is a solution to address this frustration.

This dev box installs very few docker tools on ubuntu and SMB's all the files in the parent folder to the vagrant box.
This will allow you to work on the code directly from the vagrant box without having any secrets spilled into the vagrant box.

## Purpose
To easy set up a linux dev box that contains the docker tools to develop microservices.

## Why?
If only docker worked well on windows box, I wouldn't have needed it. There edge cases like `--net=host`(host networking) scenario, where it just wont work on Windows.

## What softwares are installed?
- Docker
- Docker compose
- git

## Secrets?
The dev box is designed to have no secrets in it.

## Convention used

