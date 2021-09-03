# tw3-combat-perk-overhaul

<h3 align="center">
  <a href="https://www.youtube.com/watch?v=lbpTVS3wGao">SHOWCASE</a>
</h3>

A small "overhaul" that changes how you manage your resources like adrenaline and stamina during combat through new passive perks and a permissive stamina system.

The stamina system is designed to be unintrusive and not frustrating at all and instead tries to encourage smart gameplay without blocking any of the player's actions. An empty stamina bar doesn't stop you from dodging or attacking but instead will delay the regeneration even more or will decrease/increase the damage you deal and receive.

No more "oh no my stamina is empty, guess i'll take a break in the middle of the fight to regenerate a bit so that i can finally play again!" and instead "okay so if i spam my light attacks i'll deal less damages than if i do an heavy followed by a light attack, so i'll do this"

And of course, you know me, the mod comes with an extensive mod menu to tweak everything. This mod can be used as a replacement for most stamina combat mods you know and offers a total control over everything about the actions and their cost.

# Selling points
RPO's strong points are the following:
 - dynamic stamina regeneration, it follows a logarithmic function unlike other mods where it is linear. The higher your stamina is, the higher its regeneration as well.
 - permissive stamina system, you can still perform actions even at 0 stamina
 - dynamic stats based on stamina, as stamina goes down you lose other stats like attack power and overall speed

Thanks to its perks, adrenaline becomes an interactive resource as well, you can use it to save stamina for example, or even regenerate life. Creating a more permissive but more dynamic experience while still forcing you to play smart

# Optional perks
Note that all perks are not made to give advantages, some of them may even seem like counter productive if not paired with the right build. Perks were made to be combined so you can create varied build around different Witcher school sets. A loss of adrenaline once combined with the right perk may also heal you for example, but you will also lose the damage gain from the adrenaline. Everything comes at a cost, the perks were made to encourage varied and interesting gameplay.

As everything is done through scripts, the new effects added to the perks work with every overhaul you may use.


## DPS tree:
- [x] **Fleet footed** also adds: dodges now consume adrenaline instead of stamina, missing stamina increases damage received. 0.5% increased damage per % missing stamina to 0.016% at Fleet Footed level 3.
- [x] **Strength training** and Muscle Memory (light & heavy attack damage) add: adrenaline now increases the stamina cost of attacks. Heavy attacks consume adrenaline but their damage continue to scale on your current stamina levels. 15% increased cost per adrenaline point divided to 5% per adrenaline point at Strength Training level 3
- [x] **Undying** adds: Gaining adrenaline heals based on the stamina you currently have. Higher stamina means more healing. Adrenaline increases the stamina cost of attacks. 5% of maximum health per adrenaline point gained per level on Undying (maximum level 3).

## Sign tree:
- [x] **Igni intensity** adds: when reaching 100% stamina, gain a burst of adrenaline
- [x] **Yrden intensity** perk (3rd row): When hit, if it's the first time you've been in the previous 5 seconds window, gain stamina 0.2 adrenaline point per perk level (maximum 3) and decreased cooldown by 1 second per perk level (maximum 3).
- [x] **Active Shield** (quen alt) adds: While Quen is active resources regeneration and consumption are removed (except for signs) and heavy attacks deal more damage while light attacks deal less damage. -50% damage to light attacks and +20% to 50% at Active Shield level 3. Attacking while Quen is up reduces the shield's health by 40% to 12% at Active Shield level 3.

## Alchemy tree:
- [x] **Refreshment**: When at maximum adrenaline, consuming stamina restores health. The lower the stamina the higher the heal. Also increases all stamina cost by 50%
- [x] **Fixative**: Fast attacks now use adrenaline instead of stamina and their damage now scales on your adrenaline levels. _Note that adrenaline ranges from 0 to 3, so at full adrenaline fast attacks deal 300% more damage than they normally do at full stamina.
- [x] **Endure pain**: As life goes down, resources consumption for aggressive actions is 45% more efficient but 45% less efficient for defensive actions. (15% per perk level)
- [x] **Fast metabolism** (toxicity drops faster): toxicity improves overall resource consumption by 0.01% per toxicity point per skill level. 90% at 300 toxicity with level 3 skill (which is the maximum for RPO)

# Installing
- Download the zip archive from the [releases](https://github.com/Aelto/tw3-resources-perks-overhaul/releases).
- Navigate into the zip archive until you see two folders `bin` and `mods`
- Open your `The Witcher 3` directory, drop the two folders from your zip archive into your `The Witcher 3` directory so that you merge their content
- Confirm you now have a directory named `modResourcesPerksOverhaul` into your `The Witcher 3/mods/` directory
- Open the script merging tool of your choice, script merger being the prefered solution.
- Confirm the scripts merger detects three pending merges in `r4player.ws`, `playerInput.ws`, and `damageManagerProcessor.ws`
- Proceed with the merges and let the tool resolve every conflict automatically
- Start your game
- Confirm you now have a new mod-menu named Resources Perks Overhaul under `Options` > `Mods`
- Apply the default preset then tweak the settings to your liking
