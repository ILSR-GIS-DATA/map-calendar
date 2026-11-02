#!/usr/bin/env bash
# Usage: ./new-day.sh 2026-11-05 "Title of the map"
set -e
d="${1:?Give a date like 2026-11-05}"
t="${2:-Map for $d}"
dir="posts/$d"
mkdir -p "$dir"
[ -e "$dir/index.qmd" ] && { echo "$dir/index.qmd already exists"; exit 1; }
cat > "$dir/index.qmd" <<QMD
---
title: "$t"
date: $d
image: map.png
---

[Back to the calendar](../../index.qmd)

![$t](map.png){.post-map}

Notes about this map go here.
QMD
echo "Created $dir/index.qmd. Drop your map in $dir/ as map.png (or change 'image:' and the image line)."
