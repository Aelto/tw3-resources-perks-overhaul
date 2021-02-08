
function RPO_rollEntryPoint(player: CR4Player): bool {
  var stamina_cost: float;
  var delay: float;

  stamina_cost = 4 * RPO_getArmorWeight()
               * RPO_refreshmentIncreasesAllStaminaCostModifier()
               * RPO_getResourceConsumptionDefensiveActionsModifier()
               * RPO_getOverallResourceConsumptionWithToxicityModifier()
               * RPO_getOverallResourceConsumptionWithQuenModifier();

  // Fleet footed:
  // Dodges and rolls now consume adrenaline when available. Geralt now loses a
  // small portion of current health when losing adrenaline.
  if (RPO_getSkillLevel(S_Sword_s09) > 0
  &&  thePlayer.GetStat(BCS_Focus) > stamina_cost / 25) {

    // the division by 25 means that a full heavy armor consumes about 1 adrenaline
    // point per dodge.
    thePlayer.DrainFocus(stamina_cost / 25);
  }

  // default case where dodges and rolls simply consume stamina
  else {
    if (player.GetStaminaPercents() > stamina_cost / 100) {
      delay = 1;
    }
    // no stamina available, the player can still dodge but its stamina regen
    // is paused for 3 seconds
    else {
      delay = 3;
    }

    player.DrainStamina(ESAT_FixedValue, stamina_cost, delay);
  }

  return true;
}