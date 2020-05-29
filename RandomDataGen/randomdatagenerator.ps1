# Random data generator
$header = "userId,isBC,isClicker,isEUA"

$header | Out-File -FilePath C:\Repositories\ScriptMigo\Non-Project-Code\random.csv -Append 

for ($i = 0; $i -lt 2501; $i++) {
    $user = "User" + $i
    $value1 = 0,1 | Get-Random
    $value2 = 0,1 | Get-Random
    $value3 = 0,1 | Get-Random
    
    $outString = $user + "," + $value1 + "," + $value2+ "," + $value3
    $outString | Out-File -FilePath C:\Repositories\ScriptMigo\Non-Project-Code\random.csv -Append 
}