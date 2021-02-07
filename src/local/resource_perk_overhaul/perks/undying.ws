// gaining adrenaline restores health based on the current stamina levels.
// higher stamina levels provide more health.
function RPO_adrenalineGainRestoresHealth(adrenaline_amount: float) {
  var current_stamina: float;

  current_stamina = thePlayer.GetStaminaPercents();

  thePlayer.GainStat(
    BCS_Vitality,
    adrenaline_amount
    * thePlayer.GetHealth()
    * 0.05
    * RPO_getSkillLevel(S_Sword_s18)
    * current_stamina
  );
}