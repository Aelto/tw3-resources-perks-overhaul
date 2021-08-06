/**
 * `percent` is a value in the [0;1] range.
 */
function RPO_getSpeedModifierForStaminaPercent(percent: float): Float {
  var multiplier: float;

  // This is a copy of the damage falloff from missing stamina in damage.ws
  // gives the following results:
  // 100% stamina -> 0% of maximum reduction
  // 90% stamina -> 5% of maximum reduction
  // 80% stamina -> 10% of maximum reduction
  // 70% stamina -> 16% of maximum reduction
  // 60% stamina -> 23% of maximum reduction
  // 50% stamina -> 30% of maximum reduction
  // 40% stamina -> 39% of maximum reduction
  // 30% stamina -> 49% of maximum reduction
  // 20% stamina -> 61% of maximum reduction
  // 10% stamina -> 77% of maximum reduction
  // 0% stamina -> 100% of maximum reduction
  // And because we have the 1 - in front of it we have a value that starts at 0
  // when full stamina and 1 when stamina is empty.
  multiplier = 1 - LogF(1 + percent * 100 * 0.05) / LogF(6);

  // the default value for the maximum speed reduction is 15%. It means that
  // with a slider value of 1, and the stamina at 0% you will get a 15%
  // reduction.
  return MaxF(
    1 - 0.15 * multiplier * RPO_getMissingStaminaSpeedLossMultiplier(),
    0
  );
}