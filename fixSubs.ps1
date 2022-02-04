<#
.SYNOPSIS 
    This script allows you to select a movie file you have downloaded subtitles for, and will go through the automated effort of unpacking and matching the filenames, then cleaning up the mess. 
    Initially it will be a simple request for two files to ingest, so as to get the base logic in place, but as this develops I hope to add more automation behind selecting the files and renaming all to a common global standard format and so on.
.EXAMPLE
    .\fixSubs.ps1
.NOTES
    Author:  kerbero5
    Date:    4 Feb 2022
    fixSubs.ps1
#>
[CmdletBinding()]
Param(
    [parameter]
    [string[]] $sourceVideo,
    [parameter]
    [string[]] $sourceSubtitle,
)

if ($sourceSubtitle -match ".zip")
{
    $sourceSubtitleLocation = Split-Path -Path "$sourceSubtitle"
    Expand-Archive -Path $sourceSubtitle -DestinationPath $sourceSubtitleLocation
}  

$subtitle = get-childitem -path $sourceSubtitleLocation -Filter "*.srt"