#!/bin/bash
exec ctags-exuberant -f /mnt/src/namba/dev/tags \
-h "*.*" -R \
--exclude="\.svn" \
--totals=yes \
--tag-relative=yes \

