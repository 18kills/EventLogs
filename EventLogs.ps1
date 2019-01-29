$pathNotGiven='$home\Documents'
$user_input=read-host -Prompt "Please enter the process name to search for"
$the_cmd=ps | where {$_.Processame -ilike "*$user_input*"}
$to_save=Read-host "Do you want to see the results [Y|N]"
if($to_save -eq 'Y')
{
    Write-host 'Enter the full path and a file name'
    Write-host 'If you do not enter a path and file name it will save to Documents'
    $path=Read-host 'Enter file path'
    if(!$path)
    {
        $the_cmd | Export-Csv -NoTypeInformation -Path $pathNoGive'EventLogs.cvs'
    }else{
        $the_cmd | Export-Csv -NoTypeInformation -Path $path'.cvs'
    }
}else{
    $the_cmd
}
