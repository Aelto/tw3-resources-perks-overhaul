
// return if the mod is enabled. It is a function used in almost every function
// introduced by RPO.
function RPO_isEnabled(): bool {
  return true;
}

function RPO_getProperties(): ResourcePerkOverhaulProperties {
  var player_input: CPlayerInput;

  player_input = thePlayer.GetInputHandler();

  if (!player_input.resource_perk_overhaul_properties.is_instantiated) {
    // there is nothing to instantiate yet, but maybe in the future there will.

    player_input.resource_perk_overhaul_properties
      .is_instantiated = true;
  }

  return player_input.resource_perk_overhaul_properties;
}