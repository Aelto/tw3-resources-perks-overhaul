
// return the armor weight, heavy armours weight more than medium armours which
// weight more than light armours.
function RPO_getArmorWeight(): float {
  var item: SItemUniqueId;
  var weight: float;

  if (thePlayer.inv.GetItemEquippedOnSlot(EES_Armor, item)) {
    weight += RPO_getWeightValueByArmorType(
      thePlayer.inv.GetArmorType(item)
    );
  }

  if (thePlayer.inv.GetItemEquippedOnSlot(EES_Boots, item)) {
    weight += RPO_getWeightValueByArmorType(
      thePlayer.inv.GetArmorType(item)
    );
  }

  if (thePlayer.inv.GetItemEquippedOnSlot(EES_Pants, item)) {
    weight += RPO_getWeightValueByArmorType(
      thePlayer.inv.GetArmorType(item)
    );
  }

  if (thePlayer.inv.GetItemEquippedOnSlot(EES_Gloves, item)) {
    weight += RPO_getWeightValueByArmorType(
      thePlayer.inv.GetArmorType(item)
    );
  }

  return weight;
}

// internal function that returns the weight for the supplied armor type.
function RPO_getWeightValueByArmorType(type: EArmorType): float {
  if (type == EAT_Light) {
    return 1;
  }
  else if (type == EAT_Medium) {
    return 2;
  }

  return 3;
}