##########
#
# Bulk AD Credential Testing Script
# Elliot Voris | http://elliot.voris.me
# Function by CosmosKey, via StackOverflow (http://go.voris.me/ij0cm)
#
# Used to parse a CSV of username/password combinations
# and check those for validity against Active Directory
#
##########

#param($user_file)

Function Test-ADAuthentication {
	param($username,$password)
	(new-object directoryservices.directoryentry "",$username,$password).psbase.name -ne $null
}

$domain = "example.com"
$data = import-csv $user_file

foreach($row in $data) {
	if (Test-ADAuthentication "$domain\$username" "$password") {
		write-host "$username :: credentials valid"
	} else {
		write-host "$username :: credentials invalid" -foregroundcolor "red"
	}
}