# dotfiles
```
setup.sh
```

## Better sv\_SE spellcheck in vim

1. Download latest version of (https://extensions.libreoffice.org/en/extensions/show/swedish-spelling-dictionary-den-stora-svenska-ordlistan)
2. `unzip ooo-*`
3. `cd dictionaries`
4. `vi -c ":mkspell sv sv_SE"`
5. `mkdir -p ~/.vim/spell && mv sv.utf-8.spl ~/.vim/spell`
