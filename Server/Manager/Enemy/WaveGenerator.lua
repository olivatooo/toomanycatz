Package:Require("../../Config.lua")
Package:Require("EnemyGenerator.lua")
Package:Require("../GameState.lua")

-- Actual Wave
local wave = 0
local spawnedEnemies = 0
local pauseTime = 20
local killedEnemies = 0


Events:on("SpawnNextWave", function ()
  generateBudget(wave)
  Timer:SetTimeout(1000, function ()
    getNextEnemy(wave)
    if spawnedEnemies == 10 + wave then
      spawnedEnemies = 0
      wave = wave + 1
      return false
    end
  end)
end)


Events:on("PauseBetweenWaves", function ()
  local pt = pauseTime
  Timer:SetTimeout(1000, function ()
    Events:BroadcastRemote("AnnouncePause", {pt, wave+1})
    if pt == 0 then
      changeGameState(gameRunning_)
      return false
    end
  end)
end)


function cleanupBodiesInTheScene(character)
  Timer:SetTimeout(10000, function (c)
    local murder = c:GetValue("murder")
    if murder then
      murder:SetValue("score", murder:GetValue("score")+1)
    end
    if not c:GetPlayer() then
      c:Destroy()
    end
  end, {character})
end


function rewardPlayers(c)
  local amount = c:GetHealth()
  Events:BroadcastRemote("IncreaseMoney", {amount})
end


Character:on("Death", function(character)
  rewardPlayers(character)
  cleanupBodiesInTheScene(character)

  killedEnemies = killedEnemies + 1
  
  if killedEnemies == 10 + wave then
    changeGameState(gamePause_)
  end
end)


Character:on("TakeDamage", function(self,  damage, dmgtype, bone, fromDirection, instigator)
  self:SetValue("murder", instigator)
end)

