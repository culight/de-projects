#!/bin/bash

PROJECT_NAME="$1"
PROJECT_EXISTS_SCRIPT="de_projects/_common/project_exists.sh"
chmod a+x $PROJECT_EXISTS_SCRIPT
PROJECT_EXISTS=source $PROJECT_EXISTS_SCRIPT $PROJECT_NAME

if [ "$PROJECT_EXISTS" = true ];
    echo "Deleting scaffolding for $PROJECT_NAME..."
    then   
        # opeartion
        rm -rf "operation/$PROJECT_NAME"
        # orchestration
        rm -rf "orchestration/$PROJECT_NAME"
        # scripts
        rm -rf "scripts/$PROJECT_NAME"
        # tests
        rm -rf "tests/$PROJECT_NAME"
        echo "Scaffolding deleted for $PROJECT_NAME"
fi