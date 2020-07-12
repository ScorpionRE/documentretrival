#!/bin/bash
encodedPdf=`cat sample.pdf | base64`
json="{\"file\":\"${encodedPdf}\"}"
echo "$json" > json.file
curl -XPOST 'http://119.23.221.75:9200/pdf-test1/_doc?pipeline=pdfattachment&pretty' -H 'Content-Type: application/json' -d @json.file
