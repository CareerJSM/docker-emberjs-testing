#!/bin/sh

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "======================================="
echo "$dt. Starting container..."

#echo "Starting chrome for testing"
xvfb-run --server-args='-screen 0, 1024x768x16' google-chrome -start-maximized > /dev/null &

#(ember test --silent --reporter xunit || true) > /tmp/test_results.xml
