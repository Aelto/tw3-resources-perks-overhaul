
// the size is not exactly the height, but instead the height multiplied by the
// radius. Some creatures are thin but really tall and others are small but large
// like griffins vs leshens.
function RPO_getEntitySize(entity: CActor): float {
  var moving_agent: CMovingPhysicalAgentComponent;

  moving_agent = (CMovingPhysicalAgentComponent)entity.GetMovingAgentComponent();

  RPODEBUG("height: " + moving_agent.GetCapsuleHeight() + " width: " + moving_agent.GetCapsuleRadius());

  return moving_agent.GetCapsuleHeight() * 0.1
       + moving_agent.GetCapsuleRadius() * 10;
}

// returns a value between 0 and 1 that represents the % of stamina required
// to parry an action by an attacker with the supplied size.
function RPO_getSizeParryCost(size: float): float {
  // TODO: use a slider in the menu to multiply this value.
  // at the moment the maximum size we consider is 8
  return size / 8
       * RPO_getParrySizeStamineRequirementMultiplier();
}


function RPO_parryActor(parry_info: SParryInfo): bool {
  var attacker: CActor;
  var stamina_cost: float;
  var had_stamina_to_fully_parry: bool;
  var delay: float;

  attacker = parry_info.attacker;

  if (!RPO_isEnabled()) {
    return true;
  }

  if (parry_info.target != thePlayer || attacker == thePlayer) {
    return true;
  }

  if (!attacker) {
    return true;
  }

  stamina_cost = RPO_getSizeParryCost(
    RPO_getEntitySize(attacker)
  );

  had_stamina_to_fully_parry = thePlayer.GetStaminaPercents() >= stamina_cost;

  delay = 1;
  if (!had_stamina_to_fully_parry) {
    delay *= 2;
  }

  thePlayer.DrainStamina(ESAT_FixedValue, stamina_cost * 100, delay * RPO_getStaminaRegenerationDelayMultiplier());

  return had_stamina_to_fully_parry;
}