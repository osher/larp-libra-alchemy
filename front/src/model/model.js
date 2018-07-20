const {assign} = Object;
Number.is = v => v && 'number' == typeof v
assign(Array.prototype, {
  into(id, sep = '') { $e(id).innerHTML = this.join(sep) },
  first() { return this[0] },
  last() { return this[this.length -1] } 
});
//--- index -----------------------
function index({id = ({id}) => id, instantiate} = {}) {
  const all = [];
  const byId = {};

  if (instantiate) instantiate.find = (entity) => Number.is(entity) ? byId[entity] : entity;

  return assign(all, {
    byId: (id) => byId[id],
    add: (entity) => {
        if (entity) {
            const key = id(entity);
            const enlisted = byId[key];
            if (enlisted) all.rm(enlisted);
            all.push( byId[id(entity)] = entity );
        }
        return all;
    },
    rm: (entity) => { 
        const k = id(entity);
        if (!byId[k]) return; 
        byId[k] = null; 
        all.splice( all.indexOf(entity), 1 );
        return all;
    },
    fromIds: (arr) => arr.map(id => all.byId(id) || {id, notFound: true}),
    addEntity:
      instantiate
        ? (entity) => all.add(new instantiate(entity))
        : (entity) => all.add(entity),
    init: (arr) => arr.forEach(all.addEntity)
  })
}
//--- /index -----------------------
//--- namableIndex -----------------
function namableIndex(opts) {
    const {nameAttr = 'name'} = opts;
    const ix = index(opts);
    ix.byName = (phraze, top = 10) => {
        const startsWith = [];
        const includes = [];
        ix.some(entry => {
            const name = entry[nameAttr];
            if (name.startsWith(phraze)) startsWith.push(entry);
            else if (name.includes(phraze)) includes.push(entry);
            return startsWith.length >= top;
        })
        return startsWith.length >= top
          ? startsWith
          : startsWith.concat(
              includes.slice(0, top - startsWith.length)
            );
    };
    return ix;
}
//--- /namableIndex ----------------
//--- deferrable -------------------
function deferrable(EntityClass) {
    const deferred = new Map();
    return assign(EntityClass, {
      byIdAsync(id, fn) {
          const trg = EntityClass.all.byId(id);
          if (trg) return fn(trg);
          
          const stack = deferred.get(id);
          stack ? stack.push(fn) : deferred.set(id, [fn])
      },
      provide(instance, id = instance.id) {
          const stack = deferred.get(id);
          if (stack) {
              stack.forEach(fn => fn(instance));
              deferred.delete(id)
          }
      }
    })
};
//--- /deferrable ------------------
//--- Effect -----------------------
class Effect {
  constructor(id, precedence, name, descr, antigen) {
      if (Array.isArray(id)) return new Effect(...id);

      this.id = id;
      this.name = name;
      this.precedence = precedence;
      this.antigens = index();

      antigen.forEach(id =>
        Effect.byIdAsync(id, (antigen) =>
          this.antigens.add(antigen)
        )
      );
      Effect.provide(this);
  }
}
deferrable(Effect).all = namableIndex({instantiate: Effect})
//--- /Effect ----------------------
//--- SpecialIngredient ------------
class SpecialIngredient {
  constructor(id, precedence, name, description, alterations) {
      if (Array.isArray(id)) return new SpecialIngredient(...id);

      this.name = name;
      this.id = id;
      this.description = description;
      this.precedence = precedence;
      this.alterations = alterations; //maps id -> id
  }
}
SpecialIngredient.all = namableIndex({instantiate: SpecialIngredient})
//--- /SpecialIngredient -----------
//--- Ingredient -------------------
class Ingredient {
  constructor(id, name) {
      if (Array.isArray(id)) return new Ingredient(...id);

      this.id = id;
      this.name = name;
  }
};
Ingredient.all = namableIndex({instantiate: Ingredient})
//--- /Ingredient -------------------
//--- Procedure ---------------------
class Procedure {
  constructor(id, name) {
      if (Array.isArray(id)) return new Procedure(...id);

      this.id = id;
      this.name = name;
  }
};
Procedure.all = namableIndex({instantiate: Procedure});
//--- /Procedure --------------------
//--- Product -----------------------
class Product {
  constructor(id, ingredient, procedure, mainEffect, effects) {
      if (Array.isArray(id)) return new Product(...id);

      this.name = null;
      this.id = null;
      this.ingredient = Ingredient.all.byId(ingredient);
      this.procedure = Procedure.all.byId(procedure);
      this.mainEffect = Effect.all.byId(mainEffect);
      effects = effects.reduce((r,e) => { if (!r.ix[e]) { r.ix[e] = 1; r.l.push(e) }; return r}, {ix:{},l:[]}).l;
      this.effects = Effect.all.fromIds(effects);
     
      this.id = this.ingredient.id * 1e3 + this.procedure.id;
      this.name = `${this.procedure.name} של ${this.ingredient.name}`;
  }
}
Product.all = index({instantiate: Product});
Product.of = (ingr, proc) => {
    const [ingredient, procedure] = [Ingredient.find(ingr), Procedure.find(proc)];
    return Product.all.byId( ingredient.id * 1e3 + procedure.id )
}
//--- /Product ----------------------
//--- Potion ------------------------
class Potion {
  constructor(id, name, creator, description, ...effects) {
      if (Array.isArray(id)) return new Potion(...id);
    
      this.id = id;
      this.name = name;
      this.creator = creator;
      this.description = description;
      
      this.effects = effects.map( ([effect, level]) => {
          return { effect: Effect.all.byId(effect), level };
      }).sort((a,b) => b.level - a.level);
      
      this.ehash = Potion.appliedEffectsHash(this.effects);
      Potion.byEffectsHash.add(this);
  }
}
Potion.all = namableIndex({instantiate: Potion});
Potion.appliedEffectsHash = (effects) => effects
  .sort((a,b) => a.effect.id - b.effect.id)
  .map(({effect, level}) => effect.id + '/' + level)
  .join('.');
