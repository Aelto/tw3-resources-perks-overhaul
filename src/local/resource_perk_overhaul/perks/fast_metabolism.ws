
function RPO_getOverallResourceConsumptionWithToxicityModifier(): float {
  return MaxF(
    1 - (float)RPO_getSkillLevel(S_Alchemy_s15)
    * thePlayer.GetStat(BCS_Toxicity)
    * 0.01,
    
    0
  );
}