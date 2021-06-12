function RPO_isEnabled(): bool {
  return theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOmodEnabled');
}

function RPO_isInitialized(): bool {
  return theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOmodInitialized');
}

function RPO_initializeSettings() {
  theGame
    .GetInGameConfigWrapper()
    .ApplyGroupPreset('RPOgeneral', 0);

  theGame.SaveUserSettings();
}

function RPO_arePerksEnabled(): bool {
  return theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOperksEnabled');
}

function RPO_perksNeedToBeEquipped(): bool {
  return theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOrequirePerksEquipped');
}

function RPO_getStaminaRegenerationMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOstaminaRegenerationMultiplier')
  );
}
function RPO_getStaminaRegenerationDelayMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOstaminaRegenerationDelayMultiplier')
  );
}
function RPO_getMissingStaminaDamageLossMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOmissingStaminaDamageLossMultiplier')
  );
}
function RPO_getLightAttackStaminaCostMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOlightAttackStaminaCostMultiplier')
  );
}
function RPO_getHeavyAttackStaminaCostMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOheavyAttackStaminaCostMultiplier')
  );
}
function RPO_getDodgeStaminaCostMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOdodgeStaminaCostMultiplier')
  );
}
function RPO_getRollStaminaCostMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOrollStaminaCostMultiplier')
  );
}
function RPO_getSignStaminaCostMultiplier(sign: ESignType): float {

  // Aard
  if (sign == ST_Aard) {
    return StringToFloat(
      theGame
      .GetInGameConfigWrapper()
      .GetVarValue('RPOgeneral', 'RPOaardStaminaCostMultiplier')
    );
  }

  // Igni
  else if (sign == ST_Igni) {
    return StringToFloat(
      theGame
      .GetInGameConfigWrapper()
      .GetVarValue('RPOgeneral', 'RPOigniStaminaCostMultiplier')
    );
  }

  // Yrden
  else if (sign == ST_Yrden) {
    return StringToFloat(
      theGame
      .GetInGameConfigWrapper()
      .GetVarValue('RPOgeneral', 'RPOyrdenStaminaCostMultiplier')
    );
  }

  // Quen
  else if (sign == ST_Quen) {
    return StringToFloat(
      theGame
      .GetInGameConfigWrapper()
      .GetVarValue('RPOgeneral', 'RPOquenStaminaCostMultiplier')
    );
  }

  else if (sign == ST_Axii) {
    return StringToFloat(
      theGame
      .GetInGameConfigWrapper()
      .GetVarValue('RPOgeneral', 'RPOaxiiStaminaCostMultiplier')
    );
  }

  // when the passed skill is not recognised it returns a mean value of all four
  // sign costs
  return (
    StringToFloat(
      theGame
      .GetInGameConfigWrapper()
      .GetVarValue('RPOgeneral', 'RPOaardStaminaCostMultiplier')
    ) +
    StringToFloat(
      theGame
      .GetInGameConfigWrapper()
      .GetVarValue('RPOgeneral', 'RPOigniStaminaCostMultiplier')
    ) +
    StringToFloat(
      theGame
      .GetInGameConfigWrapper()
      .GetVarValue('RPOgeneral', 'RPOyrdenStaminaCostMultiplier')
    ) +
    StringToFloat(
      theGame
      .GetInGameConfigWrapper()
      .GetVarValue('RPOgeneral', 'RPOquenStaminaCostMultiplier')
    ) +
    StringToFloat(
      theGame
      .GetInGameConfigWrapper()
      .GetVarValue('RPOgeneral', 'RPOaxiiStaminaCostMultiplier')
    )
  ) / 5;
}
function RPO_getSignStaminaRequirementMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOsignStaminaRequirementMultiplier')
  );
}

function RPO_canParryAnything(): bool {
  return theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOcanParryAnything');
}
function RPO_getParrySizeStaminaRequirementMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOparrySizeStaminaRequirementMultiplier')
  );
}
function RPO_getParryStaminaRegenerationMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOparryStaminaRegenerationMultiplier')
  );
}

function RPO_canPerformActionsWithoutStamina(): bool {
  return theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOcanPerformActionsWithoutStamina');
}

function RPO_getMissingStaminaSpeedLossMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOmissingStaminaSpeedLossMultiplier')
  );
}
function RPO_getDodgeSpeedMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOdodgeSpeedMultiplier')
  );
}
function RPO_getRollSpeedMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOrollSpeedMultiplier')
  );
}
function RPO_getHeavyAttackSpeedMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOheavyAttackSpeedMultiplier')
  );
}
function RPO_getLightAttackSpeedMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOlightAttackSpeedMultiplier')
  );
}
function RPO_getLightArmourSpeedMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOlightArmourMultiplier')
  );
}
function RPO_getHeavyArmourSpeedMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOheavyArmourMultiplier')
  );
}