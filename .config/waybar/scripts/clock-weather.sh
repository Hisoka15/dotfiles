#!/bin/bash

weather=$(curl -s "wttr.in/Managua?format=1")
date=$(date "+%a %d %b %I:%M %p")

echo "$weather    $date"
