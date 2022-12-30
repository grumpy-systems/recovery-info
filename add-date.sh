#!/bin/bash

set -e
set -x

echo '# Revision' >> docs.md
echo "This version updated at" $( date ) >> docs.md
