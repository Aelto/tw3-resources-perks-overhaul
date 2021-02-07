
function RPO_lightattackEntryPoint(player: CR4Player): bool {
  var stamina_cost: float;
  var fixative_level: int;

  stamina_cost = (30 / RPO_getArmorWeight() + 2)
              * RPO_getAdrenalineIncreaseStaminaCostModifier()
              * RPO_refreshmentIncreasesAllStaminaCostModifier()
              * RPO_getResourceConsumptionAggressiveActionsModifier
              * RPO_getOverallResourceConsumptionWithToxicityModifier();

  fixative_level = RPO_getSkillLevel(S_Alchemy_s06);

  // when fixative is enabled, fast attacks use adrenaline as a resource and their
  // damage now scales on adrenaline.
  if (fixative_level > 0) {
    player.DrainFocus(stamina_cost * 3 / fixative_level);
  }
  else {
    player.DrainStamina(ESAT_FixedValue, stamina_cost, 1);
  }

  return true;
}