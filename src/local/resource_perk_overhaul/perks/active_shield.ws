
function RPO_getOverallResourceConsumptionWithQuenModifier(): float {
  if (RPO_getSkillLevel(S_Magic_s04) == 0 || !GetWitcherPlayer().IsAnyQuenActive()) {
    return 1;
  }

  return 0;
}

function RPO_getOverallResourceRegenerationWithQuenModifier(): float {
  return RPO_getOverallResourceConsumptionWithQuenModifier();
}