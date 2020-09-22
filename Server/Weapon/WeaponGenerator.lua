

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
    base_damage = math.random (1, 2)
    cadence = randomFloat(0.5, 0.6)
    bullet_count = 1
    ammo_in_clip = math.random(22, 32)
    clip_capacity = ammo_in_clip
    spread = math.random (50, 60)
  end
  if tier == 2 then
    base_damage = math.random (1, 2)
    cadence = randomFloat(0.4, 0.5)
    bullet_count = 1
    ammo_in_clip = math.random(32, 64)
    clip_capacity = ammo_in_clip
    spread = math.random (40, 50)
  end
  if tier == 3 then
    base_damage = math.random (1, 2)
    cadence = randomFloat(0.3, 0.4)
    bullet_count = 1
    ammo_in_clip = math.random(64, 128)
    clip_capacity = ammo_in_clip
    spread = math.random (30, 40)
  end
  if tier == 4 then
    base_damage = math.random (1, 2)
    cadence = randomFloat(0.2, 0.3)
    bullet_count = 1
    ammo_in_clip = math.random(128, 256)
    clip_capacity = ammo_in_clip
    spread = math.random (20, 30)
  end
  if tier == 5 then
    base_damage = math.random (2, 4)
    cadence = randomFloat(0.1, 0.2)
    bullet_count = 1
    ammo_in_clip = math.random(256, 512)
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
  local spread = 1
  local bullet_count = 0
  local ammo_to_reload = 0
  local bullet_color = nil
  local fov = 0.55
  local cadence = 0
  spread = math.random (1, 20)

  if tier == 1 then
    base_damage = math.random (1, 3)
    cadence = randomFloat(1, 1)
    bullet_count = 1
    ammo_in_clip = math.random(7, 20)
    clip_capacity = ammo_in_clip
  end
  if tier == 2 then
    base_damage = math.random(4, 8)
    cadence = randomFloat(0.9, 1)
    bullet_count = 1
    ammo_in_clip = math.random(7, 22)
    clip_capacity = ammo_in_clip
  end
  if tier == 3 then
    base_damage = math.random (10, 28)
    cadence = randomFloat(0.8, 0.9)
    bullet_count = 1
    ammo_in_clip = math.random(7, 24)
    clip_capacity = ammo_in_clip
  end
  if tier == 4 then
    base_damage = math.random (32, 64)
    cadence = randomFloat(0.7, 0.8)
    bullet_count = 1
    ammo_in_clip = math.random(7, 32)
    clip_capacity = ammo_in_clip
  end
  if tier == 5 then
    base_damage = math.random (70, 100)
    cadence = randomFloat(0.6, 0.7)
    bullet_count = math.random(2, 4)
    spread = spread * bullet_count
    ammo_in_clip = math.random(7, 100)
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
    base_damage = math.random (3, 5)
    cadence = randomFloat(1, 1)
    bullet_count = math.random(6, 9)
    ammo_in_clip = bullet_count
    clip_capacity = ammo_in_clip
    spread = math.random (70, 80)
  end
  if tier == 2 then
    base_damage = math.random (5, 12)
    cadence = randomFloat(0.8, 0.9)
    bullet_count = math.random(8, 12)
    ammo_in_clip = bullet_count
    clip_capacity = ammo_in_clip
    spread = math.random (80, 100)
  end
  if tier == 3 then
    base_damage = math.random (12, 15)
    cadence = randomFloat(0.7, 0.8)
    bullet_count = math.random(10, 18)
    ammo_in_clip = bullet_count
    clip_capacity = ammo_in_clip
    spread = math.random (100, 140)
  end
  if tier == 4 then
    base_damage = math.random (15, 18)
    cadence = randomFloat(0.5 , 0.6)
    bullet_count = math.random(20, 22)
    ammo_in_clip = bullet_count
    clip_capacity = ammo_in_clip
    spread = math.random (140, 200)
  end
  if tier == 5 then
    base_damage = math.random (18, 20)
    cadence = randomFloat(0.5 , 0.6)
    bullet_count = math.random(32, 44)
    ammo_in_clip = bullet_count
    clip_capacity = ammo_in_clip
    spread = math.random (200, 300)
  end
  
  bullet_color = Color(1.5-cadence, ammo_in_clip/100 , bullet_count/44)
 
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
    base_damage = math.random (5, 8)
    cadence = randomFloat(0.3, 0.4)
    bullet_count = 1
    ammo_in_clip = math.random(30, 42)
    clip_capacity = ammo_in_clip
    spread = math.random (40, 50)
  end
  if tier == 2 then
    base_damage = math.random (8, 20)
    cadence = randomFloat(0.3, 0.4)
    bullet_count = 1
    ammo_in_clip = math.random(42, 52)
    clip_capacity = ammo_in_clip
    spread = math.random (35, 45)
  end
  if tier == 3 then
    base_damage = math.random (24, 32)
    cadence = randomFloat(0.2, 0.3)
    bullet_count = 1
    ammo_in_clip = math.random(52, 64)
    clip_capacity = ammo_in_clip
    spread = math.random (30, 36)
  end
  if tier == 4 then
    base_damage = math.random (50, 80)
    cadence = randomFloat(0.18, 0.2)
    bullet_count = 1
    ammo_in_clip = math.random(64, 70)
    clip_capacity = ammo_in_clip
    spread = math.random (20, 30)
  end
  if tier == 5 then
    base_damage = math.random (100, 200)
    cadence = randomFloat(0.1, 0.12)
    bullet_count = 1
    ammo_in_clip = math.random(70, 100)
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
    base_damage = math.random (2, 10)
    cadence = randomFloat(0.1, 0.1)
    bullet_count = math.random (6, 10)
    ammo_in_clip = math.random(100, 1000)
    clip_capacity = ammo_in_clip
    spread = math.random (120, 160)
  end
  if tier == 2 then
    base_damage = math.random (1000, 2000)
    cadence = randomFloat(1, 1)
    bullet_count = 1
    ammo_in_clip = math.random(7, 14)
    clip_capacity = ammo_in_clip
    spread = 1
  end
  if tier == 3 then
    base_damage = math.random (1000, 2000)
    cadence = randomFloat(0.2, 0.4)
    bullet_count = 1
    ammo_in_clip = math.random(22, 32)
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
    base_damage = math.random (50000,100000)
    cadence = randomFloat(1, 1)
    bullet_count = 1
    ammo_in_clip = math.random(1, 1)
    clip_capacity = ammo_in_clip
    spread = math.random (1, 1)
  end
 
  bullet_color = Color(1-cadence, ammo_in_clip/100 , bullet_count)
 
  return Weapon(
    Location,
    Rotation,
    "tmpz::SK_Wolf",	-- Model
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
    "tmpz::S_Meow",								-- Weapon's Shot Sound
    "NanosWorld::AM_Mannequin_Reload_Rifle",				-- Character's Reloading Animation
    "NanosWorld::AM_Mannequin_Sight_Fire",					-- Character's Aiming Animation
    "tmpz::SM_Cat"							-- Magazine Mesh
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
    my_weap = Catz(Location, Rotation, Tier)
    my_weap:on("Fire", function(shooter)
        local control_rotation = shooter:GetControlRotation()
        local forward_vector = control_rotation:GetForwardVector()
        local spawn_location = shooter:GetLocation() + Vector(0, 0, 40) + forward_vector * Vector(200)

        local prop = Grenade(
          spawn_location,
          control_rotation,
          "tmpz::SM_Cat"
        )
        prop:SetScale(Vector(randomFloat(1,3),randomFloat(1,3),randomFloat(1,3)))
        prop:AddImpulse(forward_vector * Vector(20000))

        Timer:SetTimeout(1500, function (c)
          if math.random (10, 100) < 10 then
            c:PullUse()
          else
            c:Destroy()
          end
          return false
        end, {prop})

    end)
    return my_weap
  end,
}
