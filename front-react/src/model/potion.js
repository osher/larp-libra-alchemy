//--- Potion ------------------------
import byName from "../core/by-name";
import index from "../core/by-id";
import Effect from "./effect";

export default class Potion {
  constructor(id, name, creator, description, ...effects) {
    if (Array.isArray(id)) return new Potion(...id);

    this.id = id;
    this.name = name;
    this.creator = creator;
    this.description = description;

    this.effects = effects
      .map(([effect, level]) => {
        return { effect: Effect.all.byId(effect), level };
      })
      .sort((a, b) => b.level - a.level);

    this.ehash = Potion.appliedEffectsHash(this.effects);
    Potion.byEffectsHash.add(this);
  }
}
Potion.all = byName({ instantiate: Potion });
Potion.appliedEffectsHash = effects =>
  effects
    .sort((a, b) => a.effect.id - b.effect.id)
    .map(({ effect, level }) => effect.id + "/" + level)
    .join(".");
Potion.byEffectsHash = index({ id: p => p.ehash });
Potion.similar = appliedEffects => {
  const conditionalPush = applied => {
    const hash = Potion.appliedEffectsHash(applied);
    const potion = Potion.byEffectsHash.byId(hash);
    if (potion) similar.add(potion);
  };
  const similar = index();
  conditionalPush(appliedEffects);
  const currentPotion = similar[0];

  appliedEffects = appliedEffects.slice(0, 5);

  appliedEffects.forEach(({ level, effect }) => {
    //check each time with removing one applied-effect
    const remaining = appliedEffects.filter(a => a.effect.id !== effect.id);
    conditionalPush(remaining);

    permutateAddedTo(remaining);
  });

  if (appliedEffects.length < 5) permutateAddedTo(appliedEffects);

  console.log("יש שיקוי כזה: ", currentPotion || "-na-");

  similar.rm(currentPotion);
  return similar.concat();

  function permutateAddedTo(effects) {
    Effect.all.forEach(effect => {
      //check each time with adding one applied-effect
      let level = 16;
      while (--level > 0) {
        conditionalPush(effects.concat([{ effect, level }]));
      }
    });
  }
};
//--- /Potion ------------------------
