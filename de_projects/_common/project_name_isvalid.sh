#!/bin/bash

PROJECT_NAME="$1"

ILLEGAL_NAMES=("de_projects" "scripts" "operation" "orchestration", "tests")

# name is not empty
if [ -n "$PROJECT_NAME" ];
then
    not_empty=true
else
    not_empty=false
fi

# name less than 30 chararcters
if [ ${#PROJECT_NAME} -le 30 ];
then
    length_is_valid=true
else
    length_is_valid=false
fi

# name contains only alphanumeric characters
if [[ $PROJECT_NAME =~ ^[a-zA-Z0-9_]+$ ]];
then
    contains_only_alphanumeric=true
else
    contains_only_alphanumeric=false
fi

# name does not start with a number
if [[ $PROJECT_NAME =~ ^[a-zA-Z_]+ ]];
then
    does_not_start_with_number=true
else
    does_not_start_with_number=false
fi

# name is not an illegal name
if [[ ! " ${ILLEGAL_NAMES[@]} " =~ " ${PROJECT_NAME} " ]];
then
    is_not_illegal_name=true
else
    is_not_illegal_name=false
fi

if [ "$not_empty" = true ] && [ "$length_is_valid" = true ] && [ "$contains_only_alphanumeric" = true ] && [ "$does_not_start_with_number" = true ] && [ "$is_not_illegal_name" = true ];
then
    # project name is valid
    echo true
else
    # project name is not valid
    echo false
fi
