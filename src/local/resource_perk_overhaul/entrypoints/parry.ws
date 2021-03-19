
// the size is not exactly the height, but instead the height multiplied by the
// radius. Some creatures are thin but really tall and others are small but large
// like griffins vs leshens.
function RPO_getEntitySize(entity: CActor): float {
  var moving_agent: CMovingPhysicalAgentComponent;
  var radius: float;

  moving_agent = (CMovingPhysicalAgentComponent)entity.GetMovingAgentComponent();

  // RPODEBUG("height: " + moving_agent.GetCapsuleHeight() + " width: " + moving_agent.GetCapsuleRadius());

  // +1 to make sure it's always above 1. It is important as we use a square value
  // later. And a square value for a number lesser than 1 results in a smaller
  // value and that's not what we want.
  radius = moving_agent.GetCapsuleRadius() + 1;

  return moving_agent.GetCapsuleHeight() * 0.5
       + radius * radius;
}

// returns a value between 0 and 1 that represents the % of stamina required
// to parry an action by an attacker with the supplied size.
function RPO_getSizeParryCost(size: float): float {
  // at the moment the maximum size we consider is 8
  return size / 8
       * RPO_getParrySizeStamineRequirementMultiplier();
}

// The health of the attacker is also a great way to get the strength of the creature
// What's even better is that health changes during combat and represents well the
// potential fatigue of the player or the attacker.
function RPO_getParryCostMultiplierFromHealthDifference(attacker: CActor): float {
  return attacker.GetHealth() / thePlayer.GetHealth();
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

  stamina_cost = RPO_getSizeParryCost(RPO_getEntitySize(attacker))
               / (RPO_getArmorWeight() * 0.5)
               * RPO_getParryCostMultiplierFromHealthDifference(attacker);

  had_stamina_to_fully_parry = thePlayer.GetStaminaPercents() >= stamina_cost;

  delay = 1;
  if (!had_stamina_to_fully_parry) {
    delay *= 2;
  }

  thePlayer.DrainStamina(ESAT_FixedValue, stamina_cost * 100, delay * RPO_getStaminaRegenerationDelayMultiplier());

  return had_stamina_to_fully_parry;
}