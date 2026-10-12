param(
    [Parameter(Mandatory = $true)]
    [string]$ResourceGroupName,

    [Parameter(Mandatory = $true)]
    [string]$Location
)

Write-Host "🔐 Connexion à Azure via l'identité GitHub Actions..."
Connect-AzAccount -Identity | Out-Null

Write-Host "📦 Vérification du Resource Group '$ResourceGroupName'..."

$rg = Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue

if ($null -eq $rg) {
    Write-Host "🚀 Création du Resource Group..."
    New-AzResourceGroup -Name $ResourceGroupName -Location $Location | Out-Null
    Write-Host "✅ Resource Group créé."
}
else {
    Write-Host "ℹ️ Le Resource Group existe déjà. Aucun changement."
}