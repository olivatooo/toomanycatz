option = 0

Client:on("KeyUp", function(KeyName, _, _)
    -- TODO: Create the cycle shop options based in the Prices.lua
    if (KeyName == "B") and isShopping == true and shoppingOption == "Game" then
      Events:CallRemote("StartGame", {})
    end
    if (KeyName == "B") and isShopping == true then
      Events:CallRemote("Buy", {shoppingOption, option})
    end
    if (KeyName == "K") and isShopping == true then
      option = option + 1
      Events:Call("showMessage", {shoppingOption .. " : " .. option})
    end
    if (KeyName == "L") and isShopping == true then
      option = option - 1
      Events:Call("showMessage", {shoppingOption .. " : " .. option})
    end
end)
