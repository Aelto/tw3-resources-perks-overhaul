# tw3-combat-perk-overhaul
The Witcher 3 - Combat & Perk overhaul


The goal of the overhaul is to add stamina based combat but in a more balanced but maybe less immersive way. That means light builds can dodge frequently but their attacks consume a bit more stamina as they hit harder while heavy builds can't dodge much (40% of stamina per dodge + 2s stamina regen pause) but their attacks don't use much stamina. To counter light attacks spam, your attack damage now scales on the stamina you have after you initiated the attack. And because of all this sign costs were reduced to 40% stamina requirement and 60% stamina cost. It means you can cast the sign even with less stamina than needed, but if you happen to cast it as an engage or in an aggressive way the sign costs hurt more.

A few perks also gain new passives, for example:

DPS tree:
- [x] Fleet footed also adds: dodges now consume adrenaline instead of stamina, missing stamina increases damage received.
- [x] Strength training and Muscle Memory (light & heavy attack damage) add: adrenaline now increases the stamina cost of attacks. Heavy attacks consume adrenaline but their damage continue to scale on your current stamina levels.
- [x] Undying adds: Gaining adrenaline heals based on the stamina you currently have. Higher stamina means more healing. Adrenaline increases the stamina cost of attacks

Sign tree:
- [x] Igni intensity adds: when reaching 100% stamina, gain a burst of adrenaline
- Aard Sweep (aard alt) adds: casting a sign with exactly 2 adrenaline and not more consumes all adrenaline but restores stamina.
- Yrden intensity perk (3rd row): When hit, if it's the first time you've been in the previous 5 seconds window, gain stamina
- Active Shield (quen alt) adds: While Quen is active resources regeneration and consumption are removed and heavy attacks deal more damage while light attacks deal less damage.

Alchemy tree:
- [x] Refreshment: When at maximum adrenaline, consuming stamina restores health. The lower the stamina the higher the heal. Also increases all stamina cost by 50%
- [x] Fixative: Fast attacks now use adrenaline instead of stamina and their damage now scales on your adrenaline levels. _Note that adrenaline ranges from 0 to 3, so at full adrenaline fast attacks deal 300% more damage than they normally do at full stamina.
- [x] Endure pain: As life goes down, resources consumption for aggressive actions is 50% more efficient but 50% less efficient for defensive actions.
- [x] Fast metabolism (toxicity drops faster): toxicity improves overall resource consumption by 0.01% per toxicity point per skill level. 90% at 300 toxicity with level 3 skill (which is the maximum for RPO)