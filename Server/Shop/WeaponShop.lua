-- Configure the shop locations
function initializeShop()
  for k,v in pairs(shopLocations) do
    v:on("BeginOverlap", function(actor)
      if actor:GetType() == "Character" then
        Events:CallRemote("EnterShop", actor:GetPlayer(), {v:GetValue("type")})
      end
    end)
    v:on("EndOverlap", function(actor)
      if actor:GetType() == "Character" then
        Events:CallRemote("LeaveShop", actor:GetPlayer(), {})
      end
    end)
  end
end


function handleBuy(player, option, idx)
  if option == "Pistol" then
    TmpzWeapons.PistolTier(player:GetControlledCharacter():GetLocation(), Rotator(), idx)
  elseif option == "Shotgun" then
    TmpzWeapons.ShotgunTier(player:GetControlledCharacter():GetLocation(), Rotator(), idx)
  elseif option == "Rifle" then
    TmpzWeapons.RifleTier(player:GetControlledCharacter():GetLocation(), Rotator(), idx)
  elseif option == "SMG" then
    TmpzWeapons.SMGTier(player:GetControlledCharacter():GetLocation(), Rotator(), idx)
  elseif option == "Catz" then
    TmpzWeapons.CatzTier(player:GetControlledCharacter():GetLocation(), Rotator(), idx)
  elseif option == "Game" then
    Events:Call("StartGame", {})
  else
    Events:CallRemote("showMessage", player, {"Uuuh", "how can I say that", "something went"," wrong"})
    return 
  end
  Events:CallRemote("showMessage", player, {"Success", "", "", ""})
end


Events:on("Buy", function(player, option, idx)
  print(option .. " " .. idx)
  iPrice = prices[option][idx]
  pMoney = player:GetValue("bank")
  rMoney = pMoney - iPrice
  if rMoney >= 0 then
    player:SetValue("bank", rMoney)
    handleBuy(player, option, idx)
    Events:CallRemote("setMoney", player, {rMoney})
  else
    Events:CallRemote("showMessage", player, {"You","Don't","Have","Money"})
  end
end)

initializeShop()

