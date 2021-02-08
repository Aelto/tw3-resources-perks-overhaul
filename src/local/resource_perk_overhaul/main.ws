
function RPO_getProperties(): ResourcePerkOverhaulProperties {
  var player_input: CPlayerInput;

  player_input = thePlayer.GetInputHandler();

  return player_input.resource_perk_overhaul_properties;
}

function RPO_checkInstantiated() {
  var player_input: CPlayerInput;

  player_input = thePlayer.GetInputHandler();

  if (!player_input.resource_perk_overhaul_properties.is_instantiated) {
    if (!RPO_isInitialized()) {
      RPO_initializeSettings();

      displayModResourcesPerksOverhaulInitializedNotification();
    }

    player_input.resource_perk_overhaul_properties
      .is_instantiated = true;
  }
}