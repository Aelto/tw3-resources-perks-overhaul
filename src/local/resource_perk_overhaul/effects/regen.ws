// the mutagen 21 is the Ekhidna decoction that gives the following effect:
// Performing actions that consume Stamina regenerates Vitality.
// Unfortunately in vanilla the only way to consume stamina is through signs
// which consume 100% of your stamina. So they didn't bother scaling the health
// regen and directly applied a health like if it was 100% stamina consumed every
function RPO_getMutagen21RegenModifier(): float {
  var current_stamina: float;
  var max_stamina: float;
  var mean_cost_of_all_actions: float;

  // here it is a percent value going from 0 to 1
  current_stamina = thePlayer.GetStaminaPercents();
  max_stamina = thePlayer.GetStatMax(BCS_Stamina);

  // NOTE: it is not a percent value here
  if (thePlayer.IsCastingSign()) {
    mean_cost_of_all_actions = max_stamina * RPO_getSignCostModifier();
  }
  else {
    mean_cost_of_all_actions = (
      RPO_getDodgeStaminaCost()
      + RPO_getHeavyAttackStaminaCost()
      + RPO_getLightAttackStaminaCost()
      + RPO_getRollStaminaCost()
      // there is also the parry cost in theory but it scales
      // with the enemy health and size so i chose to ignore
      // it here.
    ) / 4;
  }

  // if the mean cost is let's say 25% of your stamina per action,
  // and that you're at 50% stamina and you have a regen multiplier of 2. 
  // That will give 0.25 * 0.5 / 2 = 0.0625,
  // so you'd get 6% of the heal you got before the fix
  return mean_cost_of_all_actions / max_stamina * (1 - current_stamina) / RPO_getStaminaRegenerationMultiplier()
}

function RPO_shouldGetAncientLeshenDecoctionBuff(): bool {
  return RandF() < RPO_getStaminaRegenerationMultiplier();
}