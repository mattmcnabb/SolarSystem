using namespace Microsoft.PowerShell.SHiPS

class SolarSystem : SHiPSDirectory
{
    SolarSystem([string]$Name): base($Name)
    {

    }

    [object[]] GetChildItem()
    {
        return @(Get-Planet)
    }
}

class Planet : SHiPSDirectory
{
    [string]$PlanetName
    [Moon[]]$Moons

    Planet([string]$PlanetName, [Moon[]]$Moons): base($PlanetName)
    {
        $this.PlanetName = $PlanetName
        $this.Moons = $Moons
    }

    [object[]] GetChildItem()
    {
        return @(Get-Moon -PlanetName $this.PlanetName)
    }
}

class Moon : SHiPSLeaf
{
    [string]$MoonName

    Moon($MoonName): base($MoonName)
    {
        $this.MoonName = $MoonName
    }
}

function Get-Planet
{
    $Planets.Values
}

function Get-Moon
{
    param ($PlanetName)

    $Planets["$PlanetName"] | Select-Object -ExpandProperty Moons
}

$Script:Moons = @{
    Luna     = [Moon]::new("Luna")
    Deimos   = [Moon]::new("Deimos")
    Phobos   = [Moon]::new("Phobos")
    Io       = [Moon]::new("Io")
    Europa   = [Moon]::new("Europa")
    Ganymede = [Moon]::new("Ganymede")
    Calisto  = [Moon]::new("Calisto")
    Thebe    = [Moon]::new("Thebe")
    Titan    = [Moon]::new("Titan")
    Rhea     = [Moon]::new("Rhea")
    Dione    = [Moon]::new("Dione")
    Tethys   = [Moon]::new("Tethys")
    Iapetus  = [Moon]::new("Iapetus")
    Oberon   = [Moon]::new("Oberon")
    Titania  = [Moon]::new("Titania")
    Umbriel  = [Moon]::new("Umbriel")
    Ariel    = [Moon]::new("Ariel")
    Miranda  = [Moon]::new("Miranda")
    Triton   = [Moon]::new("Triton")
    Proteus  = [Moon]::new("Proteus")
}

$Script:Planets = @{
    Mercury = [Planet]::new("Mercury", $null)
    Venus   = [Planet]::new("Venus", $null)
    Earth   = [Planet]::new("Earth", $Moons["Luna"])
    Mars    = [Planet]::new("Mars", @($Moons["Deimos"], $Moons["Phobos"]))
    Jupiter = [Planet]::new("Jupiter", @($Moons["Io"], $Moons["Europa"],$Moons["Ganymede"], $Moons["Calisto"], $Moons["Thebe"]))
    Saturn  = [Planet]::new("Saturn", @($Moons["Titan"], $Moons["Rhea"],$Moons["Dione"], $Moons["Tethys"],$Moons["Iapetus"]))
    Uranus  = [Planet]::new("Uranus", @($Moons["Oberon"], $Moons["Titania"],$Moons["Umbriel"], $Moons["Ariel"],$Moons["Miranda"]))
    Neptune = [Planet]::new("Neptune", @($Moons["Proteus"],$Moons["Triton"]))
}
