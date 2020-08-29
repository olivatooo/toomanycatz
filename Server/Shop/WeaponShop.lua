
-- Configure the shop locations
function initializeShop()
  for k,v in pairs(shopLocations) do
    v:on("BeginOverlap", function(actor)
      if actor:GetType() == "Character" then
        -- TODO
        -- Events:CallRemote("EnterShop", actor:GetPlayer(), v:GetValue("type"))
      end
    end)
    v:on("EndOverlap", function(actor)
      if actor:GetType() == "Character" then
        Events:CallRemote("LeaveShop", actor:GetPlayer(), {})
      end
    end)
  end
end

initializeShop()

