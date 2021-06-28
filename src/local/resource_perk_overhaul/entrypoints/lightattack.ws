
function RPO_lightattackEntryPoint(player: CR4Player): bool {
  var stamina_percent_before_action: float;
  var stamina_cost: float;
  var fixative_level: int;
  var delay: float;

  if (!RPO_isEnabled()) {
    return true;
  }

  stamina_percent_before_action = thePlayer.GetStaminaPercents();
  stamina_cost = RPO_getLightAttackStaminaCost();

  fixative_level = RPO_getSkillLevel(S_Alchemy_s06);

  // when fixative is enabled, fast attacks use adrenaline as a resource and their
  // damage now scales on adrenaline.
  if (fixative_level > 0) {
    if (thePlayer.GetStatPercents(BCS_Focus) < stamina_cost * 0.3 / fixative_level && !RPO_canPerformActionsWithoutStamina()) {
      return false;
    }

    player.DrainFocus(stamina_cost * 0.3 / fixative_level);
  }
  else {
    if (player.GetStaminaPercents() > stamina_cost / 100) {
      delay = 1;
    }
    // no stamina available, the player can still attack but its stamina regen
    // is paused for 2 seconds
    else {
      delay *= RPO_getStaminaRegenerationDelayPenaltyMultiplier();
    }

    if (delay > 1 && !RPO_canPerformActionsWithoutStamina()) {
      return false;
    }

    player.DrainStamina(ESAT_FixedValue, stamina_cost, 1 * RPO_getStaminaRegenerationDelayMultiplier());
  }

  RPO_reduceShieldHealthIfActive();

  RPO_resetSpeedModifier();
  RPO_resetSpeedModifier();
  thePlayer.RPO_animation_speed_modifier_ids.PushBack(
    thePlayer.SetAnimationSpeedMultiplier( RPO_getLightAttackSpeed(stamina_percent_before_action), -1 )
  );

  return true;
}

function RPO_getLightAttackStaminaCost(): float {
  return (80 / RPO_getArmorWeight() + 3)
       * RPO_getLightAttackStaminaCostMultiplier()
       * RPO_getAdrenalineIncreaseStaminaCostModifier()
       * RPO_refreshmentIncreasesAllStaminaCostModifier()
       * RPO_getResourceConsumptionAggressiveActionsModifier()
       * RPO_getOverallResourceConsumptionWithToxicityModifier()
       * RPO_getOverallResourceConsumptionWithQuenModifier();
}

function RPO_getLightAttackSpeed(stamina_percent_before_action: float): float {
  return 1
       * RPO_getSpeedModifierForStaminaPercent(stamina_percent_before_action)
       * RPO_getLightAttackSpeedMultiplier()
       * RPO_getSpeedModifierFromArmorWeight()
       * RPO_getAdrenalineSpeedMultiplier();
}