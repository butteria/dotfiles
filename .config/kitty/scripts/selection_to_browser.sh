#!/bin/bash

URL="https://www.bing.com/?q="
PRE_FORMAT_QUERY=$1
QUERY=$(echo $PRE_FORMAT_QUERY | sed -e "s/\ /+/g")

firefox -new-tab ${URL}${QUERY}
