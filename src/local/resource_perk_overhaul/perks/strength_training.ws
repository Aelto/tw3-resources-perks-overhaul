
// because some perks make that adrenaline also increases stamina costs
// perks like Strength Training and Muscle Memory
function RPO_getAdrenalineIncreaseStaminaCostModifier(): float {
  var level: int;

  level = RPO_getSkillLevel(S_Sword_s21)
        + RPO_getSkillLevel(S_Sword_s04);

  // no level invested in the perks, return 1 to means no change
  if (level = 0) {
    return 1;
  }

  return 1
    // each point in adrenaline increases the cost by 15%
    // so at 3 adrenaline all costs are increased by 45%.
    + thePlayer.GetStat(BCS_Focus)
    // but increasing the skill reduces the % by a proportional amount
    * (0.15 / level);
}