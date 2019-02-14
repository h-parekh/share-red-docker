#!/bin/bash

curl --location --request POST "http://127.0.0.1:1880/projects" \
--header "Content-Type: application/json" \
--data '{"name": "share-red-flows", "credentialSecret": "", "git": { "remotes": { "origin": { "url": "https://github.com/share-research/share-red-flows.git", "username": "", "password": "" }}}}'
