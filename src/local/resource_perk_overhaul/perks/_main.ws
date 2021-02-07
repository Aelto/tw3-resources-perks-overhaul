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

// this code happens whenever Gerealt gains a stat
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

function RPO_getSignCostModifier(): float {
  return 0.5
       * RPO_refreshmentIncreasesAllStaminaCostModifier()
       * RPO_getResourceConsumptionAggressiveActionsModifier()
       * RPO_getOverallResourceConsumptionWithToxicityModifier();
}

function RPO_staminaCostManager(action : EStaminaActionType, isPerSec : bool, out cost : SAbilityAttributeValue, out delay : SAbilityAttributeValue, optional abilityName : name) {
  if(action == ESAT_Ability) {
    cost.valueAdditive *= RPO_getSignCostModifier();
    cost.valueMultiplicative *= RPO_getSignCostModifier();
    cost.valueBase *= RPO_getSignCostModifier();
  }
}

// the function reduce the skill cost modifier to 50% when it's a sign
function RPO_getSkillStaminaCostModifier(skill: ESkill): float {
  if (IsSkillSign(skill)) {
    return 0.5 * RPO_getSignCostModifier();
  }

  return 1
       * RPO_refreshmentIncreasesAllStaminaCostModifier()
       * RPO_getOverallResourceConsumptionWithToxicityModifier();
}

