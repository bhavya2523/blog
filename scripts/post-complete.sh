echo "Empty image directories are deleted"
cd ..
#cd public/img/
find . -type d -depth -empty -exec rmdir "{}" \;

echo "BUILDING Blog"
bundle exec jekyll serve
