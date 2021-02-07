
function RPO_getOverallResourceConsumptionWithQuenModifier(): float {
  if (RPO_getSkillLevel(S_Magic_s04) == 0 || !GetWitcherPlayer().IsAnyQuenActive()) {
    return 1;
  }

  return 0;
}

function RPO_getOverallResourceRegenerationWithQuenModifier(): float {
  return RPO_getOverallResourceConsumptionWithQuenModifier();
}

function RPO_getLightAttackWithQuenModifier(): float {
  if (RPO_getSkillLevel(S_Magic_s04) == 0 || !GetWitcherPlayer().IsAnyQuenActive()) {
    return 1;
  }

  return 0.5;
}

function RPO_getHeavyAttackWithQuenModifier(): float {
  var level: int;

  level = RPO_getSkillLevel(S_Magic_s04);

  if (level == 0 || !GetWitcherPlayer().IsAnyQuenActive()) {
    return 1;
  }

  return 1
       + 0.2
       + level * 0.1;
}

function RPO_reduceShieldHealthIfActive() {
  var quen: W3QuenEntity;
  var level: int;

  level = RPO_getSkillLevel(S_Magic_s04);

  if (level == 0 || !GetWitcherPlayer().IsAnyQuenActive()) {
    return;
  }

  quen = (W3QuenEntity)GetWitcherPlayer().GetSignEntity(ST_Quen);

  if (quen) {
    quen.SetDataFromRestore(
      quen.GetShieldHealth() - quen.GetInitialShieldHealth() * (0.4 / level),
      quen.GetShieldRemainingDuration()
    );


    if (quen.GetShieldHealth() <= 0) {
      quen.ForceFinishQuen(false);
    }
  }
}