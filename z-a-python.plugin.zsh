#!/usr/bin/env zsh

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload za-py-handler

# An empty stub to fill the help handler fields
:za-py-null-handler() { :; }

@zinit-register-annex "z-a-python" \
  hook:\!atclone-50 \
  za-py-handler \
  za-py-null-handler \
  "uv|uv''|pypipx|pypipx''" # register new ices

@zinit-register-annex "z-a-python" \
  hook:\%atpull-50 \
  za-py-handler \
  za-py-null-handler

@zinit-register-annex "z-a-python" \
  hook:atdelete-50 \
  za-py-handler \
  za-py-null-handler
