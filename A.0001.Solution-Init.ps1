# Define solution and project paths
$solutionPath = "C:\Github-Blog\react19-net8-copilot"
$solutionName = "AdventureWorksLT2019"
$solutionFile = "$solutionPath\$solutionName.sln"

# Create solution directory
New-Item -ItemType Directory -Path $solutionPath -Force

# Create the solution
dotnet new sln -n $solutionName -o $solutionPath

# Create projects with solution name as prefix
dotnet new webapi -n "$solutionName.WebApi" -o "$solutionPath\$solutionName.WebApi" --framework net8.0
dotnet new blazor -n "$solutionName.Blazor" -o "$solutionPath\$solutionName.Blazor" --framework net8.0
dotnet new razor -n "$solutionName.RazorPage" -o "$solutionPath\$solutionName.RazorPage" --framework net8.0
dotnet new func -n "$solutionName.HttpTriggerFunctions" -o "$solutionPath\$solutionName.HttpTriggerFunctions"
dotnet new func -n "$solutionName.TimerTriggerFunctions" -o "$solutionPath\$solutionName.TimerTriggerFunctions"
dotnet new classlib -n "$solutionName.DbContext" -o "$solutionPath\$solutionName.DbContext" --framework net8.0
dotnet new classlib -n "$solutionName.MSSqlRepositories" -o "$solutionPath\$solutionName.MSSqlRepositories" --framework net8.0
dotnet new classlib -n "$solutionName.RepositoriesInterfaces" -o "$solutionPath\$solutionName.RepositoriesInterfaces" --framework net8.0
dotnet new classlib -n "$solutionName.Services" -o "$solutionPath\$solutionName.Services" --framework net8.0
dotnet new classlib -n "$solutionName.ServiceInterfaces" -o "$solutionPath\$solutionName.ServiceInterfaces" --framework net8.0
dotnet new classlib -n "$solutionName.Models" -o "$solutionPath\$solutionName.Models" --framework net8.0
dotnet new classlib -n "$solutionName.Utilities" -o "$solutionPath\$solutionName.Utilities" --framework net8.0
dotnet new classlib -n "$solutionName.Shared" -o "$solutionPath\$solutionName.Shared" --framework net8.0

# Add projects to the solution
dotnet sln $solutionFile add "$solutionPath\$solutionName.WebApi\$solutionName.WebApi.csproj"
dotnet sln $solutionFile add "$solutionPath\$solutionName.Blazor\$solutionName.Blazor.csproj"
dotnet sln $solutionFile add "$solutionPath\$solutionName.RazorPage\$solutionName.RazorPage.csproj"
dotnet sln $solutionFile add "$solutionPath\$solutionName.HttpTriggerFunctions\$solutionName.HttpTriggerFunctions.csproj"
dotnet sln $solutionFile add "$solutionPath\$solutionName.TimerTriggerFunctions\$solutionName.TimerTriggerFunctions.csproj"
dotnet sln $solutionFile add "$solutionPath\$solutionName.DbContext\$solutionName.DbContext.csproj"
dotnet sln $solutionFile add "$solutionPath\$solutionName.MSSqlRepositories\$solutionName.MSSqlRepositories.csproj"
dotnet sln $solutionFile add "$solutionPath\$solutionName.RepositoriesInterfaces\$solutionName.RepositoriesInterfaces.csproj"
dotnet sln $solutionFile add "$solutionPath\$solutionName.Services\$solutionName.Services.csproj"
dotnet sln $solutionFile add "$solutionPath\$solutionName.ServiceInterfaces\$solutionName.ServiceInterfaces.csproj"
dotnet sln $solutionFile add "$solutionPath\$solutionName.Models\$solutionName.Models.csproj"
dotnet sln $solutionFile add "$solutionPath\$solutionName.Utilities\$solutionName.Utilities.csproj"
dotnet sln $solutionFile add "$solutionPath\$solutionName.Shared\$solutionName.Shared.csproj"

