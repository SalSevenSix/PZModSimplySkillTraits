
local traitmap = {
  ["sprinting"] = { 1, 2, 3 },
  ["lightfooted"] = { 1, 2, 3 },
  ["nimble"] = { 1, 2, 3 },
  ["sneaking"] = { 1, 2, 3 },
  ["axe"] = { 1, 2, 3 },
  ["longblunt"] = { 1, 2, 3 },
  ["shortblunt"] = { 1, 2, 3 },
  ["longblade"] = { 1, 2, 3 },
  ["shortblade"] = { 1, 2, 3 },
  ["spear"] = { 1, 2, 3 },
  ["maintenance"] = { 1, 2, 3 },
  ["aiming"] = { 2, 3, 5 },
  ["reloading"] = { 1, 2, 3 },
  ["carpentry"] = { 1, 2, 3 },
  ["cooking"] = { 1, 2, 3 },
  ["farming"] = { 1, 2, 3 },
  ["firstaid"] = { 1, 2, 3 },
  ["electrical"] = { 1, 2, 3 },
  ["metalworking"] = { 1, 2, 3 },
  ["mechanics"] = { 1, 2, 3 },
  ["tailoring"] = { 1, 2, 3 },
  ["fishing"] = { 1, 2, 3 },
  ["trapping"] = { 1, 2, 3 },
  ["foraging"] = { 1, 2, 3 },
};

local function createTraits()
  for trait, points in pairs(traitmap) do
    for level = 1, #points, 1 do
      local name = "sst_" .. trait .. level;
      TraitFactory.addTrait(name, getText("UI_trait_" .. name), points[level], getText("UI_trait_" .. name .. "_desc"), false, false);
    end
  end
end

--local oldDoTraits = BaseGameCharacterDetails.DoTraits;
--local function newDoTraits()
--  oldDoTraits();
--  createTraits();
--end
--BaseGameCharacterDetails.DoTraits = newDoTraits;

Events.OnGameBoot.Add(createTraits);
