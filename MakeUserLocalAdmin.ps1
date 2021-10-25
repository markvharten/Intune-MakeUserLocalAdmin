#Fill $username with the current logged in user
$username = (Get-WMIObject -class Win32_ComputerSystem | select username).username

#Add the username to the local administrator group
net localgroup administrators $username /add

#Create C:\Temp if it does not exist and place a file in C:\Temp for the detection rule
If(Test-Path C:\Temp) { "UserIsLocalAdmin" >> C:\Temp\UserIsLocalAdmin.txt } 
Else { New-Item -Path "c:\" -Name "Temp" -ItemType "directory"; "UserIsLocalAdmin" >> C:\Temp\UserIsLocalAdmin.txt }
