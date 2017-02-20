# ==============================================================================================
# 
# NAME: SortPhotos.ps1
# 
# 
# COMMENT: Helps you organise your digital photos into subdirectory, based on the Exif data 
# found inside the picture. Based on the date picture taken property the pictures will be organized into
# folders from the currect directory in the following format for month and year "Dec 2016"
# ============================================================================================== 



function organizefiletype ( $filetype )
{

$Files = Get-ChildItem -recurse -filter $filetype
foreach ($file in $Files) 
{
    echo $file
  $strYear = $file.LastWriteTime.Year

  $strMonth = $file.LastWriteTime.Month
  switch($strMonth)
  {
     01 { $strMonthName = "Jan" }
     02 { $strMonthName = "Feb"}
     03 { $strMonthName = "Mar"}
     04 { $strMonthName = "Apr"}
     05 { $strMonthName = "May"}
     06 { $strMonthName = "Jun"}
     07 { $strMonthName = "Jul"}
     08 { $strMonthName = "Aug"}
     09 { $strMonthName = "Sep"}
     10 { $strMonthName = "Oct"}
     11 { $strMonthName = "Nov"}
     12 { $strMonthName = "Dec"}

     default { $strMonthName = "???"}
  }

    $TargetPath = ".\" + $strMonthName + " "+ $strYear + "\"

  If (Test-Path $TargetPath)
  {
    xcopy /Y/Q $file.FullName $TargetPath
  }
  Else
   {
    New-Item $TargetPath -Type Directory
    xcopy /Y/Q $file.FullName $TargetPath
   }
} 
}

organizefiletype *.jpg
organizefiletype *.mov