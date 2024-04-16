#!/bin/bash

input_folder=""
extension=""
backup_folder=""
backup_archive_name=""

while [ $# -gt 0 ]; do
 if [ $1 == "--input_folder" ]; then
  input_folder="$2"
 fi
 
 if [ $1 == "--extension" ]; then
  extension="$2"
 fi
 
 if [ $1 == "--backup_folder" ]; then
  backup_folder="$2"
 fi
 
 if [ $1 == "--backup_archive_name" ]; then
  backup_archive_name="$2"
 fi
 
 shift 2
done

mkdir -p "$backup_folder"

find "$input_folder" -type f -name "*.$extension" -exec cp --parents {} "$backup_folder" \;

tar -czf "$backup_archive_name" "$backup_folder"

echo "done"

#./run.sh --input_folder ~/tests --extension cpp --backup_folder b_f --backup_archive_name b_u.tar.gz

