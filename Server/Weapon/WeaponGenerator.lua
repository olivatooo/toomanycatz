

function generate_smg(Location, Rotation, tier)
  local model = nil
  local trail = nil
  local barrel = nil
  local shell = nil
  local shot_sound = nil
  local magazine_mesh = nil
  local ammo_in_clip = 0
  local clip_capacity = 0
  local base_damage = 0
  local spread = 0
  local bullet_count = 0
  local ammo_to_reload = 0
  local bullet_color = nil
  local fov = 0.55
  local cadence = 0

  if tier == 1 then
    base_damage = 1
    cadence = randomFloat(0.12, 0.14)
    bullet_count = 1
    ammo_in_clip = math.random(26, 30)
    clip_capacity = ammo_in_clip
    spread = math.random (50, 60)
  end
  if tier == 2 then
    base_damage = math.random (2, 3)
    cadence = randomFloat(0.1, 0.12)
    bullet_count = 1
    ammo_in_clip = math.random(38, 50)
    clip_capacity = ammo_in_clip
    spread = math.random (40, 50)
  end
  if tier == 3 then
    base_damage = math.random (3, 4)
    cadence = randomFloat(0.1, 0.11)
    bullet_count = 1
    ammo_in_clip = math.random(50, 70)
    clip_capacity = ammo_in_clip
    spread = math.random (30, 40)
  end
  if tier == 4 then
    base_damage = math.random (4, 8)
    cadence = randomFloat(0.09, 0.1)
    bullet_count = 1
    ammo_in_clip = math.random(70, 120)
    clip_capacity = ammo_in_clip
    spread = math.random (20, 30)
  end
  if tier == 5 then
    base_damage = math.random (8, 12)
    cadence = randomFloat(0.06, 0.09)
    bullet_count = 1
    ammo_in_clip = math.random(120, 160)
    clip_capacity = ammo_in_clip
    spread = math.random (10, 20)
  end
  
  bullet_color = Color(1-cadence, ammo_in_clip/100 , bullet_count)
 
  return Weapon(
    Location,
    Rotation,
    "NanosWorld::SK_SMG11",	-- Model
    0,						-- Collision (Normal)
    true,					-- Gravity Enabled
    ammo_in_clip,						-- Ammo in the Clip
    10000000,					-- Ammo in the Bag
    clip_capacity,						-- Clip Capacity
    base_damage,						-- Base Damage
    spread,						-- Spread
    bullet_count,						-- Bullet Count (1 for common weapons, > 1 for shotguns)
    ammo_in_clip,						-- Ammo to Reload (Ammo Clip for common weapons, 1 for shotguns)
    20000,					-- Max Bullet Distance
    15000,					-- Bullet Speed (visual only)
    bullet_color,	-- Bullet Color
    fov,					-- Sight's FOV multiplier
	Vector(0, 0, -14.75),	-- Sight Location
	Rotator(-6.43, 0, 0),	-- Sight Rotation
	Vector(-3, 0, 0),		-- Left Hand Location
	Rotator(0, 25, 157.5),	-- Left Hand Rotation
	Vector(-35, 0, 0),		-- Right Hand Offset
    0,						-- Handling Mode (0. SingleHandedWeapon, 1. DoubleHandedWeapon, 2. SingleHandedMelee, 3. DoubleHandedMelee, 4. Throwable, 5. Torch)
    cadence,					-- Cadence (1 shot at each 0.15seconds)
    true,					-- Can Hold Use (keep pressing to keep firing, common to automatic weapons)
    false,					-- Need to release to Fire (common to Bows)
	"NanosWorld::P_Bullet_Trail",				-- Bullet Trail Particle
	"NanosWorld::P_Weapon_BarrelSmoke",			-- Barrel Particle
	"NanosWorld::P_Weapon_Shells_9x18",			-- Shells Particle
	"NanosWorld::A_SMG_Dry",					-- Weapon's Dry Sound
	"NanosWorld::A_SMG_Load",					-- Weapon's Load Sound
	"NanosWorld::A_SMG_Unload",					-- Weapon's Unload Sound
	"NanosWorld::A_AimZoom",					-- Weapon's Zooming Sound
	"NanosWorld::A_Rattle",						-- Weapon's Aiming Sound
	"NanosWorld::A_SMG_Shot",					-- Weapon's Shot Sound
	"NanosWorld::AM_Mannequin_Reload_Pistol",	-- Character's Reloading Animation
	"NanosWorld::AM_Mannequin_Sight_Fire",		-- Character's Aiming Animation
	"NanosWorld::SM_AP5_Mag_Empty"							-- Magazine Mesh
  )
