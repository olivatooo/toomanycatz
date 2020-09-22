Package:Require("GUI.lua")

isShopping = false
shoppingOption = 1



local play = Sound(
    Vector(-510, 145, 63), -- Location (if a 3D sound)
    "tmpz::S_Play", -- Asset Path
    true, -- Is 2D Sound
    true, -- Auto Destroy (if to destroy after finished playing)
    1, -- Sound Type (SFX)
    1, -- Volume
    1 -- Pitch
)



Events:on("UpdateHP", function(amount)
 tmczUI:CallEvent("setLife", {amount})
end)


Events:on("ShowScoreboard", function(characters)
  showScoreboard(characters)
end)

Events:on("showWeaponInfo", function(show)
  Package:Log("HERE")
  if (NanosWorld:GetLocalPlayer() ~= nil) then
   Package:Log("HERE too")
   character = NanosWorld:GetLocalPlayer():GetControlledCharacter()
   if (character == nil) then return end
   local currentItem = character:GetPicked()
    if (currentItem and currentItem:GetType() == "Weapon") then
         Package:Log("BaseDamage" .. currentItem.BaseDamage)
         Package:Log("Cadence" .. currentItem.Cadence)
         Package:Log("Spread" .. currentItem.Spread)
         Package:Log("show" .. tostring(show))
        tmczUI:CallEvent("showWeaponInfo", {show, currentItem.BaseDamage, currentItem.Cadence, currentItem.Spread})
    end
  end
end)

