-- ENEMY LOCATIONS
enemySpawnerLocations = {
  Vector(900.0, -1380.0, 200.0),
  Vector(-400.0, -1280.0, 200.0)
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
showShop = false 
shopLocations = {
  Pistol = Trigger(Vector(-1940.0, 110.0, 100.0), 150, showShop, shopColor),
  Shotgun = Trigger(Vector(2810.0, 4100.0, 100.0), 150, showShop, shopColor),
  Rifle = Trigger(Vector(2850.0, -1710.0, 100.0), 150, showShop, shopColor),
  SMG = Trigger(Vector(-960.0, 4665.0, 100.0), 150, showShop, shopColor),
  Catz = Trigger(Vector(2810.0, 2180.0, 100.0), 150, showShop, shopColor),
  Game = Trigger(Vector(3330.0, 6650.0, 100.0), 100, showShop, shopColor)
}


for k,v in pairs(shopLocations) do
  v:SetValue("type", k)
end


-- THINGS THAT NEED DEFENSE
thingsThatNeedToBeDefended = {
  Vector(200.0, 5150.0, 800.0),
}

