# We'll use the `date` command to get the date for "7 days ago"
date --date='5 year ago'

curl -G https://api.github.com/search/repositories       \
    --data-urlencode "q=created:>`date --date='5 year ago' '+%Y-%m-%d'`" \
    --data-urlencode "sort=stars"                          \
    --data-urlencode "order=desc"                          \
    -H "Accept: application/vnd.github.preview"            \
    | ~/Tools/jq ".items[0,1,2,3,4] | {name, description, language, watchers_count, html_url}"
