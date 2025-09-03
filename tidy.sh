#!/bin/bash

fileName="$1"

if [ -z "$fileName" ]; then
  echo "tidy [zip file] - Extracts the zip file to a folder with its name and deletes it afterwards."
  echo "tidy all - Extracts all the zip files in the current folder to a folder with their name and delete the zip files afterwards."
  exit 0
fi

case "$fileName" in
*.zip)
  folderName="${fileName%.zip}"
  mkdir -p "$folderName"

  unzip "$fileName" -d "$folderName"
  status=$?

  if [ $status -eq 0 ]; then
    rm "$fileName"
    echo "$fileName unzipped."
    echo "$fileName removed."
  else
    exit 1
  fi
  ;;
all)
  zips=(*.zip)
  echo "Grabbing all the .zip files inside $PWD..."
  for file in "${zips[@]}"; do
    echo "$file..."
  done
  echo "${#zips[@]} zip files found. Tidy the folder? (y/n)"

  while true; do
    read input

    case "$input" in
    y | Y)
      for file in "${zips[@]}"; do
        [ -e "$file" ] || continue
        folderName="${file%.zip}"
        mkdir -p "$folderName"

        newName="${file// /_}"
        if [ "$file" != "$newName" ]; then
          mv "$file" "$newName"
          file="$newName"
        fi

        echo "Unzipping $file"
        unzip $file -d "$folderName"
        status=$?

        if [ $status -eq 0 ]; then
          rm $file
          echo "Removing $file..."
        fi
      done

      echo "Folder tidied."
      exit 0
      ;;
    n | N)
      exit 0
      ;;
    *)
      echo "Please select y or n"
      ;;
    esac
  done
  ;;
esac
