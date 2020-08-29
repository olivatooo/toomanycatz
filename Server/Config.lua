Package:Require("Prices.lua")


-- ENEMY LOCATIONS
enemySpawnerLocations = {
  Vector(900.0, -1380.0, 50.125122),
  Vector(-400.0, -1280.0, 50.125122)
}


-- PLAYER LOCATIONS
playerStartLocations = {
  Vector(3470.0, 5950.0, 142.0),
  Vector(3370.0, 5950.0, 142.0),
  Vector(3270.0, 5950.0, 142.0),
  Vector(3170.0, 5950.0, 142.0),   
}


-- SHOP LOCATIONS
shopColor = Color(1, 0, 0, 1)
showShop = true 
shopLocations = {
  pistol = Trigger(Vector(2850.0, 4280.0, 100.0), 150, showShop, shopColor),
  shotgun = Trigger(Vector(2850.0, 3750.0, 100.0), 150, showShop, shopColor),
  rifle = Trigger(Vector(2850.0, 3290.0, 100.0), 150, showShop, shopColor),
  SMG = Trigger(Vector(2850.0, 2780.0, 100.0), 150, showShop, shopColor),
  catz = Trigger(Vector(2850.0, 2270.0, 100.0), 150, showShop, shopColor),
  misc = Trigger(Vector(3850.0, 3770.0, 100.0), 150, showShop, shopColor),
  explosive = Trigger(Vector(3850.0, 2770.0, 100.0), 150, showShop, shopColor),
}


for k,v in pairs(shopLocations) do
  v:SetValue("type", k)
end


-- THINGS THAT NEED DEFENSE
thingsThatNeedToBeDefended = {
  Trigger(Vector(200.0, 5150.0, 800.0), 200, false, Color(1, 0, 0, 1)),
}

