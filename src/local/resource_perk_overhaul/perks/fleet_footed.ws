
// the fleet footed skill has a passive perks that makes missing stamina increase
// damage input. Each point in stamina increases damage by 0.5% per level in
// fleet footed. So a level 3 fleet footed means 1.5% more damage per missing
// stamina
function RPO_missingStaminaDamageInputModifier(): float {
  return (1 - thePlayer.GetStaminaPercents())
       * 0.005
       * RPO_getSkillLevel(S_Sword_s09);
}