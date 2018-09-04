#! /bin/bash

function cs(){
  cd "$1" && pwd && ls -a;
}

function gitgraph(){
  git log --oneline --graph --decorate --all;
}

function gitprune(){
git branch --merged | egrep -v "(^\*|master|staging)" | xargs -r git branch -d && git remote prune origin;
}

function is_pre_git_dup(){
  git log -n 2 | sed -n "/\s\s\s\s./p"|sed -e "s/\s*//" | head | uniq -d |wc -l;
}

function gitsave(){
  local tmp="";
  local blank="";
  if [[ "$1" != "" ]]; then
    tmp="$1";
  else
    tmp="$(parse_git_branch)";
  fi
  #echo "$tmp";
  tmp="${tmp//[() ]/$blank}"
  git commit -am"$tmp";
 
 tmp="$(is_pre_git_dup)";
  if [[ "$tmp" == "1" ]]; then
    echo duplicate commit;
    tmp="$(parse_git_branch)";
    tmp="${tmp//[() ]/$blank}";
    git reset --mixed HEAD~2;
    git add .
    git commit -am"$tmp";
  fi
}

function gitrebasemaster(){
  local tmp="master";
  local blank="";
  if [[ "$1" != "" ]]; then
    tmp="$1";
  else
    tmp="$(parse_git_branch)";
  fi

  tmp="${tmp//[() ]/$blank}"
  git checkout "$tmp";
  git fetch -p origin;
  gitprune;
  git rebase origin/master "$tmp";
}

function gitpublish(){
  local tmp="master";
  local blank="";
  if [[ "$1" != "" ]]; then
    tmp="$1";
  else
    tmp="$(parse_git_branch)";
  fi

  tmp="${tmp//[() ]/$blank}"
  git push -u origin "$tmp";
}

function gitcreatebranch(){
  git checkout master;
  git checkout -b "$1";
}

function ssh-list(){
  sed -n '/HOST/ p' ~/.ssh/config | cut -d' ' -f2-;
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}