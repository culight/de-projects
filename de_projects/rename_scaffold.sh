# bash script to rename a directory
# Usage: ./rename_scaffold.sh <old_name> <new_name>

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Usage: ./rename_scaffold.sh <old_name> <new_name>"
    exit 1
fi

# Check if the old directory exists
if [ ! -d "$1" ]; then
    echo "Directory $1 does not exist"
    exit 1
fi

# Check if the new directory does not exist
if [ -d "../$2" ]; then
    echo "Directory $2 already exists"
    exit 1
fi

# Rename the directory
mv "$1" "$2"

# Replace the old name with the new name in all files
grep -rl "$1" . | xargs sed -i "s/$1/$2/g"

