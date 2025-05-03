REPO_PATH="./gitmsgbot"

mkdir -p "$REPO_PATH"
cd "$REPO_PATH" || exit 1
git init


start_date="2025-01-05"

heart_rows=(
  "011001100000111100000000"
  "111111111001000010011110"
  "111111111001000010110001"
  "111111111000110000100000"
  "011111110000001000100000"
  "001111100010000100110001"
  "000111000011111000011110"
)

for ((week=0; week<${#heart_rows[0]}; week++)); do
  for ((day=0; day<7; day++)); do
    pixel="${heart_rows[day]:week:1}"
    if [[ "$pixel" == "1" ]]; then
      commit_date=$(date -d "$start_date + $((week * 7 + day)) days" +'%Y-%m-%dT12:00:00')
      echo "$commit_date Commit" > file.txt
      git add file.txt
      GIT_AUTHOR_DATE="$commit_date" GIT_COMMITTER_DATE="$commit_date" git commit -m "Commit for $commit_date"
    fi
  done
done