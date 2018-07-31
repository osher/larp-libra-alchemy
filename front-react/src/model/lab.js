import Effect from "./effect";
import index from "../core/by-id";

const assign = Object.assign;
const lab = {
  execute({ products, specials }) {
    //gather base effects
    const base = lab.baseAppliedEffects(products);
    console.log(
      "בסיס:%s",
      base
        .map(
          ({ effect, by: { product } }) =>
            `\n - ${effect.name} מ - ${product.name}`
        )
        .join("")
    );

    //find strongest alterations
    const alterations = lab.strongestAlterations(specials);
    console.log(
      "החלפות מתבקשות:%s",
      alterations
        .map(
          ({ id, special }) =>
            `\n - ${special.name} - מסמן להחלפה את ${
              Effect.all.byId(id).name
            } ב - ${Effect.all.byId(special.alterations[id]).name}`
        )
        .join("")
    );
    //apply strongest alterations
    const altered = lab.applyAlterations({ effects: base, alterations });
    console.log(
      "אחרי החלפות:%s",
      altered
        .map(
          ({ effect, by: { product, alterer } }) =>
            `\n - ${effect.name} מ - ${product.name}` +
            (alterer ? ` ==> הוחלף ע"י ${alterer.name}` : "")
        )
        .join("")
    );

    //apply antigens
    const reduced = lab.applyAntigens(altered);
    console.log(
      "אחרי ביטול השפעות:\n - %s",
      base
        .map(
          ({ effect, by: { product, alterer } }) =>
            `\n - ${effect.name} מ - ${product.name}` +
            (alterer ? ` ==> הוחלף ע"י ${alterer.name}` : "")
        )
        .join("")
    );

    //group by effect, count as level
    const leveled = lab.levels(reduced);
    console.log(
      "תוצאת המתכון: %s",
      leveled
        .map(({ effect, level }) => `\n - ${effect.name}, רמה ${level}`)
        .join("")
    );
    return leveled;
  },
  baseAppliedEffects: products =>
    products
      .reduce((pIx, product) => {
        const found = pIx.byId(product.id);
        found
          ? found.times++
          : pIx.add({ id: product.id, name: product.name, product, times: 1 });
        return pIx;
      }, index())
      .reduce((applied, { product, times }) => {
        if (times == 1) {
          console.log("adding all from", product.name);
          applied.push(
            ...product.effects.map((effect, ix) => ({
              effect,
              by: { product }
            }))
          );
        } else {
          console.log("adding twice main effect", product.name);
          applied.push({ effect: product.mainEffect, by: { product } });
          applied.push({ effect: product.mainEffect, by: { product } });
        }
        return applied;
      }, [])
      .sort(
        (a, b) =>
          a.by.product.id * 1000 +
          a.effect.id -
          b.by.product.id * 1000 -
          b.effect.id
      ),
  strongestAlterations: specials =>
    specials.reduce(
      (alterations, special) =>
        Object.keys(special.alterations).reduce(
          (alterations, originEffectId) => {
            const altaration = alterations.byId(originEffectId);
            //when no alteration found for the origin effect
            //OR found alteration is from a special of a lesser precedence
            return !altaration ||
              alteration.special.precedence <= special.precedence
              ? alterations.add({
                  id: originEffectId,
                  source: Effect.find(originEffectId),
                  alt: Effect.find(special.alterations[originEffectId]),
                  special
                })
              : alterations;
          },
          alterations
        ),
      index()
    ),
  applyAlterations: ({ effects, alterations, alteration }) =>
    effects.map(
      applied =>
        (alteration = alterations.byId(applied.effect.id))
          ? console.log(">>מחליף ל %s", alteration.alt.name) || {
              //change applied entry, and remember the alterer too
              effect: alteration.alt,
              by: assign({}, applied.by, { alterer: alteration.special })
            }
          : applied
    ),
  applyAntigens: effects => {
    //find what effects are canceled, and how many times
    const dropped = effects.reduce((dropped, applied) => {
      //for current effect:
      //  antigens that are in the potion and are canceled by the current effect
      //  take first by precedence
      const eliminate = effects
        .filter(({ effect: antigen }) =>
          applied.effect.antigens.byId(antigen.id)
        )
        .sort(
          (appliedA, appliedB) =>
            appliedA.effect.precedence - appliedB.effect.precedence
        )
        .first();

      if (!eliminate) {
        console.log(`${applied.effect.name} לא נוגד דבר בהרכב זה`);
        return dropped;
      }

      console.log(`${applied.effect.name}  נוגד את ${eliminate.effect.name}`);

      let elimination = dropped.byId(eliminate.effect.id);
      elimination
        ? elimination.eliminators.push(applied.effect)
        : dropped.add(
            (elimination = {
              id: eliminate.effect.id,
              effect: eliminate,
              eliminators: [applied.effect]
            })
          );

      console.log(
        `${applied.effect.name} מעלה התנגדות ל ${
          elimination.effect.effect.name
        } ל -  ${elimination.eliminators.length}`
      );
      return dropped;
    }, index());
    console.log(
      "תחזית ביטולים:%s\n\nביצוע:",
      dropped
        .map(
          ({ effect, eliminators }) =>
            `\n - ${effect.effect.name} - מבוטל על ידי: ${eliminators.map(
              ({ name }) => name
            )}`
        )
        .join("")
    );
    return effects.filter(({ effect }) => {
      const elimination = dropped.byId(effect.id);
      if (!elimination) return true;
      const eliminator = elimination.eliminators.pop();
      if (eliminator)
        console.log(`   ${effect.name} - מבוטל על ידי - ${eliminator.name}`);
      return eliminator ? false : true;
    });
  },
  levels: effects =>
    effects
      .reduce((grouped, { effect }) => {
        const { level = -1 } = grouped.byId(effect.id) || {};
        return grouped.add({
          effect,
          level: level + 1
        });
      }, index({ id: e => e.effect.id }))
      .sort((a, b) => b.level - a.level)
      .filter(({ level }) => level)
};

export default lab;
