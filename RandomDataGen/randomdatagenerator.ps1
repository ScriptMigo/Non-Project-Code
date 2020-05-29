# Random data generator

Function Get-RandomDate {
    [cmdletbinding()]

    param(
        [DateTime]
        $Min,

        [DateTime]
        $Max = [DateTime]::Now
    )

    Begin{
        If(!$Min -or !$Max){
            Write-Warning "Unable to parse entered string for Min or Max parameter. Proper example: `"06/23/1996 14:06:03.297`""
            Write-Warning "Time will default to midnight if omitted"
            Break
        }
    }

    Process{
        $randomTicks = Get-Random -Minimum $Min.Ticks -Maximum $Max.Ticks
        New-Object DateTime($randomTicks)
    }
}


$header = "userId,hireDate,yearsEmployed,isBC,isClicker,isEUA,pmTrainings,realP"

$header | Out-File -FilePath C:\Repositories\ScriptMigo\Non-Project-Code\RandomDataGen\random.csv -Append 

for ($i = 0; $i -lt 2501; $i++) {
    $user = "User" + $i
    $hireDate = (Get-Randomdate -min "06/23/1996 14:06:03.297")
    $hireTimeDiff = (get-date).year - $hireDate.year
    $yearsEmployed = $hireTimeDiff
    if ($hireTimeDiff -eq 0) {
        $hireTimeDiff = $hireTimeDiff + 1
    }
    $pmTrainings = get-random -minimum 0 -maximum $hireTimeDiff
    $hireDate = $hireDate.tostring("MM-dd-yyyy")
    if ($i % 3 -eq 0) {
        $value1 = 0,1 | Get-Random    
    }
    else {
        $value1 = 0
    }

    if ($i % 7 -eq 0) {
        $value2 = 0,1 | Get-Random    
    }
    else {
        $value2 = 0
    }

    if ($i % 3 -eq 0) {
        $value3 = 0,1 | Get-Random    
    }
    else {
        $value3 = 0
    }

    if ($value2 -eq 1) {
        $realP = 0,1 | Get-Random    
    }
    elseif ($i % 47 -eq 0) {
        $realP = 0,1 | Get-Random
    }
    else {
        $realP = 0
    }
    
    
    $outString = $user + "," + $hireDate + "," + $yearsEmployed + "," + $value1 + "," + $value2 + "," + $value3 + "," + $pmTrainings + "," + $realP
    $outString | Out-File -FilePath C:\Repositories\ScriptMigo\Non-Project-Code\RandomDataGen\random.csv -Append 
}