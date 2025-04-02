-- Addon Initialization
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")

-- Define Available Locations
local teleportLocations = {
    alterac = "Alterac Mountains",
    arathi = "Arathi Highlands",
    ash = "Ashenvale",
    az = "Azshara",
    ai = "Azuremyst Isle",
    badlands = "Badlands",
    brm = "Blackrock Mountain",
    bem = "Blade's Edge Mountains",
    bl = "Blasted Lands",
    bi = "Bloodmyst Isle",
    bt = "Borean Tundra",
    bs = "Burning Steppes",
    cf = "Crystalsong Forest",
    dal = "Dalaran",
    darkshore = "Darkshore",
    darn = "Darnassus",
    dwp = "Deadwind Pass",
    desolace = "Desolace",
    db = "Dragonblight",
    dm = "Dun Morogh",
    durotar = "Durotar",
    duskwood = "Duskwood",
    dwm = "Dustwallow Marsh",
    epl = "Eastern Plaguelands",
    elwynn = "Elwynn Forest",
    eversong = "Eversong Woods",
    felwood = "Felwood",
    feralas = "Feralas",
    ghostlands = "Ghostlands",
    gh = "Grizzly Hills",
    hfp = "Hellfire Peninsula",
    hillsbrad = "Hillsbrad Foothills",
    hf = "Howling Fjord",
    icecrown = "Icecrown",
    ["if"] = "Ironforge",
    iqd = "Isle of Quel'Danas",
    lm = "Loch Modan",
    moonglade = "Moonglade",
    mulgore = "Mulgore",
    nagrand = "Nagrand",
    ns = "Netherstorm",
    org = "Orgrimmar",
    redridge = "Redridge Mountains",
    sg = "Searing Gorge",
    smv = "Shadowmoon Valley",
    shat = "Shattrath City",
    shol = "Sholazar Basin",
    silithus = "Silithus",
    smc = "Silvermoon City",
    silverpine = "Silverpine Forest",
    stonetalon = "Stonetalon Mountains",
    sw = "Stormwind City",
    stv = "Stranglethorn Vale",
    sos = "Swamp of Sorrows",
    tanaris = "Tanaris",
    tel = "Teldrassil",
    terokkar = "Terokkar Forest",
    barrens = "The Barrens",
    exodar = "The Exodar",
    hinterlands = "The Hinterlands",
    stormpeaks = "The Storm Peaks",
    ["1k"] = "Thousand Needles",
    tb = "Thunder Bluff",
    tirisfal = "Tirisfal Glades",
    ungoro = "Un'Goro Crater",
    uc = "Undercity",
    wpl = "Western Plaguelands",
    westfall = "Westfall",
    wetlands = "Wetlands",
    wg = "Wintergrasp",
    winterspring = "Winterspring",
    zang = "Zangarmarsh",
    zuldrak = "Zul'Drak"
}

-- Helper Function to Match User Input
local function findLocation(input)
    for alias, location in pairs(teleportLocations) do
        if #input >= 3 and #input <= 12 and 
           (alias:sub(1, #input) == input or location:lower():sub(1, #input) == input:lower()) then
            return location
        end
    end
    return nil
end

-- Command Registration
local function handleWarpCommand(input)
    local location = findLocation(input)
    if location then
        print("Matched input '" .. input .. "' to location: " .. location .. ". Teleporting now!")
        CustomTeleportName(location)
    else
        print("Location not found. Please try again with 3-12 letters.")
    end
end

SLASH_WARP1 = "/warp"
SlashCmdList["WARP"] = function(input)
    input = input:lower():gsub("%s+", "") -- Normalize input (lowercase and remove spaces)
    handleWarpCommand(input)
end