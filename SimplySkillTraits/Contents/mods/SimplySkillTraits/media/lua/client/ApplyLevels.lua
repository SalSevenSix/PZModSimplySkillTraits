
local traitmap = {
  ["sprinting"] = Perks.Sprinting,
  ["lightfooted"] = Perks.Lightfoot,
  ["nimble"] = Perks.Nimble,
  ["sneaking"] = Perks.Sneak,
  ["axe"] = Perks.Axe,
  ["longblunt"] = Perks.Blunt,
  ["shortblunt"] = Perks.SmallBlunt,
  ["longblade"] = Perks.LongBlade,
  ["shortblade"] = Perks.SmallBlade,
  ["spear"] = Perks.Spear,
  ["maintenance"] = Perks.Maintenance,
  ["aiming"] = Perks.Aiming,
  ["reloading"] = Perks.Reloading,
  ["carpentry"] = Perks.Woodwork,
  ["cooking"] = Perks.Cooking,
  ["farming"] = Perks.Farming,
  ["firstaid"] = Perks.Doctor,
  ["electrical"] = Perks.Electricity,
  ["metalworking"] = Perks.MetalWelding,
  ["mechanics"] = Perks.Mechanics,
  ["tailoring"] = Perks.Tailoring,
  ["fishing"] = Perks.Fishing,
  ["trapping"] = Perks.Trapping,
  ["foraging"] = Perks.PlantScavenging,
};

local function applyLevels(_player)
  local player = _player;
  for trait, perk in pairs(traitmap) do
    for level = 1, 3, 1 do
      if player:HasTrait("sst_" .. trait .. level) then
        for i = 1, level, 1 do
          player:LevelPerk(perk, false);
        end
      end
    end
    player:getXp():setXPToLevel(perk, player:getPerkLevel(perk));
  end
  SyncXp(player);
end

Events.OnNewGame.Add(applyLevels);