end

function generate_pistol(Location, Rotation, tier)
  local model = nil
  local trail = nil
  local barrel = nil
  local shell = nil
  local shot_sound = nil
  local magazine_mesh = nil
  local ammo_in_clip = 0
  local clip_capacity = 0
  local base_damage = 0
  local spread = 0
  local bullet_count = 0
  local ammo_to_reload = 0
  local bullet_color = nil
  local fov = 0.55
  local cadence = 0
  spread = math.random (1, 20)

  if tier == 1 then
    base_damage = math.random (1, 20)
    cadence = randomFloat(0.8, 1)
    bullet_count = 1
    ammo_in_clip = math.random(7, 8)
    clip_capacity = ammo_in_clip
  end
  if tier == 2 then
    base_damage = math.random (20, 50)
    cadence = randomFloat(0.7, 0.8)
    bullet_count = 1
    ammo_in_clip = math.random(8, 9)
    clip_capacity = ammo_in_clip
  end
  if tier == 3 then
    base_damage = math.random (50, 100)
    cadence = randomFloat(0.6, 0.7)
    bullet_count = 1
    ammo_in_clip = math.random(9, 10)
    clip_capacity = ammo_in_clip
  end
  if tier == 4 then
    base_damage = math.random (100, 150)
    cadence = randomFloat(0.5, 0.6)
    bullet_count = 1
    ammo_in_clip = math.random(11, 12)
    clip_capacity = ammo_in_clip
  end
  if tier == 5 then
    base_damage = math.random (150, 200)
    cadence = randomFloat(0.4, 0.5)
    bullet_count = math.random(2, 4)
    spread = spread * bullet_count
    ammo_in_clip = math.random(10, 20)
    clip_capacity = ammo_in_clip
  end
 
  bullet_color = Color(1-cadence, ammo_in_clip/100 , bullet_count/4)
 
  return Weapon(
    Location,
    Rotation,
    "NanosWorld::SK_DesertEagle",-- Model
    0,						-- Collision (Normal)
    true,					-- Gravity Enabled
    ammo_in_clip,						-- Ammo in the Clip
    10000000,					-- Ammo in the Bag
    clip_capacity,						-- Clip Capacity
    base_damage,						-- Base Damage
    spread,						-- Spread
    bullet_count,						-- Bullet Count (1 for common weapons, > 1 for shotguns)
    ammo_in_clip,						-- Ammo to Reload (Ammo Clip for common weapons, 1 for shotguns)
    20000,					-- Max Bullet Distance
    15000,					-- Bullet Speed (visual only)
    bullet_color,	-- Bullet Color
    fov,					-- Sight's FOV multiplier
		Vector(0, 0, -11.5),	-- Sight Location
		Rotator(-0.6, 0, 0),	-- Sight Rotation
		Vector(2, -1.5, 0),		-- Left Hand Location
		Rotator(0, 50, 130),	-- Left Hand Rotation
		Vector(-30, 0, 5),
	  0,						-- Handling Mode (0. SingleHandedWeapon, 1. DoubleHandedWeapon, 2. SingleHandedMelee, 3. DoubleHandedMelee, 4. Throwable, 5. Torch)
	  cadence,					-- Cadence (1 shot at each 0.15seconds)
	  false,					-- Can Hold Use (keep pressing to keep firing, common to automatic weapons)
	  false,					-- Need to release to Fire (common to Bows)
		"NanosWorld::P_Bullet_Trail",					-- Bullet Trail Particle
		"NanosWorld::P_Weapon_BarrelSmoke",				-- Barrel Particle
		"NanosWorld::P_Weapon_Shells_45ap",				-- Shells Particle
		"NanosWorld::A_Pistol_Dry",						-- Weapon's Dry Sound
		"NanosWorld::A_Pistol_Load",					-- Weapon's Load Sound
		"NanosWorld::A_Pistol_Unload",					-- Weapon's Unload Sound
		"NanosWorld::A_AimZoom",						-- Weapon's Zooming Sound
		"NanosWorld::A_Rattle",							-- Weapon's A         iming Sound
		"NanosWorld::A_DesertEagle_Shot",				-- Weapon's Shot Sound
		"NanosWorld::AM_Mannequin_Reload_Pistol",		-- Character's Reloading Animation
		"NanosWorld::AM_Mannequin_Sight_Fire_Heavy",	-- Character's Aiming Animation
		"NanosWorld::SM_DesertEagle_Mag_Empty"							-- Magazine Mesh
  )
