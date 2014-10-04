function man
	env \
		LESS_TERMCAP_mb=(echo -e -n '\033[01;31m') \
		LESS_TERMCAP_md=(echo -e -n '\033[01;38;5;74m') \
		LESS_TERMCAP_me=(echo -e -n '\033[0m') \
		LESS_TERMCAP_se=(echo -e -n '\033[0m') \
		LESS_TERMCAP_so=(echo -e -n '\033[01;44;33m') \
		LESS_TERMCAP_ue=(echo -e -n '\033[0m') \
		LESS_TERMCAP_us=(echo -e -n '\033[01;32m') \
	man $argv
end