# Add project references
dotnet add "$solutionPath\$solutionName.Services\$solutionName.Services.csproj" reference "$solutionPath\$solutionName.ServiceInterfaces\$solutionName.ServiceInterfaces.csproj"
dotnet add "$solutionPath\$solutionName.MSSqlRepositories\$solutionName.MSSqlRepositories.csproj" reference "$solutionPath\$solutionName.RepositoriesInterfaces\$solutionName.RepositoriesInterfaces.csproj"
dotnet add "$solutionPath\$solutionName.Services\$solutionName.Services.csproj" reference "$solutionPath\$solutionName.Models\$solutionName.Models.csproj"
dotnet add "$solutionPath\$solutionName.MSSqlRepositories\$solutionName.MSSqlRepositories.csproj" reference "$solutionPath\$solutionName.Models\$solutionName.Models.csproj"
dotnet add "$solutionPath\$solutionName.RepositoriesInterfaces\$solutionName.RepositoriesInterfaces.csproj" reference "$solutionPath\$solutionName.Models\$solutionName.Models.csproj"
dotnet add "$solutionPath\$solutionName.ServiceInterfaces\$solutionName.ServiceInterfaces.csproj" reference "$solutionPath\$solutionName.Models\$solutionName.Models.csproj"
dotnet add "$solutionPath\$solutionName.WebApi\$solutionName.WebApi.csproj" reference "$solutionPath\$solutionName.Services\$solutionName.Services.csproj"
dotnet add "$solutionPath\$solutionName.WebApi\$solutionName.WebApi.csproj" reference "$solutionPath\$solutionName.MSSqlRepositories\$solutionName.MSSqlRepositories.csproj"
dotnet add "$solutionPath\$solutionName.WebApi\$solutionName.WebApi.csproj" reference "$solutionPath\$solutionName.Models\$solutionName.Models.csproj"
dotnet add "$solutionPath\$solutionName.WebApi\$solutionName.WebApi.csproj" reference "$solutionPath\$solutionName.Utilities\$solutionName.Utilities.csproj"
dotnet add "$solutionPath\$solutionName.WebApi\$solutionName.WebApi.csproj" reference "$solutionPath\$solutionName.Shared\$solutionName.Shared.csproj"
dotnet add "$solutionPath\$solutionName.Blazor\$solutionName.Blazor.csproj" reference "$solutionPath\$solutionName.Services\$solutionName.Services.csproj"
dotnet add "$solutionPath\$solutionName.Blazor\$solutionName.Blazor.csproj" reference "$solutionPath\$solutionName.MSSqlRepositories\$solutionName.MSSqlRepositories.csproj"
dotnet add "$solutionPath\$solutionName.Blazor\$solutionName.Blazor.csproj" reference "$solutionPath\$solutionName.Models\$solutionName.Models.csproj"
dotnet add "$solutionPath\$solutionName.Blazor\$solutionName.Blazor.csproj" reference "$solutionPath\$solutionName.Utilities\$solutionName.Utilities.csproj"
dotnet add "$solutionPath\$solutionName.Blazor\$solutionName.Blazor.csproj" reference "$solutionPath\$solutionName.Shared\$solutionName.Shared.csproj"
dotnet add "$solutionPath\$solutionName.RazorPage\$solutionName.RazorPage.csproj" reference "$solutionPath\$solutionName.Services\$solutionName.Services.csproj"
dotnet add "$solutionPath\$solutionName.RazorPage\$solutionName.RazorPage.csproj" reference "$solutionPath\$solutionName.MSSqlRepositories\$solutionName.MSSqlRepositories.csproj"
dotnet add "$solutionPath\$solutionName.RazorPage\$solutionName.RazorPage.csproj" reference "$solutionPath\$solutionName.Models\$solutionName.Models.csproj"
dotnet add "$solutionPath\$solutionName.RazorPage\$solutionName.RazorPage.csproj" reference "$solutionPath\$solutionName.Utilities\$solutionName.Utilities.csproj"
dotnet add "$solutionPath\$solutionName.RazorPage\$solutionName.RazorPage.csproj" reference "$solutionPath\$solutionName.Shared\$solutionName.Shared.csproj"
dotnet add "$solutionPath\$solutionName.HttpTriggerFunctions\$solutionName.HttpTriggerFunctions.csproj" reference "$solutionPath\$solutionName.Services\$solutionName.Services.csproj"
dotnet add "$solutionPath\$solutionName.HttpTriggerFunctions\$solutionName.HttpTriggerFunctions.csproj" reference "$solutionPath\$solutionName.MSSqlRepositories\$solutionName.MSSqlRepositories.csproj"
dotnet add "$solutionPath\$solutionName.HttpTriggerFunctions\$solutionName.HttpTriggerFunctions.csproj" reference "$solutionPath\$solutionName.Models\$solutionName.Models.csproj"
dotnet add "$solutionPath\$solutionName.HttpTriggerFunctions\$solutionName.HttpTriggerFunctions.csproj" reference "$solutionPath\$solutionName.Utilities\$solutionName.Utilities.csproj"
dotnet add "$solutionPath\$solutionName.HttpTriggerFunctions\$solutionName.HttpTriggerFunctions.csproj" reference "$solutionPath\$solutionName.Shared\$solutionName.Shared.csproj"
dotnet add "$solutionPath\$solutionName.TimerTriggerFunctions\$solutionName.TimerTriggerFunctions.csproj" reference "$solutionPath\$solutionName.Services\$solutionName.Services.csproj"
dotnet add "$solutionPath\$solutionName.TimerTriggerFunctions\$solutionName.TimerTriggerFunctions.csproj" reference "$solutionPath\$solutionName.MSSqlRepositories\$solutionName.MSSqlRepositories.csproj"
dotnet add "$solutionPath\$solutionName.TimerTriggerFunctions\$solutionName.TimerTriggerFunctions.csproj" reference "$solutionPath\$solutionName.Models\$solutionName.Models.csproj"
dotnet add "$solutionPath\$solutionName.TimerTriggerFunctions\$solutionName.TimerTriggerFunctions.csproj" reference "$solutionPath\$solutionName.Utilities\$solutionName.Utilities.csproj"
dotnet add "$solutionPath\$solutionName.TimerTriggerFunctions\$solutionName.TimerTriggerFunctions.csproj" reference "$solutionPath\$solutionName.Shared\$solutionName.Shared.csproj"

