
function RPO_lightattackEntryPoint(player: CR4Player): bool {
  var stamina_cost: float;
  stamina_cost = 30 / RPO_getArmorWeight() + 2
               * RPO_getAdrenalineIncreaseStaminaCostModifier();

  player.DrainStamina(ESAT_FixedValue, stamina_cost, 1);

  return true;
}