end

function generate_shotgun(Location, Rotation, tier)
	local model = nil
 local trail = nil
 local barrel = nil
 local shell = nil
 local shot_sound = nil
 local magazine_mesh = nil
	local ammo_in_clip = 0
	local clip_capacity = 0
	local base_damage = 0
	local spread = 0
	local bullet_count = 0
	local ammo_to_reload = 0
	local bullet_color = nil
	local fov = 0.5
	local cadence = 0

  if tier == 1 then
    base_damage = math.random (2, 4)
    cadence = randomFloat(1, 1.5)
    bullet_count = math.random(6, 12)
    ammo_in_clip = bullet_count
    clip_capacity = ammo_in_clip
    spread = math.random (70, 80)
  end
  if tier == 2 then
    base_damage = math.random (4, 8)
    cadence = randomFloat(0.9, 1.2)
    bullet_count = math.random(12, 24)
    ammo_in_clip = bullet_count
    clip_capacity = ammo_in_clip
    spread = math.random (80, 100)
  end
  if tier == 3 then
    base_damage = math.random (8, 12)
    cadence = randomFloat(0.8, 1.1)
    bullet_count = math.random(24, 48)
    ammo_in_clip = bullet_count
    clip_capacity = ammo_in_clip
    spread = math.random (100, 140)
  end
  if tier == 4 then
    base_damage = math.random (12, 16)
    cadence = randomFloat(0.8, 1)
    bullet_count = math.random(48, 64)
    ammo_in_clip = bullet_count
    clip_capacity = ammo_in_clip
    spread = math.random (140, 200)
  end
  if tier == 5 then
    base_damage = math.random (16, 24)
    cadence = randomFloat(0.5, 1.5)
    bullet_count = math.random(64, 80)
    ammo_in_clip = bullet_count
    clip_capacity = ammo_in_clip
    spread = math.random (200, 300)
  end
  
  bullet_color = Color(1.5-cadence, ammo_in_clip/100 , bullet_count/80)
 
  return Weapon(
    Location,
    Rotation,
    "NanosWorld::SK_Moss500",	-- Model
    0,						-- Collision (Normal)
    true,					-- Gravity Enabled
    ammo_in_clip,						-- Ammo in the Clip
    10000000,					-- Ammo in the Bag
    clip_capacity,						-- Clip Capacity
    base_damage,						-- Base Damage
    spread,						-- Spread
    bullet_count,						-- Bullet Count (1 for common weapons, > 1 for shotguns)
    ammo_in_clip,						-- Ammo to Reload (Ammo Clip for common weapons, 1 for shotguns)
    20000,					-- Max Bullet Distance
    15000,					-- Bullet Speed (visual only)
    bullet_color,	-- Bullet Color
    fov,					-- Sight's FOV multiplier
    Vector(0, 0, -14.85),	-- Sight Location
    Rotator(-1, 0, 0),		-- Sight Rotation
    Vector(26, 0, 8.5),		-- Left Hand Location
    Rotator(0, 60, 90),		-- Left Hand Rotation
    Vector(-10, 0, 0),		-- Right Hand Offset
    1,						-- Handling Mode (0. SingleHandedWeapon, 1. DoubleHandedWeapon, 2. SingleHandedMelee, 3. DoubleHandedMelee, 4. Throwable, 5. Torch)
    cadence,					-- Cadence (1 shot at each 0.15seconds)
    true,					-- Can Hold Use (keep pressing to keep firing, common to automatic weapons)
    false,					-- Need to release to Fire (common to Bows)
		"NanosWorld::P_Weapon_BarrelSmoke",												-- Bullet Trail Particle
		"NanosWorld::P_Weapon_BarrelSmoke",				-- Barrel Particle
		"NanosWorld::P_Weapon_Shells_12Gauge",			-- Shells Particle
		"NanosWorld::A_Shotgun_Dry",					-- Weapon's Dry Sound
		"NanosWorld::A_Shotgun_Load_Bullet",			-- Weapon's Load Sound
		"",												-- Weapon's Unload Sound
		"NanosWorld::A_AimZoom",						-- Weapon's Zooming Sound
		"NanosWorld::A_Rattle",							-- Weapon's Aiming Sound
		"NanosWorld::A_Shotgun_Shot",					-- Weapon's Shot Sound
		"NanosWorld::AM_Mannequin_Reload_Shotgun",		-- Character's Reloading Animation
		"NanosWorld::AM_Mannequin_Sight_Fire_Heavy",	-- Character's Aiming Animation
		""	
  )
