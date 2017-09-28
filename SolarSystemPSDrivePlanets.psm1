using namespace Microsoft.PowerShell.SHiPS

[SHiPSProvider(UseCache = $true)]
class Planets : SHiPSDirectory
{
    Planets() : base ($this.GetType())
    {
    }

    Planets([string]$name): base($name)
    {
    }

    [object[]] GetChildItem()
    {
        return @(Get-Planet)
    }
}
