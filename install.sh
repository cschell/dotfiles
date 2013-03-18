#!/bin/sh


cutstring="DO NOT EDIT BELOW THIS LINE"
echo "initialize git submodules"
/usr/bin/env git submodule init
echo "update git submodules"
/usr/bin/env git submodule update

for name in *; do
  target="$HOME/.$name"
  echo "target: $target"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      cutline=`/usr/bin/env grep -n -m1 "$cutstring" "$target" | /usr/bin/env sed "s/:.*//"`
      if [ -n "$cutline" ]; then
        cutline=$((cutline-1))
        echo "Updating $target"
        /usr/bin/env head -n $cutline "$target" > update_tmp
        startline=`/usr/bin/env sed '1!G;h;$!d' "$name" | /usr/bin/env grep -n -m1 "$cutstring" | /usr/bin/env sed "s/:.*//"`
        if [ -n "$startline" ]; then
          /usr/bin/env tail -n $startline "$name" >> update_tmp
        else
          /usr/bin/env cat "$name" >> update_tmp
        fi
        /usr/bin/env mv update_tmp "$target"
      else
        echo "WARNING: $target exists but is not a symlink."
      fi
    fi
  else
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ]; then
      echo "Creating $target"
      if [ -n "$(grep "$cutstring" "$name")" ]; then
        /usr/bin/env cp "$PWD/$name" "$target"
      else
        /usr/bin/env ln -s "$PWD/$name" "$target"
      fi
    fi
  fi
done


echo "bundle install vim modules"
/usr/bin/env vim +BundleInstall +qa

if [ ! -e "./oh-my-zsh/plugins/zsh-syntax-highlighting" ]; then
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ./oh-my-zsh/plugins/zsh-syntax-highlighting
fi