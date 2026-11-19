# Empaqueta cada skill de cada plugin en dist/<plugin>/<skill>.zip
# para subirla a Claude (web/app), ChatGPT o Gemini.
# Cada ZIP contiene la carpeta de la skill con su SKILL.md dentro.
# Uso (desde la raíz del repo):  pwsh ./scripts/empaquetar-skills.ps1

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression, System.IO.Compression.FileSystem

$raiz = Split-Path -Parent $PSScriptRoot
$dist = Join-Path $raiz 'dist'
if (Test-Path $dist) { Remove-Item -Recurse -Force $dist }

Get-ChildItem (Join-Path $raiz 'plugins') -Directory | ForEach-Object {
    $plugin = $_
    $skills = Join-Path $plugin.FullName 'skills'
    if (-not (Test-Path $skills)) { return }

    Get-ChildItem $skills -Directory | Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') } | ForEach-Object {
        $skill = $_
        $destino = Join-Path $dist $plugin.Name
        New-Item -ItemType Directory -Force $destino | Out-Null
        $zip = Join-Path $destino "$($skill.Name).zip"

        $archivo = [System.IO.Compression.ZipFile]::Open($zip, 'Create')
        try {
            Get-ChildItem $skill.FullName -Recurse -File | ForEach-Object {
                $relativa = $_.FullName.Substring($skill.FullName.Length + 1) -replace '\\', '/'
                [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archivo, $_.FullName, "$($skill.Name)/$relativa") | Out-Null
            }
        } finally { $archivo.Dispose() }

        Write-Host "OK  dist/$($plugin.Name)/$($skill.Name).zip"
    }
}
