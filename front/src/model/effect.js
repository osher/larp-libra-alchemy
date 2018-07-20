//--- Effect -----------------------
import byName from '../core/by-name';
import deferrable from '../core/deferrable';
export default class Effect {
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
deferrable(Effect).all = byName({instantiate: Effect})
//--- /Effect ----------------------
