
// the function restores adrenaline when the stamina reaches 100%.
// it happens only when it reaches it and doesn't work like a passive regeneneration
function RPO_overStaminaRestoresAdrenaline(stamina_amount: float, current: float, max: float) {
  // it's an over stamina regen
  if (current + stamina_amount > max && thePlayer.IsInCombat()) {
    thePlayer.GainStat(
      BCS_Focus,
      RPO_getSkillLevel(S_Magic_s07) // Igni Intensity
      * 0.2
    );
  }
}