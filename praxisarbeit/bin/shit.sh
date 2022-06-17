mkdir /tmp/A /tmp/B /tmp/C "/tmp/ dir with spaces"
for file in /tmp/*/ ; do file="${file%/}"; echo "${file##*/}"; done
