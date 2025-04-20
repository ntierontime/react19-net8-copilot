# Define variables
$solutionPath = "C:\Github-Blog\react19-net8-copilot"
$dbContextProject = "$solutionPath\AdventureWorksLT2019.DbContext"
$connectionString = "Server=localhost;Database=AdventureWorksLT2019;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True"
$outputDir = "Models" # Directory inside DbContext project to store generated models
$contextName = "AdventureWorksLT2019Context"

# Navigate to the DbContext project directory
Set-Location $dbContextProject

# Scaffold the database
dotnet ef dbcontext scaffold `
    "$connectionString" `
    Microsoft.EntityFrameworkCore.SqlServer `
    --output-dir $outputDir `
    --context $contextName `
    --context-dir . `
    --force `
    --use-database-names

Write-Host "Scaffolding completed. Models and DbContext generated in $dbContextProject\$outputDir"