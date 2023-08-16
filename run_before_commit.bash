export GPG_TTY=$(tty)
ping -c 2 127.0.0.1
eval "$(ssh-agent -s)"
