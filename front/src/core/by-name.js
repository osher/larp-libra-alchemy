//--- ix-by-name -------------------
import byId from './by-id';
export default function ixByName(opts) {
    const {nameAttr = 'name'} = opts;
    const ix = byId(opts);
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
//--- /ix-by-name ------------------
