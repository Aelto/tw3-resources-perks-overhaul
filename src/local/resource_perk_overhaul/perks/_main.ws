// this file contains generic code about the perks.
// effect that do not belong to one perk but may belong to many of them.

function RPO_getAdrenalineDamageIncreaseLevel(): int {
  return RPO_getSkillLevel(S_Sword_s04) // Strength Training (S_Sword_s04)
       + RPO_getSkillLevel(S_Sword_s21) // Muscle Memory (S_Sword_s21)
       + RPO_getSkillLevel(S_Sword_s18);// Undying (S_Sword_s18)
}

                          ////////////////////////
                          // GENERAL STATS CODE //
                          ////////////////////////

function RPO_statGainModifier(manager: W3AbilityManager, stat : EBaseCharacterStats, amount : float, current_stat: float, max_stat: float): float {
  if (!((W3PlayerAbilityManager)manager) && manager.owner != GetWitcherPlayer()) {
    return 1;
  }

  if (stat != BCS_Vitality) {
    return RPO_getOverallResourceRegenerationWithQuenModifier();
  }

  return 1;
}

function RPO_overallStaminaRegenerationModifier(): float {
  return RPO_getStaminaRegenerationMultiplier();
}

// this code happens whenever Gerealt gains a stat, but after the stat has been
// changed.
function RPO_statGainManager(manager: W3AbilityManager, stat : EBaseCharacterStats, amount : float, current_stat: float, max_stat: float) {
  if (!((W3PlayerAbilityManager)manager) && manager.owner != GetWitcherPlayer()) {
    return;
  }


  if (stat == BCS_Focus) {
    RPO_adrenalineGainRestoresHealth(amount);
  }

  if (stat == BCS_Stamina) {
    RPO_overStaminaRestoresAdrenaline(amount, current_stat, max_stat);
  }
}

                          ////////////////////////
                          // GENERAL SIGNS CODE //
                          ////////////////////////

function RPO_skillToSign(skill: ESkill): ESignType {
  switch (skill) {
    case S_Magic_1:
    case S_Magic_s01:
      return ST_Aard;

    case S_Magic_2:
    case S_Magic_s02:
      return ST_Igni;

    case S_Magic_3:
    case S_Magic_s03:
      return ST_Yrden;

    case S_Magic_4:
    case S_Magic_s04:
      return ST_Quen;

    case S_Magic_5:
    case S_Magic_s05:
      return ST_Axii;

    default:
      return ST_None;
  }
}

function RPO_abilityToSign(ability: name): ESignType {
  switch (ability) {
    case 'magic_1':
    case 'magic_sO1':
      return ST_Aard;

    case 'magic_2':
    case 'magic_sO2':
      return ST_Igni;

    case 'magic_3':
    case 'magic_sO3':
      return ST_Yrden;

    case 'magic_4':
    case 'magic_sO4':
      return ST_Quen;

    case 'magic_5':
    case 'magic_sO5':
      return ST_Axii;

    default:
      return ST_None;
  }
}

function RPO_getSignCostModifier(sign: ESignType): float {
  return RPO_getSignStaminaCostMultiplier(sign)
       * RPO_refreshmentIncreasesAllStaminaCostModifier()
       * RPO_getResourceConsumptionAggressiveActionsModifier()
       * RPO_getOverallResourceConsumptionWithToxicityModifier();
}

function RPO_staminaCostManager(action : EStaminaActionType, isPerSec : bool, out cost : SAbilityAttributeValue, out delay : SAbilityAttributeValue, optional abilityName : name, owner: CActor) {
  var modifier: float;

  if(action == ESAT_Ability && RPO_isEnabled()) {
    if (owner != GetWitcherPlayer()) {
      return;
    }

    modifier = RPO_getSignCostModifier(RPO_abilityToSign(abilityName));

    cost.valueAdditive *= modifier;
    cost.valueMultiplicative *= modifier;
    cost.valueBase *= modifier;
  }
}

function RPO_getSignStaminaRequirementMultiplierIfEnabled(): float {
  if (!RPO_isEnabled()) {
    return 1;
  }
  
  return RPO_getSignStaminaRequirementMultiplier();
}

// the function reduces the skill requirement with a modifier. The modifier is
// the returned value. A modifier of 0.8 means that a sign requires 80% of its
// total cost to be cast.
function RPO_getSkillStaminaCostModifier(skill: ESkill): float {
  if (!RPO_isEnabled()) {
    return 1;
  }

  if (IsSkillSign(skill)) {
    return RPO_getSignStaminaRequirementMultiplier()
         * RPO_getSignCostModifier(RPO_skillToSign(skill));
  }

  return 1
       * RPO_refreshmentIncreasesAllStaminaCostModifier()
       * RPO_getOverallResourceConsumptionWithToxicityModifier();
}

