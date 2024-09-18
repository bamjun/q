#!/bin/bash

# Initialize django_code.txt
> django_code.txt

# Function to find and process files
process_files() {
    local filename="$1"
    find . -name "$filename" -not -path "*/.venv/*" | while read -r file; do
        # Record the path to django_code.txt
        echo "\`\`\`$file" >> django_code.txt
        # Append the content of the file to django_code.txt
        cat "$file" >> django_code.txt
        # Add newlines for separation
        echo -e "\n\`\`\`\n" >> django_code.txt
    done
}

# Process models.py, urls.py, and views.py
process_files "models.py"
process_files "urls.py"
process_files "views.py"
