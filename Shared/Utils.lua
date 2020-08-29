
function randomFloat(lower, greater)
  return lower + math.random()  * (greater - lower)
end

function getRandomFromList(l)
	return l[math.random(#l)]
end

