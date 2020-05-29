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

$header = "userId,hireDate,isBC,isClicker,isEUA"

$header | Out-File -FilePath C:\Repositories\ScriptMigo\Non-Project-Code\random.csv -Append 

for ($i = 0; $i -lt 2501; $i++) {
    $user = "User" + $i
    $hireDate = (Get-Randomdate -min "06/23/1996 14:06:03.297").tostring("MM-dd-yyyy")
    $value1 = 0,1 | Get-Random
    $value2 = 0,1 | Get-Random
    $value3 = 0,1 | Get-Random
    
    $outString = $user + "," + $hireDate + "," + $value1 + "," + $value2+ "," + $value3
    $outString | Out-File -FilePath C:\Repositories\ScriptMigo\Non-Project-Code\random.csv -Append 
}