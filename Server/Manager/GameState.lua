Package:Require("Manager/Enemy/WaveGenerator.lua")


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
  gameState = state
  Events:Call("PauseBetweenWaves", {})
end


function gameCallNextWave(state)
  Events:Call("SpawnNextWave", {})
  gameState = state
end


function changeGameState(state)
  if state == gameIdle_ then
    gameHalt(state)
  elseif state == gamePause_ then
    gamePause(state)
  elseif state == gameRunning_ then
    gameCallNextWave(state)
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
  for k,v in pairs(Player) do
    initPlayer(v)
  end
  changeGameState(gameRunning_)
end


function startGame()
  changeGameState(gameRunning_)
end
