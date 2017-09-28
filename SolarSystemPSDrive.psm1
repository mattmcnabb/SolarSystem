# create a hierarchy of
# - Solar system
#   - Planets
#     - Moons

using namespace Microsoft.PowerShell.SHiPS

class SolarSystems : SHiPSDirectory
{
    SolarSystems([string]$name): base($name)
    {

    }

    [object[]] GetChildItem()
    {
        
    }

}
