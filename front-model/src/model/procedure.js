//--- Procedure ---------------------
import byName from '../core/by-name';
export default class Procedure {
  constructor(id, name) {
      if (Array.isArray(id)) return new Procedure(...id);

      this.type = 'p';
      this.id = id;
      this.name = name;
  }
};
Procedure.all = byName({instantiate: Procedure});
//--- /Procedure --------------------