# Add NuGet packages
dotnet add "$solutionPath\$solutionName.DbContext\$solutionName.DbContext.csproj" package Microsoft.EntityFrameworkCore.SqlServer
dotnet add "$solutionPath\$solutionName.DbContext\$solutionName.DbContext.csproj" package Microsoft.EntityFrameworkCore.Tools
dotnet add "$solutionPath\$solutionName.WebApi\$solutionName.WebApi.csproj" package Microsoft.EntityFrameworkCore.SqlServer
dotnet add "$solutionPath\$solutionName.WebApi\$solutionName.WebApi.csproj" package Microsoft.AspNetCore.Identity.EntityFrameworkCore
dotnet add "$solutionPath\$solutionName.RazorPage\$solutionName.RazorPage.csproj" package Microsoft.AspNetCore.Identity.EntityFrameworkCore
dotnet add "$solutionPath\$solutionName.Blazor\$solutionName.Blazor.csproj" package Microsoft.EntityFrameworkCore.SqlServer
dotnet add "$solutionPath\$solutionName.HttpTriggerFunctions\$solutionName.HttpTriggerFunctions.csproj" package Microsoft.EntityFrameworkCore.SqlServer
dotnet add "$solutionPath\$solutionName.TimerTriggerFunctions\$solutionName.TimerTriggerFunctions.csproj" package Microsoft.EntityFrameworkCore.SqlServer

# Add Docker support
dotnet new dockerfile -n "$solutionName.WebApi" -o "$solutionPath\$solutionName.WebApi"
dotnet new dockerfile -n "$solutionName.Blazor" -o "$solutionPath\$solutionName.Blazor"
dotnet new dockerfile -n "$solutionName.RazorPage" -o "$solutionPath\$solutionName.RazorPage"
dotnet new dockerfile -n "$solutionName.HttpTriggerFunctions" -o "$solutionPath\$solutionName.HttpTriggerFunctions"
dotnet new dockerfile -n "$solutionName.TimerTriggerFunctions" -o "$solutionPath\$solutionName.TimerTriggerFunctions"

Write-Host "Solution and projects created successfully at $solutionPath"