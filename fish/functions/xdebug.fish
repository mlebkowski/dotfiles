function xdebug
	php -dzend_extension=xdebug.so -dxdebug.remote_autostart=On $argv
end
