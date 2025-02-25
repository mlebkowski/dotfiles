function hex
  argparse --name=hex 'd/base64' -- $argv
  or return

  begin
    if set -q _flag_base64
      base64 -d
    else
      cat
    end
  end | xxd -g1 -R always
end
