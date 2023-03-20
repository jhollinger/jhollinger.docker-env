# Delete all but the most recent N files in the given dir (and its subdirs)
function keep_most_recent {
  dir="$1"
  n=$2
  offset=$((n+1))
  find "$dir" -type f -printf "%T+ %p\n" |
    sort -r |
    awk '{ print $2 }' |
    tail -n +$offset |
    xargs --no-run-if-empty rm -f
}