end

function generate_rifle(Location, Rotation, tier)
	local model = nil
 local trail = nil
 local barrel = nil
 local shell = nil
 local shot_sound = nil
 local magazine_mesh = nil
	local ammo_in_clip = 0
	local clip_capacity = 0
	local base_damage = 0
	local spread = 0
	local bullet_count = 0
	local ammo_to_reload = 0
	local bullet_color = nil
	local fov = 0.5
	local cadence = 0

  if tier == 1 then
    base_damage = math.random (1, 2)
    cadence = randomFloat(0.18, 0.2)
    bullet_count = 1
    ammo_in_clip = math.random(12, 23)
    clip_capacity = ammo_in_clip
    spread = math.random (40, 50)
  end
  if tier == 2 then
    base_damage = math.random (2, 4)
    cadence = randomFloat(0.16, 0.18)
    bullet_count = 1
    ammo_in_clip = math.random(18, 32)
    clip_capacity = ammo_in_clip
    spread = math.random (35, 45)
  end
  if tier == 3 then
    base_damage = math.random (4, 8)
    cadence = randomFloat(0.14, 0.16)
    bullet_count = 1
    ammo_in_clip = math.random(28, 40)
    clip_capacity = ammo_in_clip
    spread = math.random (30, 36)
  end
  if tier == 4 then
    base_damage = math.random (8, 16)
    cadence = randomFloat(0.18, 0.2)
    bullet_count = 1
    ammo_in_clip = math.random(12, 23)
    clip_capacity = ammo_in_clip
    spread = math.random (20, 30)
  end
  if tier == 5 then
    base_damage = math.random (16, 32)
    cadence = randomFloat(0.1, 0.12)
    bullet_count = 1
    ammo_in_clip = math.random(40, 64)
    clip_capacity = ammo_in_clip
    spread = math.random (1, 20)
  end
 
  bullet_color = Color(1-cadence, ammo_in_clip/100 , bullet_count)
 
  return Weapon(
    Location,
    Rotation,
    "NanosWorld::SK_AK47",	-- Model
    0,						-- Collision (Normal)
    true,					-- Gravity Enabled
    ammo_in_clip,						-- Ammo in the Clip
    10000000,					-- Ammo in the Bag
    clip_capacity,						-- Clip Capacity
    base_damage,						-- Base Damage
    spread,						-- Spread
    bullet_count,						-- Bullet Count (1 for common weapons, > 1 for shotguns)
    ammo_in_clip,						-- Ammo to Reload (Ammo Clip for common weapons, 1 for shotguns)
    20000,					-- Max Bullet Distance
    15000,					-- Bullet Speed (visual only)
    bullet_color,	-- Bullet Color
    fov,					-- Sight's FOV multiplier
    Vector(0, 0, -14.85),	-- Sight Location
    Rotator(-1, 0, 0),		-- Sight Rotation
    Vector(26, 0, 8.5),		-- Left Hand Location
    Rotator(0, 60, 90),		-- Left Hand Rotation
    Vector(-10, 0, 0),		-- Right Hand Offset
    1,						-- Handling Mode (0. SingleHandedWeapon, 1. DoubleHandedWeapon, 2. SingleHandedMelee, 3. DoubleHandedMelee, 4. Throwable, 5. Torch)
    cadence,					-- Cadence (1 shot at each 0.15seconds)
    true,					-- Can Hold Use (keep pressing to keep firing, common to automatic weapons)
    false,					-- Need to release to Fire (common to Bows)
    "NanosWorld::P_Bullet_Trail",							-- Bullet Trail Particle
    "NanosWorld::P_Weapon_BarrelSmoke",						-- Barrel Particle
    "NanosWorld::P_Weapon_Shells_762x39",					-- Shells Particle
    "NanosWorld::A_Rifle_Dry",								-- Weapon's Dry Sound
    "NanosWorld::A_Rifle_Load",								-- Weapon's Load Sound
    "NanosWorld::A_Rifle_Unload",							-- Weapon's Unload Sound
    "NanosWorld::A_AimZoom",								-- Weapon's Zooming Sound
    "NanosWorld::A_Rattle",									-- Weapon's Aiming Sound
    "NanosWorld::A_AK47_Shot",								-- Weapon's Shot Sound
    "NanosWorld::AM_Mannequin_Reload_Rifle",				-- Character's Reloading Animation
    "NanosWorld::AM_Mannequin_Sight_Fire",					-- Character's Aiming Animation
    "NanosWorld::SM_AK47_Mag_Empty"							-- Magazine Mesh
  )
