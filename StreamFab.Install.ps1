$HostPath = $PSScriptRoot

$TempWsb = Join-Path $env:TEMP "dynamic_sandbox.wsb"

Write-Host "Creating $TempWsb"
$WsbContent = @"
<Configuration>
  <MappedFolders>
    <MappedFolder>
      <HostFolder>$HostPath</HostFolder>
      <SandboxFolder>C:\Users\WDAGUtilityAccount\Desktop\Host</SandboxFolder>
      <ReadOnly>false</ReadOnly>
    </MappedFolder>
  </MappedFolders>
  <LogonCommand>
    <Command>C:\Users\WDAGUtilityAccount\Desktop\Host\StreamFab.Install.exe</Command>
  </LogonCommand>
</Configuration>
"@

# Write to $TempWsb
$WsbContent | Set-Content -Path $TempWsb

Write-Host "Starting Sandbox..."
Start-Process -FilePath $TempWsb
