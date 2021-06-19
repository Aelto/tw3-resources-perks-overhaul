
function RPO_damageModifier(out action: W3DamageAction, playerAttacker: CR4Player, attackAction: W3Action_Attack) {
  var attacker: CActor;
  var modifier: float;

  attacker = (CActor)action.attacker;

  // when geralt is the attacker and it's not a DOT
  if ((CPlayer)attacker && !((CPlayer)action.victim) && !action.IsDoTDamage()) {
    modifier = RPO_updateAttackDamageBasedOnCurrentStamina(playerAttacker, attackAction)
             * RPO_globalAttackDamageModifier(playerAttacker, attackAction);

    if (playerAttacker.IsHeavyAttack(attackAction.GetAttackName())) {
      modifier *= RPO_getHeavyAttackWithQuenModifier();
    }
    else if (playerAttacker.IsLightAttack(attackAction.GetAttackName())) {
      modifier *= RPO_getLightAttackWithQuenModifier();
    }

    // RPODEBUG("damage output, modifier: " + modifier);

    action.processedDmg.vitalityDamage *= modifier;
    action.processedDmg.essenceDamage *= modifier;
  }

  // when geralt is not the attacker but the victim
  if (attacker != thePlayer && action.victim == thePlayer) {
    modifier = 1
            //  + RPO_adrenalineDamageInputModifier()
             + RPO_getDamageInputMultiplier()
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

    // it is a value going from 0 to 100
    current_stamina = thePlayer.GetStatPercents(BCS_Stamina) * 100;

    // gives the following results:
    // 0% stamina: 0% damage
    // 10% stamina: 23% damage
    // 20% stamina: 39% damage
    // 30% stamina: 51% damage
    // 40% stamina: 61% damage
    // 50% stamina: 70% damage
    // 60% stamina: 77% damage
    // 70% stamina: 84% damage
    // 80% stamina: 90% damage
    // 90% stamina: 95% damage
    // 100% stamina: 100% damage
    // note: we reuse the stamina variable here
    // And because we have the 1 - in front of it we have a value start at 0
    // when full stamina and 1 when stamina is empty.
    current_stamina = 1 - LogF(1 + current_stamina * 0.05) / LogF(6);

    // here we don't want the value to go higher than 1 because it means 100%
    // damage reduction. And more would lead the value below zero.
    current_stamina = MinF(
      current_stamina * RPO_getMissingStaminaDamageLossMultiplier(),
      1
    );

    // and... we do `1 -` again so now it's a modifier that goes from 0 when
    // stamina is empty and to 1 when stamina is full.
    return 1 - current_stamina;
  }

  return 1;
}

// the mod reduces global attack damage by a flat % by default. This is to give
// perks a purpose and because the player would become way too strong otherwise.
function RPO_globalAttackDamageModifier(playerAttacker: CR4Player, attackAction: W3Action_Attack): float {
  if (playerAttacker && attackAction
  && (
    // this is the rend attack
    thePlayer.GetCombatAction() == EBAT_SpecialAttack_Heavy
    // we only change the damage for heavy and light attacks, not signs.
    || playerAttacker.IsHeavyAttack(attackAction.GetAttackName())
    || playerAttacker.IsLightAttack(attackAction.GetAttackName()))) {
    return RPO_getDamageOutputMultiplier();
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

function RPO_damageReceivedManager(manager: W3AbilityManager) {
  var props: ResourcePerkOverhaulProperties;
  var timestamp: float;
  var yrden_intensity_level: int;

  if (!((W3PlayerAbilityManager)manager) && manager.owner != GetWitcherPlayer()) {
    return;
  }

  props = RPO_getProperties();
  timestamp = theGame.GetEngineTimeAsSeconds();

  yrden_intensity_level = RPO_getSkillLevel(S_Magic_s16);

  if (props.last_hit_timestamp + (5 - yrden_intensity_level) < timestamp
  && yrden_intensity_level > 0) {

    thePlayer.GainStat(
      BCS_Focus,
      yrden_intensity_level
      * 0.2
      * (1 - thePlayer.GetStatPercents(BCS_Stamina))
    );
  }

  props.last_hit_timestamp = timestamp;
}