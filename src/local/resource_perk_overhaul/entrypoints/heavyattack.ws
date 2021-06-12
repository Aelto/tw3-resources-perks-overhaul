
function RPO_heavyattackEntryPoint(player: CR4Player): bool {
  var stamina_percent_before_action: float;
  var stamina_cost: float;
  var heavy_attack_consume_adrenaline_level: int;
  var adrenaline_cost: float;
  var delay: float;

  if (!RPO_isEnabled()) {
    return true;
  }

  stamina_percent_before_action = thePlayer.GetStaminaPercents();
  stamina_cost = RPO_getHeavyAttackStaminaCost();

  heavy_attack_consume_adrenaline_level = RPO_getSkillLevel(S_Sword_s04);

  if (heavy_attack_consume_adrenaline_level > 0) {
    adrenaline_cost = heavy_attack_consume_adrenaline_level * 0.33;

    // we also remove the consumed adrenaline from the stamina cost
    stamina_cost *= 1 - adrenaline_cost;

    // we still check of stamina, because if there is not enough adrenaline it
    // goes back to the stamina anyway. Adrenaline is not a restricted resource.
    if (thePlayer.GetStaminaPercents() < stamina_cost && !RPO_canPerformActionsWithoutStamina()) {
      return false;
    }

    player.DrainFocus(adrenaline_cost);
  }

  // RPODEBUG("heavy attack consume adrenaline")

  if (player.GetStaminaPercents() > stamina_cost / 100) {
    delay = 1;
  }
  // no stamina available, the player can still attack but its stamina regen
  // is paused for 3 seconds
  else {
    delay = 3;
  }

  if (delay > 1 && !RPO_canPerformActionsWithoutStamina()) {
    return false;
  }

  player.DrainStamina(ESAT_FixedValue, stamina_cost, 2 * RPO_getStaminaRegenerationDelayMultiplier());

  RPO_reduceShieldHealthIfActive();
  RPO_resetSpeedModifier();
  thePlayer.RPO_animation_speed_modifier_ids.PushBack(
    thePlayer.SetAnimationSpeedMultiplier( RPO_getHeavyAttackSpeed(stamina_percent_before_action), -1 )
  );


  return true;
}

function RPO_getHeavyAttackStaminaCost(): float {
  return (80 / RPO_getArmorWeight() + 3)
       * RPO_getHeavyAttackStaminaCostMultiplier()
       * RPO_getAdrenalineIncreaseStaminaCostModifier()
       * RPO_refreshmentIncreasesAllStaminaCostModifier()
       * RPO_getResourceConsumptionAggressiveActionsModifier()
       * RPO_getOverallResourceConsumptionWithToxicityModifier()
       * RPO_getOverallResourceConsumptionWithQuenModifier();
}

function RPO_getHeavyAttackSpeed(stamina_percent_before_action: float): float {
  return 1
       * RPO_getSpeedModifierForStaminaPercent(stamina_percent_before_action)
       * RPO_getHeavyAttackSpeedMultiplier()
       * RPO_getSpeedModifierFromArmorWeight();
}