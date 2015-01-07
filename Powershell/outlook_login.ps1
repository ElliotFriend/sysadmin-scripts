$livecred = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $livecred -Authentication Basic -AllowRedirection
Import-PSSession $Session