end

function Catz(Location, Rotation, tier)
	local model = nil
 local trail = nil
 local barrel = nil
 local shell = nil
 local shot_sound = nil
 local magazine_mesh = nil
	local ammo_in_clip = 0
	local clip_capacity = 0
	local base_damage = 0
	local spread = 0
	local bullet_count = 0
	local ammo_to_reload = 0
	local bullet_color = nil
	local fov = 0.5
	local cadence = 0

  if tier == 1 then
    base_damage = math.random (1, 2)
    cadence = randomFloat(0.18, 0.2)
    bullet_count = 1
    ammo_in_clip = math.random(12, 23)
    clip_capacity = ammo_in_clip
    spread = math.random (40, 50)
  end
  if tier == 2 then
    base_damage = math.random (2, 4)
    cadence = randomFloat(0.16, 0.18)
    bullet_count = 1
    ammo_in_clip = math.random(18, 32)
    clip_capacity = ammo_in_clip
    spread = math.random (35, 45)
  end
  if tier == 3 then
    base_damage = math.random (4, 8)
    cadence = randomFloat(0.14, 0.16)
    bullet_count = 1
    ammo_in_clip = math.random(28, 40)
    clip_capacity = ammo_in_clip
    spread = math.random (30, 36)
  end
  if tier == 4 then
    base_damage = math.random (8, 16)
    cadence = randomFloat(0.18, 0.2)
    bullet_count = 1
    ammo_in_clip = math.random(12, 23)
    clip_capacity = ammo_in_clip
    spread = math.random (20, 30)
  end
  if tier == 5 then
    base_damage = math.random (16, 32)
    cadence = randomFloat(0.1, 0.12)
    bullet_count = 1
    ammo_in_clip = math.random(40, 64)
    clip_capacity = ammo_in_clip
    spread = math.random (1, 20)
  end
 
  bullet_color = Color(1-cadence, ammo_in_clip/100 , bullet_count)
 
  return Weapon(
    Location,
    Rotation,
    "NanosWorld::SM_Bunny",	-- Model
    0,						-- Collision (Normal)
    true,					-- Gravity Enabled
    ammo_in_clip,						-- Ammo in the Clip
    10000000,					-- Ammo in the Bag
    clip_capacity,						-- Clip Capacity
    base_damage,						-- Base Damage
    spread,						-- Spread
    bullet_count,						-- Bullet Count (1 for common weapons, > 1 for shotguns)
    ammo_in_clip,						-- Ammo to Reload (Ammo Clip for common weapons, 1 for shotguns)
    20000,					-- Max Bullet Distance
    15000,					-- Bullet Speed (visual only)
    bullet_color,	-- Bullet Color
    fov,					-- Sight's FOV multiplier
    Vector(0, 0, -14.85),	-- Sight Location
    Rotator(-1, 0, 0),		-- Sight Rotation
    Vector(26, 0, 8.5),		-- Left Hand Location
    Rotator(0, 60, 90),		-- Left Hand Rotation
    Vector(-10, 0, 0),		-- Right Hand Offset
    1,						-- Handling Mode (0. SingleHandedWeapon, 1. DoubleHandedWeapon, 2. SingleHandedMelee, 3. DoubleHandedMelee, 4. Throwable, 5. Torch)
    cadence,					-- Cadence (1 shot at each 0.15seconds)
    true,					-- Can Hold Use (keep pressing to keep firing, common to automatic weapons)
    false,					-- Need to release to Fire (common to Bows)
    "NanosWorld::SM_Bunny",							-- Bullet Trail Particle
    "NanosWorld::SM_Bunny",						-- Barrel Particle
    "NanosWorld::SM_Bunny",					-- Shells Particle
    "NanosWorld::A_Rifle_Dry",								-- Weapon's Dry Sound
    "NanosWorld::A_Rifle_Load",								-- Weapon's Load Sound
    "NanosWorld::A_Rifle_Unload",							-- Weapon's Unload Sound
    "NanosWorld::A_AimZoom",								-- Weapon's Zooming Sound
    "NanosWorld::A_Rattle",									-- Weapon's Aiming Sound
    "NanosWorld::A_AK47_Shot",								-- Weapon's Shot Sound
    "NanosWorld::AM_Mannequin_Reload_Rifle",				-- Character's Reloading Animation
    "NanosWorld::AM_Mannequin_Sight_Fire",					-- Character's Aiming Animation
    "NanosWorld::SM_Bunny"							-- Magazine Mesh
  )
end

TmpzWeapons = {
  RifleTier = function(Location, Rotation, Tier)
    return generate_rifle(Location, Rotation, Tier)
  end,
  ShotgunTier = function(Location, Rotation, Tier)
    return generate_shotgun(Location, Rotation, Tier)
  end,
  PistolTier = function(Location, Rotation, Tier)
    return generate_pistol(Location, Rotation, Tier)
  end,
  SMGTier = function(Location, Rotation, Tier)
    return generate_smg(Location, Rotation, Tier)
  end,
  CatzTier = function(Location, Rotation, Tier)
    return Catz(Location, Rotation, Tier)
  end,
}
