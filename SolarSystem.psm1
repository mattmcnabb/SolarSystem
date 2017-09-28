class AstralObject
{
    [string]$Name
    [guid]$Id
}

class SolarSystem : AstralObject
{
    SolarSystem ($Name)
    {
        $this.Name = $Name
        $this.Id = New-Guid
    }
}

class Planet : AstralObject
{
    [SolarSystem]$SolarSystem

    Planet ($Name, [SolarSystem]$SolarSystem)
    {
        $this.Name = $Name
        $this.SolarSystem = $SolarSystem
        $this.Id = New-Guid
    }
}

class Moon : AstralObject
{
    [Planet]$Planet

    Moon ($Name, [Planet]$Planet)
    {
        $this.Name = $Name
        $this.Planet = $Planet
        $this.Id = New-Guid
    }
}

$Script:Sol = [SolarSystem]::new("Sol")

# planets
$Script:Planets = & {
    [Planet]::new("Mercury", $Sol)
    [Planet]::new("Venus", $Sol)
    [Planet]::new("Earth", $Sol)
    [Planet]::new("Mars", $Sol)
    [Planet]::new("Jupiter", $Sol)
    [Planet]::new("Saturn", $Sol)
    [Planet]::new("Uranus", $Sol)
    [Planet]::new("Neptune", $Sol)
}

# moons
$Script:Moons = & {
    [Moon]::new("Luna", $Earth)
    [Moon]::new("Deimos", $Mars)
    [Moon]::new("Phobos", $Mars)
}

function Get-SolarSystem
{
    $Sol
}

function Get-Planet
{
    $Planets
}

function Get-Moon
{
    $Moons
}

Export-ModuleMember -Variable *
