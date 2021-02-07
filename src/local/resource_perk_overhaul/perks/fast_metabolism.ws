
function RPO_getOverallResourceConsumptionWithToxicityModifier(): float {
  return Max(
    1 - RPO_getSkillLevel(S_Alchemy_s15)
    * thePlayer.GetStat(BSC_Toxicity)
    * 0.01,
    
    0
  );
}