Clear-host
$pathNotGiven="$home\Documents"
$user_input=read-host -Prompt "Please enter the log name to search for"
$the_cmd=Get-eventlog -LogName $user_input -before 1/24/2019 -Message *success*
clear-host
write-host 'Enter the number for the option you choose'
write-host 'Enter nothing to print results to screen'
write-host '1. Do you want to save the results'
write-host '2. Do you want to send results via email'
$option=Read-host "Do you want to save the results [Y|N]"
if($option -eq 1)
{
    Clear-host
    Write-host 'Enter the full path and a file name'
    Write-host 'If you do not enter a path and file name it will save to Documents'
    $path=Read-host 'Enter file path'
    clear-host
    write-host -backgroundcolor black -foregroundcolor green $path
    if(!$path)
    {
        clear-host
        $the_cmd | Export-Csv -NoTypeInformation -Path $pathNoGive'EventLogs.cvs'
        write-host 'Saved to '$pathNoGive'EventLogs.cvs'
    }else{
        clear-host
        $the_cmd | Export-Csv -NoTypeInformation -Path $path'.cvs'
        write-host 'Saved to '$path'.cvs'
    }
}elseif($option -eq 2)
{
    Send-mailmessage -from "Richard.swierk@mymail.champlain.edu" -to "mini@miniBuntu" -subject 'Event Logs' -body $the_cmd -SmtpServer 192.168.1.32
}else{
    $the_cmd
}
