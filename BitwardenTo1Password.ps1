$Data = Import-Csv .\bitwarden_export_20190120205949.csv

$OutFile = @()
Foreach ($line in $Data) {
	if ($line.type -like "login") {
		$Details = "" | Select title,website,username,password,notes
		#title,website,username,password,notes,custom field 1,custom field 2, custom field …
		$Details.title = $line.name
		$Details.website = $line.login_uri
		$Details.username = $line.login_username
		$Details.password = $line.login_password
		$Details.notes = $line.notes
	}
	
	if ($line.type -like "note") {
		$Details = "" | Select title,notes
		#title,text of note
		$Details.title = $line.name
		$Details.notes = $line.notes
	}
	
	$OutFile += $Details
}

$OutFile | Export-Csv -Path C:\Temp\1Password_Import_File.csv -NoTypeInformation -Encoding UTF8
# Dette er en test
