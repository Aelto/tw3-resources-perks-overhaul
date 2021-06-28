
function RPO_rollEntryPoint(player: CR4Player): bool {
  var stamina_percent_before_action: float;
  var stamina_cost: float;
  var delay: float;

  if (!RPO_isEnabled()) {
    return true;
  }

  stamina_percent_before_action = thePlayer.GetStaminaPercents();
  stamina_cost = RPO_getRollStaminaCost();

  // Fleet footed:
  // Dodges and rolls now consume adrenaline when available.
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
      delay = RPO_getStaminaRegenerationDelayPenaltyMultiplier();
    }

    if (delay > 1 && !RPO_canPerformActionsWithoutStamina()) {
      return false;
    }

    player.DrainStamina(ESAT_FixedValue, stamina_cost, delay * RPO_getStaminaRegenerationDelayMultiplier());
  }

  RPO_resetSpeedModifier();
  thePlayer.RPO_animation_speed_modifier_ids.PushBack(
    thePlayer.SetAnimationSpeedMultiplier( RPO_getRollSpeed(stamina_percent_before_action), -1 )
  );

  return true;
}

function RPO_getRollStaminaCost(): float {
  return 4 * RPO_getArmorWeight()
       * RPO_getRollStaminaCostMultiplier()
       * RPO_refreshmentIncreasesAllStaminaCostModifier()
       * RPO_getResourceConsumptionDefensiveActionsModifier()
       * RPO_getOverallResourceConsumptionWithToxicityModifier()
       * RPO_getOverallResourceConsumptionWithQuenModifier();
}

function RPO_getRollSpeed(stamina_percent_before_action: float): float {
  return 1
       * RPO_getSpeedModifierForStaminaPercent(stamina_percent_before_action)
       * RPO_getRollSpeedMultiplier()
       * RPO_getSpeedModifierFromArmorWeight()
       * RPO_getAdrenalineSpeedMultiplier();
}