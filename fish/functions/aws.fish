function aws
	set -l AWS_DEFAULT_REGION (if [ "$argv[1]" = "opsworks" ]; echo us-east-1; else; echo eu-west-1; end)
	docker run --rm -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION anigeo/awscli $argv
end