Potion.byEffectsHash = index({id: (p) => p.ehash})
Potion.similar = (appliedEffects) => {
    const conditionalPush = applied => {
        const hash = Potion.appliedEffectsHash(applied);
        const potion = Potion.byEffectsHash.byId(hash);
        if (potion) similar.add(potion);
    }
    const similar = index()
    conditionalPush(appliedEffects);
    const currentPotion = similar[0];
    
    appliedEffects = appliedEffects.slice(0,5);
    
    appliedEffects.forEach(({level, effect}) => {
        //check each time with removing one applied-effect
        const remaining = appliedEffects.filter(a => a.effect.id != effect.id)
        conditionalPush(remaining);

        permutateAddedTo(remaining);
    });

    if (appliedEffects.length < 5) permutateAddedTo(appliedEffects);

    console.log('יש שיקוי כזה: ', currentPotion || '-na-');
     
    similar.rm(currentPotion);
    return similar.concat();

    function permutateAddedTo(effects) {
        Effect.all.forEach(effect => {
            //check each time with adding one applied-effect
            let level = 16;
            while(--level > 0) {
                conditionalPush(effects.concat([{ effect, level }]));
            }
        });
    }
}
//--- /Potion ------------------------
//--- Receipt ------------------------
class Receipt {
  constructor() {
      this.products = [];
      this.specials = [];
      this.effects = null;
  }
  produce(ingr, proc) {
      this.products.push(Product.of(ingr, proc));
  }
  specialize(spec) {
      this.specials.push(SpecialIngredient.find(spec))
  }
}
//--- /Receipt -----------------------
//--- lab ----------------------------
const lab = {
  execute({products, specials}) {
      //gather base effects
      const base = lab.baseAppliedEffects(products);
      console.log(
        'בסיס:%s', base.map(({effect, by: {product}}) => 
          `\n - ${effect.name} מ - ${product.name}`
        ).join('')
      );
      
      //find strongest alterations
      const alterations = lab.strongestAlterations(specials);
      console.log(
        'החלפות מתבקשות:%s',
        alterations.map(({id, special}) =>
          `\n - ${special.name} - מסמן להחלפה את ${Effect.all.byId(id).name} ב - ${Effect.all.byId(special.alterations[id]).name}`
        ).join('')
      );
      //apply strongest alterations
      const altered = lab.applyAlterations({effects: base, alterations});
      console.log(
        'אחרי החלפות:%s',
        altered.map(({effect, by: {product, alterer}}) => 
          `\n - ${effect.name} מ - ${product.name}` + (alterer ? ` ==> הוחלף ע"י ${alterer.name}` : '')
        ).join('')
      );

      //apply antigens
      const reduced = lab.applyAntigens(altered);
      console.log(
        'אחרי ביטול השפעות:\n - %s',
        base.map(({effect, by: {product, alterer}}) => 
          `\n - ${effect.name} מ - ${product.name}` + (alterer ? ` ==> הוחלף ע"י ${alterer.name}` : '')
        ).join('')
      );
      
      //group by effect, count as level
      const leveled = lab.levels(reduced);
      console.log('תוצאת המתכון: %s',
        leveled.map(({effect, level}) => `\n - ${effect.name}, רמה ${level}`).join('')
      );
      return leveled
  },
  baseAppliedEffects: (products) => 
    products.reduce((pIx, product) => {
        const found = pIx.byId(product.id);
        found
          ? found.times++
          : pIx.add({id: product.id, name: product.name, product, times: 1});
        return pIx
    }, index())
    .reduce( (applied, {product, times}) => {;
        if (times == 1) {
            console.log('adding all from', product.name);
            applied.push( 
              ...product.effects.map((effect, ix) => ({effect, by: {product}}))
            );
        } else {
            console.log('adding twice main effect', product.name);
            applied.push({effect: product.mainEffect, by: {product}});
            applied.push({effect: product.mainEffect, by: {product}});
        }
        return applied
    }, [])
    .sort((a,b) => 
      a.by.product.id * 1000 + a.effect.id
      -
      b.by.product.id * 1000 - b.effect.id
    ),
  strongestAlterations: (specials) =>
    specials.reduce(
      (alterations, special) =>
        Object.keys(special.alterations).reduce(
          (alterations, originEffectId) => {
              const altaration = alterations.byId(originEffectId);
              //when no alteration found for the origin effect
              //OR found alteration is from a special of a lesser precedence
              return !altaration || alteration.special.precedence <= special.precedence
                ? alterations.add({
                    id: originEffectId,
                    source: Effect.find(originEffectId),
                    alt: Effect.find(special.alterations[originEffectId]),
                    special
                  })
                : alterations
          },
          alterations
        ),
      index()
    ),
  applyAlterations: ({effects, alterations, alteration}) =>
    effects.map( applied =>
      (alteration = alterations.byId(applied.effect.id))
        ? console.log('>>מחליף ל %s', alteration.alt.name) || 
          {//change applied entry, and remember the alterer too
            effect:  alteration.alt,
            by:      assign({}, applied.by, { alterer: alteration.special })
          }
        : applied
    ),
  applyAntigens: (effects) => {
      //find what effects are canceled, and how many times
      const dropped = effects.reduce(
        (dropped, applied) => {
            //for current effect:
            //  antigens that are in the potion and are canceled by the current effect
            //  take first by precedence
            const eliminate =
              effects
                .filter(({effect: antigen}) => applied.effect.antigens.byId(antigen.id))
                .sort((appliedA, appliedB) => appliedA.effect.precedence - appliedB.effect.precedence)
                .first();

            if (!eliminate) {
                console.log(`${applied.effect.name} לא נוגד דבר בהרכב זה`);
                return dropped
            };
            
            console.log(`${applied.effect.name}  נוגד את ${eliminate.effect.name}`);

            let elimination = dropped.byId(eliminate.effect.id);
            elimination
              ? elimination.eliminators.push(applied.effect)
              : dropped.add(elimination = {id: eliminate.effect.id, effect: eliminate, eliminators: [applied.effect]});

            console.log(`${applied.effect.name} מעלה התנגדות ל ${elimination.effect.effect.name} ל -  ${elimination.eliminators.length}`);
            return dropped
        },
        index()
      );
      console.log(
        'תחזית ביטולים:%s\n\nביצוע:',
        dropped.map(({effect, eliminators}) =>
          `\n - ${effect.effect.name} - מבוטל על ידי: ${eliminators.map(({name}) => name)}`
        ).join('')
      );
      return effects.filter(({effect}) => {
          const elimination = dropped.byId(effect.id);
          if (!elimination) return true;
          const eliminator = elimination.eliminators.pop();
          if (eliminator) console.log(`   ${effect.name} - מבוטל על ידי - ${eliminator.name}`);
          return eliminator ? false : true
      });
  },
  levels: (effects) =>
    effects.reduce(
      (grouped, {effect}) => {
          const {level = -1} = grouped.byId( effect.id ) || {};
          return grouped.add({
            effect,
            level: level + 1
          })
      },
      index({id: e => e.effect.id})
    )
    .sort((a, b) => b.level - a.level)
    .filter(({level}) => level )
};
//--- /lab ---------------------------