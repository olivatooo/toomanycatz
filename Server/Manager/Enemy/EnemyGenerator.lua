Package:Require("EnemyConfig.lua")

local budget = 0

function generateBudget(wave)
  budget = directorMoney[wave]
end

function getNextEnemy(wave)
  local pos = getRandomFromList(enemySpawnerLocations)
  local mq = Character(pos, Rotator(0,0,0), "NanosWorld::SK_Mannequin")
  
  mq:SetHealth(1)

 
  for k,v in pairs(enemyPrice) do
    if math.random(100) < v[0] then
      if budget > 0 then
        local spentBudget = math.random(budget)
        budget = budget - spentBudget
        mq:SetSpeedMultiplier(mq:GetSpeedMultiplier()*v[2])
        local ss = v[3]
        -- TODO: Get scale
        mq:SetScale(Vector(1*ss, 1*ss, 1*ss))
        mq:SetHealth(spentBudget*(1/v[1])*mq:GetHealth())
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

