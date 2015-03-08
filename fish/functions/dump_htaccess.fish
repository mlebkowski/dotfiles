function dump_htaccess
	if [ ! -d "$AUTOENVFISH" ]
		return
	end

	set htaccess_path (dirname $AUTOENVFISH)/.htaccess
	set htaccess (if [ -f "$htaccess_path" ]; sed -e '/#![ ]*$/p' -e /^SetEnv/d "$htaccess_path"; end)

	echo \n$htaccess | sed -e 1d -e s/'[ ]*$'//g > "$htaccess_path"

	set variables (ls -1 "$AUTOENVFISH")
	for env in $variables;
		echo "SetEnv $env "$$env >> "$htaccess_path"
	end

end
