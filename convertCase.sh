#!/bin/bash

# Function to transform the case of each character in a word
transform_case() {
  input_string="$1"
  output_string=""

  # Loop through each character in the string
  for (( i=0; i<${#input_string}; i++ )); do
    char="${input_string:$i:1}"

    # Check if the character is uppercase
    if [[ "$char" =~ [A-Z] ]]; then
      # Transform to lowercase
      output_string+="${char,,}"
    elif [[ "$char" =~ [a-z] ]]; then
      # Transform to uppercase
      output_string+="${char^^}"
    else
      # Keep non-alphabetic characters unchanged
      output_string+="$char"
    fi
  done

  echo "$output_string"
}

# Read input string using IFS
echo "Enter a string: "
Characters= read -r input_string

# Initialize output string
output_string=""

# Loop through each word in the input string
for word in $input_string; do
    transformed_word=$(transform_case "$word")
    output_string+="$transformed_word "
done

# Trim trailing space and print the transformed string
output_string=$(echo "$output_string" | sed 's/ *$//')
echo "$output_string"
