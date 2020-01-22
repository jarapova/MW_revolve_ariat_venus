#!/usr/bin/env bash

branch='origin/HEAD origin/features_email_notification'
commit_msg='update features'
if [[ $commit_msg == *"update features"* ]] && [[ $branch == *"master"* ]];
then
 echo 'true'
else
echo 'false'
fi