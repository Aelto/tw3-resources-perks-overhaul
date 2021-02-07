
function RPO_heavyattackEntryPoint(player: CR4Player): bool {
  var stamina_cost: float;
  var heavy_attack_consume_adrenaline_level: int;
  var adrenaline_cost: float;

  stamina_cost = 80 / RPO_getArmorWeight() + 3
               * RPO_getAdrenalineIncreaseStaminaCostModifier();
  heavy_attack_consume_adrenaline_level = RPO_getSkillLevel(S_Sword_s04);

  if (heavy_attack_consume_adrenaline_level > 0) {
    adrenaline_cost = heavy_attack_consume_adrenaline_level * 0.33;
    // we also remove the consumed adrenaline from the stamina cost
    stamina_cost *= 1 - adrenaline_cost;

    player.DrainFocus(adrenaline_cost);
  }

  // RPODEBUG("heavy attack consume adrenaline")

  player.DrainStamina(ESAT_FixedValue, stamina_cost, 2);


  return true;
}