Param(
  [string]$Userfile
)

$data = Import-CSV $Userfile

ForEach($row in $data) {
	Set-Mailbox -Identity $row.Name -WindowsLiveID $row.WindowsLiveID
}