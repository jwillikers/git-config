[merge]
	tool = smerge

[mergetool "smerge"]
	cmd = smerge mergetool \"$BASE\" \"$LOCAL\" \"$REMOTE\" -o \"$MERGED\"
	trustExitCode = true