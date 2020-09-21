Character:on("MoveCompleted", function(character, isMoveCompleted) 
  if isMoveCompleted then
    print("Move Completed")
    -- TODO:
    -- Events.Call("doDamage", {})
    character:SetValue("murder", "world")
    character:SetHealth(-1)
  else
    print("Move incompleted")
    -- Try again
    Timer:SetTimeout(math.random(600, 2000), function()
      return false
    end)
    character:MoveTo(character:GetValue("objective"), 1)
  end
end)

