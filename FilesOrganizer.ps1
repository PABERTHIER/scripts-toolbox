# Specify the source folder path
$sourceFolder = "E:\test"

# Set the desired culture for month names (e.g., "fr-FR" for French)
$culture = "fr-FR"

# Create a CultureInfo object with the specified culture
$cultureInfo = New-Object System.Globalization.CultureInfo($culture)

# Get all the files in the source folder
$files = Get-ChildItem -Path $sourceFolder -File

# Loop through each file
foreach ($file in $files) {
    # Extract the year and month from the file's creation date
    # $year = $file.CreationTime.Year
    # $month = $file.CreationTime.Month

    # Extract the year and month from the file's modification date
    $year = $file.LastWriteTime.Year
    # $month = $file.LastWriteTime.Month # It will write the number of the month
    # $month = $file.LastWriteTime.ToString("MMMM") # It will write the name of the month with the default culture info
    $month = $file.LastWriteTime.ToString("MMMM", $cultureInfo)

    # Create the destination folder path based on the year and month
    $destinationFolder = Join-Path -Path $sourceFolder -ChildPath "$year\$month"

    # If the destination folder doesn't exist, create it
    if (-not (Test-Path -Path $destinationFolder)) {
        New-Item -ItemType Directory -Path $destinationFolder | Out-Null
    }

    # Move the file to the destination folder
    Move-Item -Path $file.FullName -Destination $destinationFolder
}
