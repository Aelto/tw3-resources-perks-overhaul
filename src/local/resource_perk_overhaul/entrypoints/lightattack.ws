
function RPO_lightattackEntryPoint(player: CR4Player): bool {
  var stamina_cost: float;
  var fixative_level: int;

  if (!RPO_isEnabled()) {
    return true;
  }

  stamina_cost = (80 / RPO_getArmorWeight() + 3)
              * RPO_getLightAttackStaminaCostMultiplier()
              * RPO_getAdrenalineIncreaseStaminaCostModifier()
              * RPO_refreshmentIncreasesAllStaminaCostModifier()
              * RPO_getResourceConsumptionAggressiveActionsModifier()
              * RPO_getOverallResourceConsumptionWithToxicityModifier()
              * RPO_getOverallResourceConsumptionWithQuenModifier();

  fixative_level = RPO_getSkillLevel(S_Alchemy_s06);

  // when fixative is enabled, fast attacks use adrenaline as a resource and their
  // damage now scales on adrenaline.
  if (fixative_level > 0) {
    player.DrainFocus(stamina_cost * 0.3 / fixative_level);
  }
  else {
    player.DrainStamina(ESAT_FixedValue, stamina_cost, 1 * RPO_getStaminaRegenerationDelayMultiplier());
  }

  RPO_reduceShieldHealthIfActive();

  return true;
}