Package:Require("Manager/GameState.lua")
Package:Require("Manager/Player.lua")
Package:Require("Config.lua")
Package:Require("Shop/WeaponShop.lua")
Package:Require("Weapon/WeaponGenerator.lua")


Player:on("Spawn", function(player)
  local initialLocation = getRandomFromList(playerStartLocations)
  local char = Character(initialLocation)
  char:SetTeam(playersTeam)
  char:SetSpeedMultiplier(1.15)
  player:Possess(char)
  initPlayer(player)
  numPlayers = numPlayers + 1
end)


Player:on("UnPossess", function(player, character, isPlayerDisconnecting)
  if (isPlayerDisconnecting) then
    character:Destroy()
    numPlayers = numPlayers - 1
  end
end)


Events:on("RestartGame", function(player) 
  restartGame() 
end)


Events:on("StartGame", function(player)
  startGame()
end)

