rm -rf .git

echo -n "Enter from date (yyyy-mm-dd) > "
read from
echo -n "Enter to date (yyyy-mm-dd) > "
read to
date --set "$from"

D=`date +%Y-%m-%d`


git init

echo -n "Enter name > "
read name
git config --local user.name "$name"
echo -n "Enter email > "
read email
git config --local user.email "$email"

while [ $D != $to ]; do
	date > doc	
	git add .
	git commit -m "$D"
	date --set "tomorrow"
	D=`date +%Y-%m-%d`
done

echo -n "Enter git url > "
read url

git remote add origin $url
git push -f origin master

