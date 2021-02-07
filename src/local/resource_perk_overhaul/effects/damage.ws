
function RPO_damageModifier(out action: W3DamageAction, playerAttacker: CR4Player, attackAction: W3Action_Attack) {
  var attacker: CActor;
  var modifier: float;

  attacker = (CActor)action.attacker;

  // when geralt is the attacker and it's not a DOT
  if ((CPlayer)attacker && !((CPlayer)action.victim) && !action.IsDoTDamage()) {
    modifier = RPO_updateAttackDamageBasedOnCurrentStamina(playerAttacker, attackAction)
             * RPO_globalAttackDamageModifier(playerAttacker, attackAction);

    // RPODEBUG("damage output, modifier: " + modifier);

    action.processedDmg.vitalityDamage *= modifier;
    action.processedDmg.essenceDamage *= modifier;
  }

  // when geralt is not the attacker but the victim
  if (attacker != thePlayer && action.victim == thePlayer) {
    modifier = 1
            //  + RPO_adrenalineDamageInputModifier()
             + RPO_missingStaminaDamageInputModifier();

    // RPODEBUG("damage input, modifier: " + modifier);

    action.processedDmg.vitalityDamage *= modifier;
    action.processedDmg.essenceDamage *= modifier;
  }
}

// return how much attack damage should decrease based on the current stamina
// level. The lower the stamina, the lower the damage.
function RPO_updateAttackDamageBasedOnCurrentStamina(playerAttacker: CR4Player, attackAction: W3Action_Attack): float {
  var current_stamina: float;
  var fixative_level: int;

  fixative_level = RPO_getSkillLevel(S_Alchemy_s06);

  if (playerAttacker && attackAction
  // we don't want to update the rend damage with the current stamina because
  // rend drains stamina and it would not deal any damage if we did.
  && thePlayer.GetCombatAction() != EBAT_SpecialAttack_Heavy
  // we only change the damage for heavy and light attacks, not signs.
  && playerAttacker.IsHeavyAttack(attackAction.GetAttackName())
  || playerAttacker.IsLightAttack(attackAction.GetAttackName())) {

    // the fixative trait has a new effect, fast attacks no longer consume stamina
    // but consume adrenaline instead. And their damage scales on the adrenaline
    // levels.
    if (fixative_level > 0
    && playerAttacker.IsLightAttack(attackAction.GetAttackName())) {
      // NOTE:
      // we use the stamina variable but it's adrenaline instead.
      // Adrenaline ranges from 0 to 3 so it means fast attacks deal thrice the
      // damage they normally do when the player is at full adrenaline.
      // It is intended because adrenaline is harder to regenerate than stamina.
      current_stamina = thePlayer.GetStat(BCS_Focus);

      return current_stamina;
    }

    // it is a value going from 0 to 1
    current_stamina = thePlayer.GetStatPercents(BCS_Stamina);

    return current_stamina;
  }

  return 1;
}

// the mod reduces global attack damage by a flat % by default. This is to give
// perks a purpose and because the player would become way too strong otherwise.
function RPO_globalAttackDamageModifier(playerAttacker: CR4Player, attackAction: W3Action_Attack): float {
  if (playerAttacker && attackAction
  // we don't want to update the rend damage with the current stamina because
  // rend drains stamina and it would not deal any damage if we did.
  && thePlayer.GetCombatAction() != EBAT_SpecialAttack_Heavy
  // we only change the damage for heavy and light attacks, not signs.
  && playerAttacker.IsHeavyAttack(attackAction.GetAttackName())
  || playerAttacker.IsLightAttack(attackAction.GetAttackName())) {
    
    return 0.7;
  }

  return 1;
}

// return a value going from 0 to +infinity that represents a % value. So 0.5
// means 50% more damage input.
function RPO_adrenalineDamageInputModifier(): float {
  return thePlayer.GetStat(BCS_Focus)
       * RPO_getAdrenalineDamageIncreaseLevel()
       * 0.01;
}

function RPO_damageReceivedManager() {
  var props: ResourcePerkOverhaulProperties;
  var timestamp: float;
  var yrden_intensity_level: int;

  props = RPO_getProperties();
  timestamp = theGame.GetEngineTimeAsSeconds();

  yrden_intensity_level = RPO_getSkillLevel(S_Magic_s16);

  if (props.last_hit_timestamp + (5 - yrden_intensity_level) < timestamp
  && yrden_intensity_level > 0) {

    RPODEBUG("adrenaline gain: " + yrden_intensity_level // quen active shield
      * 0.5);

    thePlayer.GainStat(
      BCS_Focus,
      yrden_intensity_level // quen active shield
      * 0.2
    );
  }

  props.last_hit_timestamp = timestamp;
}