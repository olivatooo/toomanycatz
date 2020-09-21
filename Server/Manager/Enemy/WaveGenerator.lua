Package:Require("Manager/Enemy/EnemyGenerator.lua")

-- Actual Wave
local wave = 0
local spawnedEnemies = 0
local pauseTime = 20
local killedEnemies = 0


Events:on("SpawnNextWave", function ()
  generateBudget(wave+1)
  Timer:SetTimeout(1000, function ()
    getNextEnemy(wave)
    if spawnedEnemies == 10 + wave then
      print("End spawning")
      spawnedEnemies = 0
      wave = wave + 1
      return false
    end
    spawnedEnemies = spawnedEnemies + 1
  end)
end)


Events:on("PauseBetweenWaves", function ()
  print("Pause initialized")
  local pt = pauseTime
  Timer:SetTimeout(1000, function ()
    pt = pt - 1
    print("Pause : " .. pt)
    -- TODO: Announce Wave
    -- Events:BroadcastRemote("AnnouncePause", {pt, wave+1})
    if pt == 0 then
      changeGameState(gameRunning_)
      return false
    end
  end)
end)


function cleanupBodiesInTheScene(character)
  Timer:SetTimeout(10000, function (c)
      local murder = c:GetValue("murder")
      if not murder == "world" then
        murder:SetValue("score", murder:GetValue("score")+1)
      end
      if not c:GetPlayer() then
        c:Destroy()
      end
    return false
  end, {character})
end


function rewardPlayers(c)
  local amount = c:GetHealth()
  Events:BroadcastRemote("IncreaseMoney", {amount})
end


Character:on("Death", function(character)
  print("someone died")
  rewardPlayers(character)
  cleanupBodiesInTheScene(character)

  killedEnemies = killedEnemies + 1
  print("Killed enemies:  ".. killedEnemies .. "/" .. tostring(10+wave)) 
  if killedEnemies == 10 + wave then
    print("Pause called")
    changeGameState(gamePause_)
  end
end)


Character:on("TakeDamage", function(self,  damage, dmgtype, bone, fromDirection, instigator)
  self:SetValue("murder", instigator)
end)

