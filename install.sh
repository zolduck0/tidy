#!/bin/bash

echo "Installing tidy..."

URL=https://github.com/zolduck0/tidy/releases/download/0.1.0/tidy.sh

if [ -z "$URL" ]; then
  echo "Latest build not found."
  exit 1
fi

echo "Downloading latest build..."
build=$(basename "$URL")
curl -L -o "$build" "$URL"

if [ $? -ne 0 ]; then
  echo "Couldn't download latest build. Exiting."
  exit 1
fi

chmod +x "$build"
sudo mv "$build" "/usr/local/bin/tidy"
echo "tidy sucessfully installed. Thank you!"

exit 0
