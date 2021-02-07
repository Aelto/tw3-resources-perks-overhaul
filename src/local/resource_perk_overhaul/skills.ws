
// red tree:
// Strength Training (S_Sword_s04)
// Fleet Footed (S_Sword_s09)
// Muscle Memory (S_Sword_s21)
// Razor Focus (S_Sword_s20)
// Undying (S_Sword_s18)

// blue tree:
// Aard Sweep (S_Magic_s01)
// Firestream (S_Magic_s02)
// Magic Trap (S_Magic_s03)
// Active Shield (S_Magic_s04)
// Igni Intensity (S_Magic_s07)
// Pyromaniac (S_Magic_s09)
// Sustained Glyphs (S_Magic_s10)
// Aard Intensity (S_Magic_s12)
// Delusion (S_Magic_s17)
// Far-Reaching Aard (S_Magic_s20)
// Yrden Intensity (S_Magic_s16)

// green tree:
// Refreshment (S_Alchemy_s02)
// Fixative (S_Alchemy_s06)
// Poisoned Blades (S_Alchemy_s12)
// Tissue Transmutation (S_Alchemy_s13)
// Acquired Tolerance (S_Alchemy_s18)
// Endure Pain (S_Alchemy_s20)
// Fast Metabolism (S_Alchemy_s15)

function RPO_requireSkillEquipped(): bool {
  // TODO: use the mod menu value instead
  return true;
}

function RPO_getSkillLevel(skill : ESkill): int {
  if (!thePlayer.IsSkillEquipped(skill) && RPO_requireSkillEquipped()) {
    return 0;
  }

  return Max(3, thePlayer.GetSkillLevel(skill));
}

