using namespace Microsoft.PowerShell.SHiPS

[SHiPSProvider(UseCache = $true)]
class Moons : SHiPSDirectory
{
    Moons() : base ($this.GetType())
    {
    }

    Moons([string]$name): base($name)
    {
    }

    [object[]] GetChildItem()
    {
        return @(Get-Moon)
    }
}
