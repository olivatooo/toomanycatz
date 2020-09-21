Package:Require("GameState.lua")
Package:Require("../Config.lua")

function initializeThings()
  for t in pairs(thingsThatNeedToBeDefended) do
    t:on("BeginOverlap", function(actor)
        t.SetValue("HP", t.GetValue("HP") - 1)
        local hp = t.GetValue("HP")
        if hp == 0 then
          playersLostTheGame()        
        end
        actor:Destroy()
    end)
  end
end

-- TODO: Change this to enemy movement completed
-- initializeThings()

