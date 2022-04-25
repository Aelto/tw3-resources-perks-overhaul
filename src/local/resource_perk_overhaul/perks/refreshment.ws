// the function restores some health to the player
function RPO_consumingStaminaRestoresHealth(manager: W3AbilityManager, stamina_cost: float) {
  if (!((W3PlayerAbilityManager)manager) && manager.owner != GetWitcherPlayer()) {
    return;
  }

  // restores health only if adrenaline is full
  if (thePlayer.GetStatPercents(BCS_Focus) >= 1) {
    thePlayer.GainStat(
      BCS_Vitality,
      stamina_cost
      * thePlayer.GetHealth()
      * 0.0001
      * RPO_getSkillLevel(S_Alchemy_s02)
    );
  }
}

function RPO_refreshmentIncreasesAllStaminaCostModifier(): float {
  if (RPO_arePerksEnabled() && RPO_getSkillLevel(S_Alchemy_s02) > 0) {
    return 1 - thePlayer.GetStaminaPercents() * 0.25;
  }

  return 1;
}