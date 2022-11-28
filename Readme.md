# New Mac

Turn on dock hiding

- Bear
- Slack
- Dropbox
- SequelAce
- Spotify
- Around
- CoreTunnel
- Jetbrains toolbox
- Homebrew
- iTerm2
    - Import settings from dropbox
- Captain
- Byword
- Things
- Paw
- LaunchControl (from dropbox)
- Skitch
- Reeder
- mac2imgur
- Patterns
- Recordit
- Authy
- CodeRunner 
    - coderunner settings

/opt/homebrew/bin/brew install $(cat ~/.dotfiles/brew/packages)

- mutagen create (pwd) docker://(basename (pwd))_mutagen_1/app

# https://github.com/docker/compose/issues/8630#issuecomment-1169537632
```
mkdir -p ~/.docker/cli-plugins
ln -sfn /opt/homebrew/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
```

run-in-docker
Disable Spotlight indexing
