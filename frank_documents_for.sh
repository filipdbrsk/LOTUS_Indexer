#! /bin/bash
while read -r downloadLink; do
        echo $downloadLink
        curl -q -o - $downloadLink | zcat | grep '"' | nodejs --max-old-space-size=8192 bulk_index.js
	#curl -q -o - $downloadLink | zcat > /dev/null        
echo "done"
done < <( ./Frank/frank documents --downloadUri )