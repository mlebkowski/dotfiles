function xdebug
  set --local xdebug_path xdebug.so
  if ! php -dzend_extension=xdebug.so -m 2>/dev/null | grep -q '^xdebug$' ; 
    set --local php_version (php -r 'echo PHP_MAJOR_VERSION, ".", PHP_MINOR_VERSION;')
    set xdebug_path /opt/homebrew/opt/xdebug@$php_version/xdebug.so

    if [ ! -f "$xdebug_path" ];
      begin
        echo "Couldn’t find xdebug.so in the default location"
        echo "Tried $xdebug_path but it is not there either"
      end >&2
      return 1
    end
  end
  php -dzend_extension="$xdebug_path" -dxdebug.mode=debug -dxdebug.start_with_request=yes $argv
end
