robocopy D:\toto\toto1 D:\toto\toto2 /IT /MT /mir
# source
# destination
# /IT -> Includes "tweaked" files. Tweaked files have the same name, size, and times, but different attributes.
# /MT -> Creates multi-threaded copies with n threads. n must be an integer between 1 and 128. The default value for n is 8. For better performance, redirect your output using /log option. The /mt parameter can't be used with the /ipg and /efsraw parameters.
# /mir -> Mirrors a directory tree (equivalent to /e plus /purge). Using this option with the /e option and a destination directory, overwrites the destination directory security settings.

Read-Host -Prompt "Press Enter to exit"
