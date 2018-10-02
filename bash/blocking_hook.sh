FILES_PATTERN=''
FORBIDDEN='DONOTCOMMIT'
git diff --cached --name-only | \
  grep -E "$FILES_PATTERN" | \
  xargs grep --with-filename --ignore-case --line-number "$FORBIDDEN"s && echo "COMMIT REJECTED Found '$FORBIDDEN' references. Please remove them before commiting" && exit 1
