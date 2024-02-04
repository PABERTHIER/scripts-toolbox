$dir1 = Get-ChildItem -Recurse -path 'D:\toto1'
$dir2 = Get-ChildItem -Recurse -path D:\toto2
Compare-Object -ReferenceObject $dir1 -DifferenceObject $dir2 | Out-File "D:\toto\file.json"

# If returns => then it is only in dir 2
# If retruns <= then it is only in dir 1
