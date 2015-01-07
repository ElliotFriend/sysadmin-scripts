# Set the AD "EmployeeNumber" attribute to the student's id card barcode

Param(
  [string]$userfile
)

Import-Module ActiveDirectory
$data = import-csv $userfile
foreach($row in $data) {
    $username = $row.usrname
    $barcode = $row.barcode
    if (dsquery user -samid $username) {
        Set-ADUser -Identity $username -EmployeeNumber $barcode
    } else {
        echo "User Not Found $username"
    }
}