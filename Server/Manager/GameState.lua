-- Package:Require("Enemy/WaveGenerator.lua")


-- Actual game state
gameState = 0

-- Possible game states
gameIdle_ = 0
gamePause_ = 1
gameRunning_ = 2


function gameHalt(state)
  gameState = state 
end


function gamePause(state)
  if state == gameRunning_ then
    gameState = state
    Events:on("PauseBetweenWaves", {})
  end
end


function gameCallNextWave(state)
  if state == gameIdle_ or state == gamePause_ then
    gameState = state 
    Events:Call("SpawnNextWave", {})
  end
end


function changeGameState(state)

  state = state and tonumber(state) or state

  local case = {
    [gameIdle_] = gameHalt(state),
    [gamePause_] = gamePause(state),
    [gameRunning_] = gameCallNextWave(state),
    default = gameHalt(state),
  }

  if case[choice] then
     case[choice]()
  else
     case["default"]()
  end
end


function playersLostTheGame()
  for k,v in pairs(Character) do
    v:SetHealth(-1)
  end
  Events:BroadcastRemote("ShowScoreboard", {})
  changeGameState(gameIdle_)
end


function restartGame()
  for k,v in pairs(Character) do
    initPlayer(v)
  end
  changeGameState(gameRunning_)
end


function startGame()
  changeGameState(gameRunning_)
end
