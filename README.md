# tidy
adjective
1. arranged neatly and in order
---

Tidy is a small bash script that removes zip files after unzipping them. That's it.


### Installation
Run this in your machine:

`curl -fsSL https://raw.githubusercontent.com/zolduck0/tidy/main/install.sh -o installer.sh && bash installer.sh && rm -f installer.sh`

### Usage

`tidy [file]` - Unzips the file (if it's a zip file) and then removes it after unzipping.

`tidy all` - Looks for all .zips in the current folder, unzips them all and them removes them.

### Future goals:
* Include support for other formats such as `.rar`, `.tar`, `.7z`, etc
