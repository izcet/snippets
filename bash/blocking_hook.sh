FILES_PATTERN=''  # empty string matches all files
FORBIDDEN='DONOTCOMMIT'  # offending string
MESSAGE="COMMIT REJECTED:\n\tFound '$FORBIDDEN' references.\n\tPlease remove them before commiting"

# so files can be referenced by absolute path
GIT_ROOT=""
while [ -z "${GIT_ROOT}" ] ; do 
  GIT_ROOT="$(git root 2> /dev/null)"
  if [ "$?" ] ; then
    git config --global alias.root 'rev-parse --show-toplevel'
  fi
done

git diff --cached --name-only | \
  sed "s!.*!$GIT_ROOT/&!g" | \
  grep -E "$FILES_PATTERN" | \
  xargs grep --with-filename --ignore-case --line-number --no-messages "$FORBIDDEN" | \
  grep --ignore-case --color=always "$FORBIDDEN" && echo -e "$MESSAGE" && exit 1
exit 0
