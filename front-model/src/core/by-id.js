//--- by-id ------------------------
export default function byId({id = ({id}) => id, instantiate} = {}) {
  const {assign} = Object;
  const all = [];
  const byId = {};

  if (instantiate) instantiate.find = (entity) => entity instanceof instantiate ? entity : byId[entity];

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
//--- /by-id -----------------------