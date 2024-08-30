Set-ExecutionPolicy -scope Process RemoteSigned

$Date               = Get-Date -Format "yyyyMMdd_HHmmss"
$OutputFile         = "$home\desktop\output$($date).csv"
$BIOS               = Get-CimInstance -ClassName Win32_BIOS
$ComputerSystem     = Get-CimInstance -ClassName Win32_ComputerSystem
$SerialNo           = $BIOS.SerialNumber
$ComputerName       = $ComputerSystem.Name
$Model              = $ComputerSystem.Model

$Object             = New-Object System.Object
$Object | Add-Member -MemberType NoteProperty -Name "HostName"    -Value $ComputerName
$Object | Add-Member -MemberType NoteProperty -Name "Model"       -Value $Model
$Object | Add-Member -MemberType NoteProperty -Name "SerialNo"      -Value $SerialNo
$Object | Export-Csv -Path $OutputFile -Encoding Default -NoTypeInformation
