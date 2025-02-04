#!/usr/bin/env zsh

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload :za-py-atclone-handler :za-py-atpull-handler :za-py-atdelete-handler

# An empty stub to fill the help handler fields
:za-py-null-handler() { :; }

@zinit-register-annex "z-a-python" \
  hook:atclone-50 \
  :za-py-atclone-handler \
  :za-py-null-handler \
  "uv|uv''" # register new ices

@zinit-register-annex "z-a-python" \
  hook:\%atpull-50 \
  :za-py-atpull-handler \
  :za-py-null-handler

@zinit-register-annex "z-a-python" \
  hook:atdelete-50 \
  :za-py-atdelete-handler \
  :za-py-null-handler
