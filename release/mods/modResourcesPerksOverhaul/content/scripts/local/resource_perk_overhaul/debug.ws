function RPODEBUG(message: string, optional duration: float) {
  theGame
  .GetGuiManager()
  .ShowNotification(message, duration);
}

function displayModResourcesPerksOverhaulInitializedNotification() {
  theGame
  .GetGuiManager()
  .ShowNotification(
    GetLocStringByKey("option_resources_perks_overhaul_initialized")
  );
}