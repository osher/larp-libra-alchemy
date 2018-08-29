module.exports = ({
  src,
  trg,
  fs = require('fs')
}) => {
    const sttmt = s => '\n\n' + s.replace(/\n        /gm, '\n');
    const type = t => Object.assign(t, {
      rows: [ sttmt( t.create ) ],
      toString: function() { return this.rows.join(';\n') }
    })
    const types = [{
      xInsert: /$^/, //match nothing
      create: (
        `-- clear old tables (if found)
        DROP TABLE IF EXISTS potion_effects, potion;
        DROP TABLE IF EXISTS special_To_effect, special;
        DROP TABLE IF EXISTS product_to_effect, antigen, product;
        DROP TABLE IF EXISTS effect, \`procedure\`, ingredient`
      )
    }, {
      create: (
        `-- table ingredient
        CREATE TABLE ingredient (
           id INT NOT NULL AUTO_INCREMENT,
           \`name\` NVARCHAR(100) NOT NULL,
           \`comment\` NVARCHAR(500),
           primary key (id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8`
      ),
      xInsert: /INSERT INTO \[?Ingredient\]? /,
      format: line => line.replace(/.* VALUES/, 'INSERT INTO `ingredient` VALUES')
    }, {
      create: (
        `-- table procedure
        CREATE TABLE \`procedure\` (
           id INT NOT NULL AUTO_INCREMENT ,
           \`name\` NVARCHAR(100) NOT NULL,
           \`comment\` NVARCHAR(500),
           primary key (id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8`
      ),
      xInsert: /INSERT INTO \[?Procedures\]? /,
      format: line => line.replace(/.* VALUES/, 'INSERT INTO `procedure` (id, `name`, `comment`) VALUES'),
    }, {
      create: (
        `-- table effect
        CREATE TABLE effect (
           id INT NOT NULL AUTO_INCREMENT ,
           \`name\` NVARCHAR(100) NOT NULL,
           power INT NOT NULL,
           commulative boolean NOT NULL,
           has_counter boolean NOT NULL,
           description NVARCHAR(500),
           \`comment\` NVARCHAR(500),
           primary key (id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8`
      ),
      xInsert: /INSERT INTO \[?Effects\]? \(/,
      format: line => line
        .replace(
          /.* VALUES/,
          'INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES'
        )
        .replace(/'(True|False)'/g, (_,b) => b)
    }, {
      create: (
        `-- table product
        CREATE TABLE product (
           id INT NOT NULL AUTO_INCREMENT ,
           ingredient_id INT NOT NULL,
           procedure_id INT NOT NULL,
           main_effect_id INT,
           \`comment\` NVARCHAR(500),
           primary key (id),
           CONSTRAINT fk_product_ingredient FOREIGN KEY (ingredient_id) REFERENCES ingredient (id),
           CONSTRAINT fk_product_procedure FOREIGN KEY (procedure_id) REFERENCES \`procedure\` (id),
           CONSTRAINT fk_product_main_effect FOREIGN KEY (main_effect_id) REFERENCES effect (id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8`
      ),
      xInsert: /INSERT INTO \[?Products\]? /,
      format: line => line.replace(/.* VALUES/, 'INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES')
    }, {
      create: (
        `-- table antigen
        CREATE TABLE antigen (
           effect_id INT NOT NULL,
           counter_id INT NOT NULL,
           CONSTRAINT PK_antigen PRIMARY KEY (effect_id, counter_id),
           CONSTRAINT FK_effect_1 FOREIGN KEY (effect_id) REFERENCES effect (id),
           CONSTRAINT FK_effect_2 FOREIGN KEY (counter_id) REFERENCES effect (id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8`
      ),
      xInsert: /INSERT INTO \[?Counters\]? /,
      format: line => line.replace(/.* VALUES/, 'INSERT INTO antigen (effect_id, counter_id) VALUES')
    }, {
      create: (
        `-- table product_to_effect
        CREATE TABLE product_to_effect(
           product_id INT NOT NULL,
           effect_id INT NOT NULL,
           CONSTRAINT fk_product_to_effect__product FOREIGN KEY (product_id) REFERENCES product (id),
           CONSTRAINT fk_product_to_effect__effect FOREIGN KEY (effect_id) REFERENCES effect (id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8`
      ),
      xInsert: /INSERT INTO \[?Products_To_Effects\]? /,
      format: line => line.replace(/.* VALUES/, 'INSERT INTO product_to_effect (product_id, effect_id) VALUES')
    }, {
      create: (
        `-- table special
        CREATE TABLE special (
           id INT NOT NULL AUTO_INCREMENT ,
           \`name\` NVARCHAR(100) NOT NULL,
           power INT NOT NULL,
           \`comment\` NVARCHAR(100),
           primary key (id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8`
      ),
      xInsert: /INSERT INTO \[?Specials\]? /,
      format: line => line.replace(/.* VALUES/, 'INSERT INTO special (id, `name`, power, `comment`) VALUES')
    }, {
      create: (
        `-- table special_to_effect
        CREATE TABLE special_to_effect (
           special_id INT,
           old_effect_id INT,
           new_effect_id INT,
           CONSTRAINT fk_special_to_effect__special FOREIGN KEY (special_id) REFERENCES special (id),
           CONSTRAINT fk_special_to_effect__old_effect FOREIGN KEY (old_effect_id) REFERENCES effect (id),
           CONSTRAINT fk_special_to_effect__new_effect FOREIGN KEY (new_effect_id) REFERENCES effect (id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8`
      ),
      xInsert: /INSERT INTO \[?Specials_To_Effects\]? /,
      format: line => line.replace(/.* VALUES/, 'INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES')
    }, {
      create: (
        `-- table potion
        CREATE TABLE potion (
         id INT NOT NULL AUTO_INCREMENT ,
         \`name\` NVARCHAR(100) NOT NULL,
         description NVARCHAR(500),
         \`creator_name\` NVARCHAR(100),
         primary key (id)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8`
      ),
      xInsert: /INSERT INTO \[?Potions\]? /,
      format: line => line.replace(/.* VALUES/, 'INSERT INTO potion (id, `name`, description, `creator_name`) VALUES')
    }, {
      create: (
        `-- table potion_effects
        CREATE TABLE potion_effects (
           potion_id INT,
           effect_id INT,
           effect_level INT,
           CONSTRAINT fk_potion_effects__potion_id FOREIGN KEY (potion_id)
              REFERENCES potion (id) ON DELETE CASCADE,
           CONSTRAINT fk_potion_effects__effect_id FOREIGN KEY (effect_id) REFERENCES effect (id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8`
      ),
      xInsert: /INSERT INTO \[?Potion_To_Effect\]? /,
      format: line => line.replace(/.* VALUES/, 'INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES')
    }].map(type);

    fs.readFileSync(src)
    .toString().split(';')
    .forEach(line => {
        types.some(type =>
          line.match(type.xInsert)
          && type.rows.push( type.format(line.trim()) )
        )
    });

    types.unshift
    types.push('\n\n');
    const txt = types.join(';\n');
    
    fs.writeFileSync(trg, txt);
    return txt
}