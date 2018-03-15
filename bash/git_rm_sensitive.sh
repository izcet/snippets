#!/bin/bash

git filter-brance --index-filter 'git update-index --remove $FILE'
git push --force --verbose --dry-run
git push --force
