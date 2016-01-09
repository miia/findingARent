#!/bin/bash
sqlite3 "$1" <<!
.headers on
.mode csv
.output "$2"
select moz_bookmarks.title,url from moz_bookmarks,moz_places where moz_places.id==moz_bookmarks.fk and moz_bookmarks.parent==(select id from moz_bookmarks where title=="Rent");
!

git add "$2"
git commit -m "$(date +%Y-%m-%d)"
git push
