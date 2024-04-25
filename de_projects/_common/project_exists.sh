#!/bin/bash

PROJECT_NAME="$1"

# check operation dir
if [ -d "operation/$PROJECT_NAME" ]; then
    operation_exists=true
else
    operation_exists=false
fi

# check orchestration dir
if [ -d "orchestration/$PROJECT_NAME" ]; then
    orchestration_exists=true
else
    orchestration_exists=false
fi

# check scripts dir
if [ -d "scripts/$PROJECT_NAME" ]; then
    scripts_exists=true
else
    scripts_exists=false
fi

# check tests dir
if [ -d "tests/$PROJECT_NAME" ]; then
    tests_exists=true
else
    tests_exists=false
fi

if [ "$operation_exists" = true ] && [ "$orchestration_exists" = true ] && [ "$scripts_exists" = true ] && [ "$tests_exists" = true ];
then
    project_exists=true
else
    # is project incomplete?
    if [ "$operation_exists" = false ] && [ "$orchestration_exists" = false ] && [ "$scripts_exists" = false ] && [ "$tests_exists" = false ];
    then
        project_exists=false
        
    else
        project_exists=true

        echo ""
        echo "Some project components are missing:"
        echo "  operation/$PROJECT_NAME: $operation_exists"
        echo "  orchestration/$PROJECT_NAME: $orchestration_exists"
        echo "  scripts/$PROJECT_NAME: $scripts_exists"
        echo "  tests/$PROJECT_NAME: $tests_exists"
        echo ""

        echo "Would you like to recreate the missing components? (y/n) "
        read recreate_components;

        # reacreate missing components
        echo ""
        echo "Recreating missing components for $PROJECT_NAME..."
        echo ""
        if [ "$recreate_components" = "y" ];
        then
            if [ "$operation_exists" = false ];
            then
                mkdir "operation/$PROJECT_NAME"
                touch "operation/$PROJECT_NAME/Dockerfile"
                touch "operation/$PROJECT_NAME/requirements.txt"
                mkdir "operation/$PROJECT_NAME/iac"
            fi

            if [ "$orchestration_exists" = false ];
            then
                mkdir "orchestration/$PROJECT_NAME"
                touch "orchestration/$PROJECT_NAME/__init__.py"
            fi

            if [ "$scripts_exists" = false ];
            then
                mkdir "scripts/$PROJECT_NAME"
                touch "scripts/$PROJECT_NAME/__init__.py"
            fi

            if [ "$tests_exists" = false ];
            then
                mkdir "tests/$PROJECT_NAME"
            fi
        fi
        echo "Scaffolding created for project $PROJECT_NAME"
    fi
fi

echo $project_exists