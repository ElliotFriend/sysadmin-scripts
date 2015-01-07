# Create Office 365 accounts from our local active directory domain
Param(
  [string]$Userfile
)

$LocalDomain = "@example.local"
$EmailDomain = "@example.com"
# Import-Module ActiveDirectory

# Prompt for Admin email/password
$LiveCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

$ADUsers = Get-ADUser -Filter * -SearchBase "OU=Students,DC=example,DC=local"
$CSVUsers = Import-CSV $Userfile

# Foreach ($User in $CSVUsers) {
    # if (Get-ADUser -Identity $User.username) {
        # echo "Account Found, changing password`r`n"
        # $pass = ConvertTo-SecureString -AsPlainText $User.password -Force
        # Set-ADAccountPassword -Identity $User.username -NewPassword $pass
    # }
    # else {
        # echo "Account NOT Found`r`n"
    # }
# }

# Foreach($User in $ADUsers) {
    # if ($Mailbox = Get-Mailbox -Identity $User.name) {
        # $good_email = $User.SamAccountName + $EmailDomain
        # if ($Mailbox.WindowsLiveID -eq $good_email ) {
            # Write-Host $User.SamAccountName "MSOLID OK"
            # if ($Mailbox.PrimarySmtpAddress -eq $good_email) {
                # Write-Host $User.SamAccountName "SMTP Address OK"
                # Write-Host "CHANGING Password"
            # }
            # else {
                # Write-Host "CHANGING SMTP Address"
                # Set-Mailbox $User.name -PrimarySmtpAddress $good_email
            # }
        # }
        # else {
            # Write-Host $User.SamAccountName "CHANGING MSOLID"
            # Set-Mailbox $User.name -MicrosoftOnlineServicesID $good_email
            # Set-Mailbox $User.name -PrimarySmtpAddress $good_email
        # }
    # }
    # else {
        # Write-Host $User.name ":: NOT FOUND"
    # }
# }

Foreach ($User in $CSVUsers) {
    if ($Mailbox = Get-Mailbox -Identity $User.full) {
        echo "Found Mailbox" $Mailbox.MicrosoftOnlineServicesID
        Set-Mailbox $User.full -CustomAttribute1 "AIM"
        if ($Mailbox.MicrosoftOnlineServicesID = $User.email) {
            echo "Mailboxes Match, Changing Password"
            Set-MsolUserPassword -UserPrincipalName $User.email -NewPassword $User.password -ForceChangePassword $false
            echo `r`n
        }
        else {
            echo "Mailboxes Don't Match - FIX IT`r`n"
        }
    }
    else {
        echo "NOT FOUND"
    }
}
#Set-MsolUserPassword -UserPrincipalName portia.porter@slcconline.edu -NewPassword "fancynewpassword"