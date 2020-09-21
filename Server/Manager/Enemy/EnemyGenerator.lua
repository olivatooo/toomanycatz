Package:Require("Manager/Enemy/EnemyConfig.lua")
Package:Require("Manager/Enemy/EnemyAI.lua")

local budget = 0

function generateBudget(wave)
  budget = directorMoney[wave]
end

function getNextEnemy(wave)
  local pos = getRandomFromList(enemySpawnerLocations)
  local mq = Character(pos, Rotator(0,0,0), "NanosWorld::SK_Mannequin")
  local objective = getRandomFromList(thingsThatNeedToBeDefended)
  mq:SetValue("objective", objective)  
  mq:MoveTo(objective, 1)
  mq:LookAt(objective)
  mq:SetHealth(1)

 
  for k,v in pairs(enemyPrice) do
    if math.random(100) < v[1] then
      print("budget  " .. tostring(budget))
      if budget > 0 then
        local spentBudget = math.random(budget)
        budget = budget - spentBudget
        mq:SetSpeedMultiplier(mq:GetSpeedMultiplier()*v[3])
        local ss = v[4]
        -- TODO: Get scale
        mq:SetScale(Vector(1*ss, 1*ss, 1*ss))
        mq:SetHealth(spentBudget*(1/v[2])*mq:GetHealth())
      end
    end
  end


  mq:SetTintColor( 
    Color( (1/mq:GetHealth())/numPlayers, 
    ((100*mq:GetHealth())/directorMoney[#directorMoney])/numPlayers, 
    (wave/100) )
  )

  mq:SetValue("Reward", mq:GetHealth())
  return mq
end

