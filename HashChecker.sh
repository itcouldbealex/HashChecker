#!/bin/bash

echo "HashChecker initialized."
echo "Made by https://github.com/itcouldbealex"

echo "Please enter desired hashing tool." 
echo "Notice: You have to use the binary name exactly, like sha256sum, sha512sum, etc."
read -p "> " tool
echo "Please enter file path to file you want to hash check."
read -p "> " filepath
echo "Please enter hash of the file."
read -p "> " filehash

echo "Thank you. Please wait while I compare the two hashes."
echo "Notice: if the file you want to hash check is large, hashing the file will take time."
calchash="$($tool $filepath | cut -d" " -f 1)"


if [ "$calchash" == "$filehash" ]; then
  echo "Great news! I have checked the two hashes and they MATCH!"
  echo "This means that the file you have is intact and has not been altered before it got to you."
  echo "Notice: This doesn't mean that the file isn't dangerous. I'm an integrity checker, not a antivirus."
  echo "If you ARE worried about malware, please check the file using antivirus tools."
else
  echo "Bad news, I have checked the two hashes and they DO NOT MATCH!"
  echo "It would be a great idea to re-transfer/re-download the file you checked, as a failed comparison might indicate the file was altered in some way before it got to you."
fi
