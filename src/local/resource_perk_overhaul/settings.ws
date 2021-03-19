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
function RPO_getSignStaminaCostMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOsignStaminaCostMultiplier')
  );
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
function RPO_getParrySizeStamineRequirementMultiplier(): float {
  return StringToFloat(
    theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOparrySizeStaminaRequirementMultiplier')
  );
}

function RPO_canPerformActionsWithoutStamina(): bool {
  return theGame
    .GetInGameConfigWrapper()
    .GetVarValue('RPOgeneral', 'RPOcanPerformActionsWithoutStamina');
}