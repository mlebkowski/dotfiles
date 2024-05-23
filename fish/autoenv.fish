function _autoenvfish --on-variable PWD
    if status --is-command-substitution # doesn't work with 'or', inexplicably
        return
    end

    set -l current_bucket (nassau-env detect $PWD | md5)

    if [ "$AUTOENVFISH_BUCKET" != "$current_bucket" ]
        set -g AUTOENVFISH_BUCKET $current_bucket
    end
end

function _autoenvfish_log
    if status --is-interactive
        gum log --prefix AUTOENVFISH $argv >&2
    end
end

# Triggered upon change of $AUTOENVFISH_BUCKET, source it if the file exists
function _source_envfish --on-variable AUTOENVFISH_BUCKET
    # fish bug: receiving erase from other shells :o
    if [ $argv[2] = "ERASE" -a -n "$AUTOENVFISH_BUCKET" ];
        return
    end

    set -l variables (nassau-env get "$PWD")
    set -l names (echo $variables | jq -r 'keys|.[]')

    # AUTOENVFISH_RESTORE = ['var1', 'oldvalue', 'var2', 'oldvalue', ....]
    set -l restored_names
    while test (count $AUTOENVFISH_RESTORE) -gt 1;
        set -gx $AUTOENVFISH_RESTORE[1..2]

        if not contains $AUTOENVFISH_RESTORE[1] $names;
            set restored_names $restored_names $AUTOENVFISH_RESTORE[1]
        end

        if test (count $AUTOENVFISH_RESTORE) -gt 3;
          set AUTOENVFISH_RESTORE $AUTOENVFISH_RESTORE[3..(count $AUTOENVFISH_RESTORE)]
        else
          set -e AUTOENVFISH_RESTORE
        end
    end
    if [ (count $restored_names) -gt 0 ]
        _autoenvfish_log "restoring $restored_names"
    end

    set -l erased_names
    for name in $AUTOENVFISH_ERASE;
        set -e $AUTOENVFISH_ERASE

        if not contains $name $names;
            set erased_names $erased_names $name
        end
    end
    set -e AUTOENVFISH_ERASE
    if [ (count $erased_names) -gt 0 ];
        _autoenvfish_log "erasing $erased_names"
    end;

    set -l variables (nassau-env get "$PWD")
    set -l names (echo $variables | jq -r 'keys|.[]')
    if [ (count $names) -gt 0 ]
        _autoenvfish_log "loading $names"

        for name in $names;
            set -l value "$(echo $variables | jq --arg key "$name" -r '.[$key]')"
            if begin not contains $name $AUTOENVFISH_RESTORE; and set -q $name; end;
                set -g AUTOENVFISH_RESTORE $AUTOENVFISH_RESTORE $name "$$name"
            else if not contains $name $AUTOENVFISH_ERASE;
                set -g AUTOENVFISH_ERASE $AUTOENVFISH_ERASE $name
            end

            set -gx $name "$value"
        end
    end
end

