
// the fleet footed skill has a passive perks that makes missing stamina increase
// damage input. Each point in stamina increases damage by 0.5% per 1% of
// stamina that is missing. Resulting in a 50% increase at 0% stamina
function RPO_missingStaminaDamageInputModifier(): float {
  if (RPO_getSkillLevel(S_Sword_s09) > 0) {
    return (1 - thePlayer.GetStaminaPercents())
       * 0.0005;
  }

  return 0;
}