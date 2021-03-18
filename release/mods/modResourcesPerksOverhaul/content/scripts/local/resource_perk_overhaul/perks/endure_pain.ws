
// As life goes down, Endure pain decreases the cost of all aggressive actions
function RPO_getResourceConsumptionAggressiveActionsModifier(): float {
  var level: int;

  level = RPO_getSkillLevel(S_Alchemy_s20);

  if (level == 0) {
    return 1;
  }

  // a bit complicated here, but the goal was to have a value ranging between
  // 0 and 1 and that decreases as life goes down. And at higher levels the
  // value decreases faster.
  // Here in its current state at 0% health all costs are reduced by 15% per
  // skill level. So it is a 45% reduced cost at level 3.
  return 1 - (1 - thePlayer.GetHealthPercents()) * (1 - 0.15 * level);
}

// As life goes down, Endure Pain increases the cost of all defensive actions
function RPO_getResourceConsumptionDefensiveActionsModifier(): float {
  var level: int;

  level = RPO_getSkillLevel(S_Alchemy_s20);

  if (level == 0) {
    return 1;
  }

  // by default, when full life the costs remain unchanged
  // and as life goes down for each % of life lost the costs increase by 0.5% 
  // divided by the skill level.
  return 2 - thePlayer.GetHealthPercents() * 0.5 / level;
}