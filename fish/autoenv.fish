# AutoenvFish
# Directory-based environments, inspired by Kenneth Reitz's autoenv

# allow overriding of the default autoenvfish file name
if not set -q AUTOENVFISH_FILE
  set -g AUTOENVFISH_FILE ".env"
end

# Automatic env loading when the current working dir changes
# inspired by virtualfish (https://github.com/adambrenecki/virtualfish)
function _autoenvfish --on-variable PWD
  if status --is-command-substitution # doesn't work with 'or', inexplicably
    return
  end

	# find an autoenv file, checking up the directory tree until we find
	# such a file (or nothing)
  set -l envfishdir $PWD
  while test ! "$envfishdir" = "" -a ! -d "$envfishdir/$AUTOENVFISH_FILE"
    # this strips the last path component from the path.
    set envfishdir (echo "$envfishdir" | sed 's|/[^/]*$||')
  end
  set -l envfishpath "$envfishdir/$AUTOENVFISH_FILE"
  if [ $envfishpath != "$AUTOENVFISH" ]
    # New path is different...
    if [ -f $envfishpath -o -d $envfishpath ]
      # congratulations, it's a file!
      # variable change triggers loading of the fishenv file
      set -g AUTOENVFISH $envfishpath
    else
      # file doesn't exist, so null out $AUTOENVFISH
      set -e AUTOENVFISH
    end
  end
end

# Triggered upon change of $AUTOENVFISH, source it if the file exists
function _source_envfish --on-variable AUTOENVFISH
  # fish bug: receiving erase from other shells :o
  if [ $argv[2] = "ERASE" -a -n "$AUTOENVFISH" ];
    return
  end

  while test (count $AUTOENVFISH_RESTORE) -gt 1;
    set -gx $AUTOENVFISH_RESTORE[1..2]

    if test (count $AUTOENVFISH_RESTORE) -gt 3;
      set AUTOENVFISH_RESTORE $AUTOENVFISH_RESTORE[3..(count $AUTOENVFISH_RESTORE)]
    else
      set -e AUTOENVFISH_RESTORE
    end
  end

  for name in $AUTOENVFISH_ERASE;
    set -e $name
  end

  if [ -d "$AUTOENVFISH" ]
    set -l variables (ls -1 $AUTOENVFISH)
    if [ (count $variables) -gt 0 ]
      if status --is-interactive;
        echo "loading $AUTOENVFISH ($variables)" >&2
      end

      for env in $variables;
        if begin not contains $env $AUTOENVFISH_RESTORE; and set -q $env; end;
          set -g AUTOENVFISH_RESTORE $AUTOENVFISH_RESTORE $env $$env
        else if not contains $env $AUTOENVFISH_ERASE;
          set -g AUTOENVFISH_ERASE $AUTOENVFISH_ERASE $env
        end

        set -gx $env "$(cat $AUTOENVFISH/$env)"
      end
    end
  else if [ -f "$AUTOENVFISH" ]
    if status --is-interactive
      echo "loading $AUTOENVFISH" >&2
    end

    . $AUTOENVFISH
  end
end

