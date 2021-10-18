#!/bin/sh
cd /data/repos
total=0
for v in $(ls -d *); do
  echo $(date) $v
  cd $v
  git prune
  git -c gc.auto=1 -c gc.autoDetach=false gc --auto
  count=$((count + 1))
  echo "$count"
  cd /data/repos
echo "Total repositories gc: ${total}"
done
