//--- deferrable -------------------
const assign = Object.assign;
export default function deferrable(EntityClass) {
  const deferred = new Map();
  return assign(EntityClass, {
    byIdAsync(id, fn) {
      const trg = EntityClass.all.byId(id);
      if (trg) return fn(trg);

      const stack = deferred.get(id);
      stack ? stack.push(fn) : deferred.set(id, [fn]);
    },
    provide(instance, id = instance.id) {
      const stack = deferred.get(id);
      if (stack) {
        stack.forEach(fn => fn(instance));
        deferred.delete(id);
      }
    }
  });
}
//--- /deferrable ------------------
