-- WaveGenerator.lua
Package:Require("Manager/Enemy/EnemyGenerator.lua")

local wave = 0 
local spawnedEnemies = 0
local killedEnemies = 0
pt = 60

Events:on("SpawnNextWave", function ()
  generateBudget(wave+1)
  -- Events:BroadcastRemote("ChangeGameMusic", {false})
  Timer:SetTimeout(1000, function ()
    getNextEnemy(wave)
    Events:BroadcastRemote("setEnemies", {"Wave " .. wave+1 .. "-" ..10+wave-killedEnemies})
    if spawnedEnemies == 10 + wave then
      spawnedEnemies = 0
      wave = wave + 1
      return false
    end
    spawnedEnemies = spawnedEnemies + 1
  end)
end)


Events:on("PauseBetweenWaves", function ()

  -- Events:BroadcastRemote("ChangeGameMusic", {true})

  for k,v in pairs(Player) do
    v:SetValue("rtv", false)
  end

  pt = 60
  Timer:SetTimeout(1000, function ()
    Events:BroadcastRemote("setEnemies", {pt ..  "s - Press Z to Skip"})
    pt = pt - 1
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
  local amount = c:GetValue("Reward")
  if amount == nil then
    amount = 0
  end
  for k,v in pairs(Player) do
    v:SetValue("bank", v:GetValue("bank")+amount)
    print(amount .. " " .. v:GetValue("bank"))
    Events:CallRemote("setMoney",v, {v:GetValue("bank")})
  end
end


Character:on("Death", function(character)
  rewardPlayers(character)
  cleanupBodiesInTheScene(character)
  killedEnemies = killedEnemies + 1
  Events:BroadcastRemote("setEnemies", {"Wave " .. wave+1 .. "-" ..10+wave-killedEnemies})
  if killedEnemies == 10 + wave then
    killedEnemies = 0
    changeGameState(gamePause_)
  end
end)


Character:on("TakeDamage", function(self,  damage, dmgtype, bone, fromDirection, instigator)
  self:SetValue("murder", instigator)
end)

