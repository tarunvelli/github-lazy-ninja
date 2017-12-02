echo -n "Enter from date (yyyy-mm-dd) > "
read from
echo -n "Enter to date (yyyy-mm-dd) > "
read to

rm -rf .git
git init

echo -n "Enter your name > "
read name
git config --local user.name "$name"
echo -n "Enter your email which is registered with github > "
read email
git config --local user.email "$email"

from_time_stamp=$(date -d $from +%s)
counter_time_stamp=$from_time_stamp
to_time_stamp=$(date -d $to +%s)

while [ $counter_time_stamp -lt $to_time_stamp ]; do
	current_date=$(date -d "UTC 1970-01-01 $counter_time_stamp secs")
  echo "$current_date" > doc
  git add .
  GIT_AUTHOR_DATE="$current_date" GIT_COMMITTER_DATE="$current_date" git commit -m "$current_date"
  counter_time_stamp=$(expr "$counter_time_stamp" + 86400)
done

echo -n "Enter git repo url > "
read url

git remote add origin $url
git push -f origin master
