# Take my file as a parameter
Param(
  [string]$Userfile
)

# Adds cmdlet to Powershell
Import-Module ActiveDirectory

# Import the CSV information provided into an array
$List = Import-Csv $Userfile

#Start Logging
$dt = Get-Date -format "yyyyMMdd"
$log = "ADlogfile_$dt.log"
$file = "logs\" + $log
Start-Transcript $file

# Go through EACH item in the list (Header row is treated as variable names by default)
Foreach ($User in $List) {

    $Firstname = $User.First
    $Lastname = $User.Last
    $Username = $User.Username
    $Email = $User.Email
    $Password = ConvertTo-SecureString -AsPlainText $User.Password -Force

    $domain='@example.com'
    $DomainStudents = 'Domain Students'
    $StudentOU = 'OU=Students,DC=example,DC=com'
 
    $Alias = "$Firstname $Lastname"
    $UPN = $Username+$domain
    $DisplayName = $Firstname+" "+$Lastname

    # SAM userid cannot be greater than 20 characters - Legacy
    $Sam = $Username
    $Sam = (($Sam + '                    ').Substring(0,20)).Trimend()

    #Display Student Name for log file
    Write-Host "`r`n$DisplayName`r`n"
    
    # Create actual user account
    New-ADUser -Name $Displayname -SamAccountName $Sam -GivenName $Firstname -Surname $Lastname -DisplayName $Displayname -Path $StudentOU -UserPrincipalName $UPN -AccountPassword $Password -ChangePasswordAtLogon $false -Enabled $true

    # Add the newly create user to the 'Domain Students' group
    Add-ADGroupMember -Identity $DomainStudents -Members "CN=$DisplayName,$StudentOU"
}

#Stop logging and disconnect from DC
Stop-Transcript