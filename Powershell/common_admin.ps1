# Script to accomplish some of the common PowerShell tasks to administer Live@edu domains

########## FUNCTION DEFINITIONS ##########
##########################################
# Give the user a list of tasks he/she may wish to accomplish
function ListActions
{
	Write-Host "What would you like to do?"
	Write-Host "1. Change a user's password"
	Write-Host "2. Change a WindowsLiveID"
	Write-Host "3. Change a Primary Email Address"
        Write-Host "4. Create a new User Account"
	Write-Host "5. Quit"
}

function ChangePassword
{
	# Script to change a user's password
	$PasswordUser = Read-Host -prompt "Enter the user's WindowsLiveID: "
	$NewPassword = Read-Host -prompt "Enter the usere's new password: " -AsSecureString
	Set-Mailbox $PasswordUser -Password $NewPassword
}

function ChangeWLID
{
	# Script to change a WindowsLiveID
	$WLIDUser = Read-Host -prompt "Enter the user's current WindowsLiveID: "
	$NewWLID = Read-Host -prompt "Enter the user's new WindowsLiveID: "
	Set-Mailbox $WLIDUser -WindowsLiveID $NewWLID
}

function ChangeEmail
{
	# Script to change a primary email address
	$WLIDUser = Read-Host -prompt "Enter the user's WindowsLiveID: "
	$NewEmail = Read-Host -prompt "Enter the user's new Primary Email Address: "
	Set-Mailbox $WLIDUser -EmailAddresses SMTP:$NewEmail,$WLIDUser
}

function CreateNew
{
    # Script to create a new user account
    $FullName = Read-Host -prompt "Enter the full name: "
    $NewPassword = Read-Host -prompt "Enter the new Password: " -AsSecureString
    $NewWLID = Read-Host -prompt "Enter the new WindowsLiveID: "
    $FirstName = Read-Host -prompt "Enter the first name: "
    $LastName = Read-Host -prompt "Enter the last name: "
    New-Mailbox -Name "$FullName" -Password $NewPassword -WindowsLiveID $NewWLID -ResetPasswordOnNextLogon $false -FirstName $FirstName -LastName $LastName -DisplayName "$FullName"
}

function Quit
{
	# Remove the cloud-based session from the client-side session
	Remove-PSSession $session
}

########## INTERACTIVE PORTION ##########
# Prompt the user for their Live@edu administrative WindowsLiveID & Password
$LiveCredential = Get-Credential

# Create a new cloud-based session using the credentials the user just provided
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCredential -Authentication Basic -AllowRedirection

# Import cloud-based $session into the client-side session
Import-PSSession $Session

# List all the available script actions, and get the user's choice
while ( $UserTask -ne 5 )
{
	ListActions
	$UserTask = Read-Host
	if ( $UserTask -eq 1 ){ ChangePassword }
	if ( $UserTask -eq 2 ){ ChangeWLID }
	if ( $UserTask -eq 3 ){ ChangeEmail }
    if ( $UserTask -eq 4 ){ CreateNew }
	else { Write-Host "Please enter a number, 1-5" }
}
if ( $UserTask = 5 ){ Quit }