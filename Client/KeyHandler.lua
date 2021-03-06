option = 1

function cyclePrices(forward)
  if forward then
    if option+1 > #prices[shoppingOption] then
      option = 1 
    else
      option = option + 1
    end
  else
    if option-1 < 1 then
      option = #prices[shoppingOption]
    else
      option = option - 1
    end
  end
end

Client:on("KeyUp", function(KeyName, _, _)
    -- TODO: Create the cycle shop options based in the Prices.lua
    if (KeyName == "B") and isShopping == true then
      Events:CallRemote("Buy", {shoppingOption, option})
    end
    if (KeyName == "E") and isShopping == true then
      cyclePrices(true)
      Events:Call("showMessage", {"Store", tostring(shoppingOption), tostring(prices[shoppingOption][0]), "Price: $" .. tostring(prices[shoppingOption][option])})
    end
    if (KeyName == "Q") and isShopping == true then
      cyclePrices(false)
      Events:Call("showMessage", {"Store", tostring(shoppingOption), tostring(prices[shoppingOption][0]), "Price: $" .. tostring(prices[shoppingOption][option])})
    end
    if KeyName == "H" then
      Events:Call("showWeaponInfo", {false})
    end
    if KeyName == "Z" then
      Events:CallRemote("rockTheVote", {})
    end
end)

Client:on("KeyDown", function(KeyName,_,_)
   if KeyName == "H" then
    Events:Call("showWeaponInfo", {true})
   end
end)
