function RPO_getAdrenalineSpeedMultiplier(): float {
  return 1
       + RPO_getAdrenalineSpeedGain() * thePlayer.GetStat(BCS_Focus);
}