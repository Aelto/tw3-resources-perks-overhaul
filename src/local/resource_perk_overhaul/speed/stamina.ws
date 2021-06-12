function RPO_getSpeedModifierForStaminaPercent(percent: float): Float {
  // with the default multiplier:
  // 100%: 1
  // 75%: 0.9459379855855781
  // 50%: 0.9164824687669755
  // 25%: 0.89612369213023
  // 15%: 0.886350127184105
  return 1 - (LogF(1 + (100 - percent * 100) * 0.05) / 15) * RPO_getMissingStaminaSpeedLossMultiplier();
}