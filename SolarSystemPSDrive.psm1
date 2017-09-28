# create a hierarchy of
# - Solar system
#   - Planets
#     - Moons

using namespace Microsoft.PowerShell.SHiPS
using module .\SolarSystemPSDrivePlanets.psm1
using module .\SolarSystemPSDriveMoons.psm1

[SHiPSProvider(UseCache=$true)]
class SolarSystems : SHiPSDirectory
{
    SolarSystems([string]$name): base($name)
    {

    }

    [object[]] GetChildItem()
    {
        return @(Get-SolarSystem)
    }
}
