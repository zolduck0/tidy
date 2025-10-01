#!/bin/bash

echo "Installing tidy..."

URL=https://github.com/zolduck0/tidy/releases/download/0.1.0/tidy.sh

if [ -z "$URL" ]; then
  echo "Latest build not found."
  exit 1
fi

echo "Downloading latest build..."
curl -L -o tidy.sh "$URL"

if [ $? -ne 0 ]; then
  echo "Couldn't download latest build. Exiting."
  exit 1
fi

chmod +x tidy.sh
sudo mv tidy.sh "/usr/local/bin/tidy"
echo "tidy sucessfully installed. Thank you!"

exit 0
