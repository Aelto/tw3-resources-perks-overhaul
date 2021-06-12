function RPO_getSpeedModifierFromArmorWeight(): float {
  var weight: float;

  weight = RPO_getArmorWeight();

  // heavy
  if (weight > 8) {
    return 1 + (weight - 8) * RPO_getHeavyArmourSpeedMultiplier();
  }

  // light
  else {
    return 1 + (8 - weight) * RPO_getLightArmourSpeedMultiplier();
  }
}