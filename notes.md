listr

list
has many tasks
belongs to a user
title
task

user
has many lists
has many comments
has man commented tasks, through comments
email
username
password_digest

tag
has many tasks
has many lists through tasks

task
belongs to list
belongs to user
belongs to tag
has many comments
has many users through comments

comment
belongs to user
belongs to list
content

category
belongs to user
has many lists
has many tasks through lists