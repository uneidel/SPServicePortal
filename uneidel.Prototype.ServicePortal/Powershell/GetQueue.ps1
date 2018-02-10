
[Reflection.Assembly]::LoadFile("C:\Program Files\Microsoft SQL Server Compact Edition\v3.5\Desktop\System.Data.SqlServerCe.dll")

$connString = "Data Source=C:\Users\uneidel\Documents\ServicePortal.sdf" 
$cn = new-object "System.Data.SqlServerCe.SqlCeConnection" $connString

# create the command 
$cmd = new-object "System.Data.SqlServerCe.SqlCeCommand" 
$cmd.CommandType = [System.Data.CommandType]"Text" 
$cmd.CommandText = "SELECT * FROM OrderEntities" 
$cmd.Connection = $cn
#get the data 
$dt = new-object "System.Data.DataTable"
$cn.Open() 
Write-Host "Opening Connection to Database"
$rdr = $cmd.ExecuteReader()
$dt.Load($rdr) 
$cn.Close()
$dt | Format-Table -auto

