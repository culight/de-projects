#!/bin/bash
PROJECT_NAME="$1"
PROJECT_EXISTS_SCRIPT="de_projects/_common/project_exists.sh"
VALID_NAME_SCRIPT="de_projects/_common/project_name_isvalid.sh"
chmod a+x $PROJECT_EXISTS_SCRIPT
chmod a+x $VALID_NAME_SCRIPT
PROJECT_EXISTS=source $PROJECT_EXISTS_SCRIPT $PROJECT_NAME
VALID_NAME=source $VALID_NAME_SCRIPT $PROJECT_NAME

if [ "$PROJECT_EXISTS" = false ]; # project does not exist, create scaffolding for it
    if [ "$VALID_NAME" = true ]; # project name is valid
        echo "Creating scaffolding for $PROJECT_NAME..."
        then        
            # opeartion
            mkdir "operation/$PROJECT_NAME"
            touch "operation/$PROJECT_NAME/Dockerfile"
            touch "operation/$PROJECT_NAME/requirements.txt"
            mkdir "operation/$PROJECT_NAME/iac"
            # orchestration
            mkdir "orchestration/$PROJECT_NAME"
            touch "orchestration/$PROJECT_NAME/__init__.py"
            # scripts
            mkdir "scripts/$PROJECT_NAME"
            touch "scripts/$PROJECT_NAME/__init__.py"
            # tests
            mkdir "tests/$PROJECT_NAME"
            echo "Scaffolding created for $PROJECT_NAME"
    else
        echo "Project name is invalid"
    fi
    then 
        echo ""
fi