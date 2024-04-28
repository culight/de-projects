#!/bin/bash
PROJECT_NAME="$1"

check_project_exists () {
    PROJECT_NAME="$1"

    # check operation dir
    if [ -d "$PROJECT_NAME/operation" ]; then
        operation_exists=true
    else
        operation_exists=false
    fi

    # check orchestration dir
    if [ -d "$PROJECT_NAME/orchestration" ]; then
        orchestration_exists=true
    else
        orchestration_exists=false
    fi

    # check scripts dir
    if [ -d "$PROJECT_NAME/scripts" ]; then
        scripts_exists=true
    else
        scripts_exists=false
    fi

    # check tests dir
    if [ -d "$PROJECT_NAME/tests" ]; then
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
            echo "  $PROJECT_NAME/operation: $operation_exists"
            echo "  $PROJECT_NAME/orchestration: $orchestration_exists"
            echo "  $PROJECT_NAME/scripts: $scripts_exists"
            echo "  $PROJECT_NAME/tests: $tests_exists"
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
                    mkdir "$PROJECT_NAME/operation"
                    touch "$PROJECT_NAME/operation/Dockerfile"
                    touch "$PROJECT_NAME/operation/requirements.txt"
                    mkdir "$PROJECT_NAME/operation/iac"
                fi

                if [ "$orchestration_exists" = false ];
                then
                    mkdir "$PROJECT_NAME/orchestration"
                    touch "$PROJECT_NAME/orchestration/__init__.py"
                fi

                if [ "$scripts_exists" = false ];
                then
                    mkdir "$PROJECT_NAME/scripts"
                    touch "$PROJECT_NAME/scripts/__init__.py"
                fi

                if [ "$tests_exists" = false ];
                then
                    mkdir "$PROJECT_NAME/tests"
                fi
            fi
            echo "Scaffolding created for project $PROJECT_NAME"
        fi
    fi

    return $project_exists

}

check_project_name_isvalid () {
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
        return true
    else
        # project name is not valid
        return false
    fi
}

PROJECT_EXISTS=check_project_exists $PROJECT_NAME
VALID_NAME=check_project_name_isvalid $PROJECT_NAME

if [ "$PROJECT_EXISTS" = false ]; # project does not exist, create scaffolding for it
    if [ "$VALID_NAME" = true ]; # project name is valid
        echo "Creating scaffolding for $PROJECT_NAME..."
        then
            mkdir "$PROJECT_NAME"
            # opeartion
            mkdir "$PROJECT_NAME/operation"
            touch "$PROJECT_NAME/operation/Dockerfile"
            touch "$PROJECT_NAME/operation/requirements.txt"
            mkdir "$PROJECT_NAME/operation/iac"
            # orchestration
            mkdir "$PROJECT_NAME/orchestration"
            touch "$PROJECT_NAME/orchestration/__init__.py"
            # scripts
            mkdir "$PROJECT_NAME/scripts"
            mkdir "$PROJECT_NAME/scripts/validation"
            touch "$PROJECT_NAME/scripts/__init__.py"
            # tests
            mkdir "$PROJECT_NAME/tests"
            echo "Scaffolding created for $PROJECT_NAME"
    else
        echo "Project name is invalid"
    fi
    then 
        echo ""
fi