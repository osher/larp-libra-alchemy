-- table antigen

CREATE TABLE ingredient
(
   id INT NOT NULL AUTO_INCREMENT,
   `name` NVARCHAR(100) NOT NULL,
   `comment` NVARCHAR(500),
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO ingredient (id, `name`, `comment`) VALUES (1, 'תפרחת צל לילה', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (2, 'פטריות רעל', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (3, 'פקעת שושנה מדברית', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (4, 'עלי אלמוות הכסף', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (5, 'אצות מהביצות', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (6, 'לוטוס נהרות', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (7, 'קליפת אורן אדום', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (8, 'פחם', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (9, 'מלח', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (10, 'חוטר קקטוס סלמנדרה', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (11, 'שורש הברק', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (12, 'שרף עץ דבש', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (13, 'ניבי צפע חברבורות', '');
INSERT INTO ingredient (id, `name`, `comment`) VALUES (14, 'רעל של נחש מעמקים', '');


CREATE TABLE `procedure`
(
   id INT NOT NULL AUTO_INCREMENT ,
   `name` NVARCHAR(100) NOT NULL,
   `comment` NVARCHAR(500),
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `procedure` (id, `name`, `comment`) VALUES (1, 'בישול', '');
INSERT INTO `procedure` (id, `name`, `comment`) VALUES (2, 'זיקוק', '');
INSERT INTO `procedure` (id, `name`, `comment`) VALUES (3, 'ייבוש וכתישה', '');
INSERT INTO `procedure` (id, `name`, `comment`) VALUES (4, 'חליטה', '');
INSERT INTO `procedure` (id, `name`, `comment`) VALUES (5, 'החמצה', '');
INSERT INTO `procedure` (id, `name`, `comment`) VALUES (6, 'השקעה', '');
INSERT INTO `procedure` (id, `name`, `comment`) VALUES (7, 'התססה', '');
INSERT INTO `procedure` (id, `name`, `comment`) VALUES (8, 'שריפה', '');

CREATE TABLE effect
(
   id INT NOT NULL AUTO_INCREMENT ,
   `name` NVARCHAR(100) NOT NULL,
   power INT NOT NULL,
   commulative boolean NOT NULL,
   has_counter boolean NOT NULL,
   description NVARCHAR(500),
   `comment` NVARCHAR(500),
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (12, 'מאזן נפשית', 3, True, True, 'מרגיעה נפשית, מתנגד להשפעות נפשיות מסויימות', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (13, 'בלבול', 5, True, True, 'בלבול מנטלי, חומר כיוון, מחשבות מבולבלות. מוריד סף להשפעה חיצונית', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (14, 'אובססיביות', 6, False, True, 'גורם לאובססיה לגבי אנשים, חפצים או דברים כלליים', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (15, 'מבטל עכבות', 7, True, True, 'מוריד חסמים נפשיים של הדמות מלעשות פעולות. המושפע יפעל ללא מעצורים תרבותיים אך לא בהכרח יהיה מושפע מאחרים', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (16, 'העלאת ביטחון עצמי', 44, True, True, 'גורם לדמות להיות בעלת בטחון עצמי גבוה ולעשות דברים ללא מחשבה רבה', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (17, 'נוח להשפעה', 8, True, True, 'המושפע הופך לנוח להשפעה בידי אחרים', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (18, 'שכחה', 9, True, False, 'המושפע ישכח חלק מסוים במאורעות', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (19, 'הרגעה פיזית', 10, True, True, 'מרגיעה פציעות פיזיות או השפעות פיזיות מסויימות', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (20, 'עיוורון', 11, True, False, 'גורם לפגיעה בחוש הראיה', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (21, 'גירוד', 12, True, True, 'הדמות תחל להתגרד באופן בלתי נשלט', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (22, 'שיתוק', 13, True, True, 'גורם לשיתוק פיזי', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (23, 'ממריץ', 14, True, True, 'גורם להמרצה פיזית של הדמות, אנרגטיות רבה', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (24, 'הרדמה', 15, True, True, 'גורם לעייפות פיזית אצל הדמות ורצון לשינה', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (25, 'השפעה על חיות', 19, True, False, 'גורם לשיקוי להשפיע על חיות באופן ברור יותר או על עור', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (26, 'השפעה על מתכות', 16, True, False, 'על פי תכונות השיקוי מחזק מתכת או פוגע בה', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (27, 'השפעה על צמחים', 17, True, False, 'לפי תכונות השיקוי הורג צמחיה או עוזר לה', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (28, 'חימום', 24, True, True, 'חימום של חומרים, חפצים וגורמים חיים', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (29, 'קירור', 25, True, True, 'הקפאה וקירור של חומרים שנוגע בהם (מקפיא שחקנים במקום, מקרר צמחים, גורם לצמרמורות וכד'')', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (30, 'ממכר', 26, True, True, 'גורם להתמכרות', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (31, 'מחליש', 37, True, True, 'החלשה פיזי או נפשי של הדמות או החפץ', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (32, 'רעיל', 2, True, True, 'השיקוי רעיל ועלול להרוג', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (33, 'נוגד רעלים', 1, True, True, 'השיקוי נוגד רעלים', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (34, 'דליק', 46, True, True, 'החומר דליק/נפיץ במיוחד', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (35, 'חומציות', 41, True, True, 'החומר הוא חומצי. מלבין חומרים, גורם לצריבה על העור ואף יכול להפוך לחומצה חזקה ולהמיס דברים', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (36, 'מחטא', 42, True, False, 'השיקוי מסוגל לחטא פצעים', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (37, 'מזרז החלמה', 43, True, True, 'גורם להחלמה הטבעית של הגוף להתגבר בקצב שלה', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (38, 'מתמשך', 45, True, True, 'תופעות השיקוי מתמשכות', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (39, 'מעכב החלמה', 47, True, True, 'מעכב את ההחלמה הטבעית של הגוף', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (40, 'רגשיות', 34, True, True, 'גורם לרגשיות חזקה אצל האדם', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (41, 'בחילה', 48, True, True, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (42, 'אגרסיביות', 27, True, True, 'גורם לאגרסיביות אצל אנשים ודברים חיים', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (43, 'איטיות מחשבה', 49, False, False, 'איטיות של תהליכים מחשבתיים. מוריד סף להשפעה חיצונית', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (44, 'הזיות', 50, True, True, 'הזיות בדרגות שונות', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (45, 'השפעה על אלמנטים', 23, True, False, 'השיקוי משפיע על אלמטים - אש, אויר וכד''', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (46, 'השפעה על מינראלים', 18, True, False, 'השיקוי משפיע על מינראלים (מפורר, מחזק אבנים וכד'') על פי תכונות', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (47, 'זמן', 68, True, False, 'גורם לשינויים שקשורים לזמן - מזקן, מצעיר, גורם לריקבון, גורם לאוכל להישאר טוב יותר זמן וכד''', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (48, 'חוסר שליטה', 51, True, False, 'הדמות מתקשה לשלוט על הפעולות. מקל על שליטה על ידי אחרים אך פחות מ"נוח להשפעה"', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (49, 'חיבור קוסמי', 63, True, True, 'גורם לחומר להיות מקושר למאגר הקסם העולמי', 'ידע מאסטרים');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (50, 'טרנספורמציה', 61, True, False, 'משנה את האופי של מקבל השיקוי באופן מהותי - אפשר להוסיף חומר נוסף', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (51, 'יובש', 52, True, False, 'גורם להתייבשות ולהשפעות הנלוות ממנה', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (52, 'כאב', 53, True, False, 'גורם לכאב אצל הדמות', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (53, 'מגדיל', 54, True, True, 'מגדיל את מה ששמים עליו את השיקוי', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (54, 'מחזק', 40, True, True, 'חיזוק פיזי או נפשי של הדמות או החפץ', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (55, 'מנטרל קסם', 64, True, True, 'מנטרל השפעות של קסם', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (56, 'מקטין', 55, True, True, 'מקטין את מה ששמים עליו את השיקוי', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (57, 'מתגבר', 56, True, True, 'גורם לתגובה מועצמת של חלק ממאפיני השיקוי לאורך זמן. ככל שעובר יותר זמן ההשפעות מתחזקות', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (58, 'קשיי נשימה', 58, True, False, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (59, 'רעידות', 59, True, True, 'גורם לרעידות', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (60, 'שובע', 60, True, False, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (61, 'שלשולים', 69, True, True, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (62, 'שמנוני', 57, True, False, 'החומר הוא שמנוני באופי שלו. גורם לחומר להישאר על הגוף לאחר השימוש', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (63, 'פחד', 33, True, True, 'גורם לפחד אז אצל הדמות (היסטריה)', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (64, 'חרדה', 32, True, False, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (65, 'דיכאון', 30, True, False, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (66, 'שנאה', 31, True, False, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (67, 'אהבה', 28, True, False, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (68, 'השפעה על אש', 21, True, False, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (69, 'השפעה על אויר', 22, True, False, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (70, 'השפעה על נוזלים', 20, True, False, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (71, 'שמחה', 29, True, False, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (72, 'מחליש פיזית', 35, True, True, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (73, 'מחליש נפשית', 36, True, True, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (74, 'מחזק פיזית', 38, True, True, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (75, 'מחזק נפשית', 39, True, True, '', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (76, 'מצעיר', 65, True, False, 'גורם לדמות להיות צעירה יותר - זמן מוגבל', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (77, 'מזקן', 66, True, False, 'גורם לדמות להיות זקנה יותר - זמן מוגבל', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (78, 'זליגת חושים (סינסתזיה)', 4, True, False, 'חושים מתבלבלים - שמיעה הופכת לריח וכד''.', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (79, 'השהיית השפעות', 70, True, True, 'השיקוי פועל בקצב איטי מכרגיל ולהשפעה שלו לוקח זמן רב יותר להתחיל לפעול', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (80, 'הרגעת חומר', 71, True, True, 'גורם לחומר להיות פסיבי יותר בתגובות שלו (לא מחליש אותן). מתנגד לדליק וחומציות', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (81, '- פיצוץ -', 86, False, False, 'השיקוי שההשפעה הזאת נמצאת בתוכו מתפוצץ!', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (82, '- נעול -', 72, False, False, 'השילוב הזה נעול במשחק הנוכחי', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (83, '- לא פעיל -', 73, False, False, 'לשילוב הזה אין השפעה על השיקוי', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (84, 'איבוד אוריינטציית זמן', 67, True, False, 'האדם לא מצליח להחליט אם הוא בעבר בהווה או בעתיד', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (85, 'חיבור קוסמי - חיים', 62, True, False, 'מחבר את הדמות למעגל הקסם הבסיסי של החיים.', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (86, 'משקל', 74, True, False, 'גורם לשינוי במשקל של החומר עצמו, החומר שבו נוגע השיקוי או הדמות ששותה את השיקוי', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (87, 'ספיגה', 75, True, False, 'גורם לחומר לספוג חומרים אחרים או הליספג בקלות בחומרים אחרים', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (88, 'כבדות', 76, True, False, 'הגורם נהיה כבד יותר. הן משקלית והן בהרגשה', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (89, 'קלילות', 78, True, False, 'הגורם נהיה קל יותר. הן במשקל והן בהרגשה', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (90, 'השפעה על דם', 79, True, False, 'השיקוי ישפיע על דם', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (91, 'רעיל לבני אדם בלבד', 77, True, False, 'כולל אלפים אפלים', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (92, 'רעיל לאלפים בלבד', 80, True, False, 'אלפים רמים, יער, ים ואנשי לטאה', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (93, 'רעיל לבטאל בלבד (שייף + לונג שה)', 81, True, False, 'שייף + לונג שה', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (94, 'טרנספורמציה לאדם', 82, True, False, 'נותן תכונות ומאפיינים של בן אדם לפי עוצמה.', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (95, 'טרנספורמציה לאלף', 83, True, False, 'נותן תכונות ומאפיינים של אלף לפי עוצמה.', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (96, 'טרנספורמציה לבטאל', 84, True, False, 'נותן תכונות ומאפיינים של בטאל לפי עוצמה (כמו התחלת קרניים).', '');
INSERT INTO effect (id, `name`, power, commulative, has_counter, description, `comment`) VALUES (97, 'ממתן התמכרות', 85, True, True, 'ממתן את ההשפעה של התמכרות, משהה את פעילות ואף מבטל אותה קליל', '');

CREATE TABLE product
(
   id INT NOT NULL AUTO_INCREMENT ,
   ingredient_id INT NOT NULL,
   procedure_id INT NOT NULL,
   main_effect_id INT,
   `comment` NVARCHAR(500),
   primary key (id),
   CONSTRAINT fk_product_ingredient FOREIGN KEY (ingredient_id) REFERENCES ingredient (id),
   CONSTRAINT fk_product_procedure FOREIGN KEY (procedure_id) REFERENCES `procedure` (id),
   CONSTRAINT fk_product_main_effect FOREIGN KEY (main_effect_id) REFERENCES effect (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (7, 1, 1, '', 83);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (8, 1, 2, '', 18);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (9, 2, 1, '', 48);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (10, 2, 2, '', 28);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (11, 3, 1, '', 43);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (12, 3, 2, '', 42);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (13, 4, 1, '', 54);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (14, 4, 2, '', 79);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (15, 8, 1, '', 62);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (16, 8, 4, '', 58);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (17, 6, 1, '', 12);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (18, 9, 1, '', 35);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (19, 6, 2, '', 13);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (20, 10, 1, '', 28);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (21, 11, 1, '', 41);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (22, 8, 8, '', 33);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (23, 4, 4, '', 35);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (24, 6, 4, '', 36);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (25, 10, 8, '', 24);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (26, 3, 4, '', 19);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (27, 1, 4, '', 48);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (28, 9, 4, '', 43);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (29, 12, 8, '', 26);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (30, 5, 4, '', 30);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (31, 14, 1, '', 34);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (32, 5, 8, '', 44);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (33, 14, 8, '', 18);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (34, 4, 8, '', 32);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (35, 6, 8, '', 21);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (36, 13, 8, '', 55);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (37, 1, 8, '', 17);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (38, 3, 8, '', 27);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (39, 7, 1, '', 29);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (40, 7, 3, '', 40);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (41, 1, 3, '', 19);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (42, 12, 5, '', 34);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (43, 4, 6, '', 55);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (44, 2, 5, '', 39);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (45, 2, 8, '', 32);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (46, 13, 5, '', 22);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (47, 11, 5, '', 23);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (48, 1, 7, '', 19);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (49, 1, 5, '', 14);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (50, 12, 2, '', 39);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (51, 6, 6, '', 33);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (52, 6, 7, '', 37);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (53, 14, 5, '', 33);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (54, 3, 7, '', 83);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (55, 5, 2, '', 31);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (56, 14, 6, '', 18);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (57, 11, 6, '', 29);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (58, 13, 4, '', 38);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (59, 11, 2, '', 22);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (60, 6, 5, '', 81);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (61, 6, 3, '', 41);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (62, 5, 1, '', 82);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (63, 5, 5, '', 80);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (64, 5, 6, '', 14);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (65, 5, 7, '', 80);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (66, 5, 3, '', 38);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (67, 1, 6, '', 81);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (68, 2, 3, '', 53);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (69, 2, 4, '', 36);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (70, 2, 6, '', 83);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (71, 2, 7, '', 81);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (72, 3, 5, '', 83);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (73, 3, 6, '', 26);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (74, 3, 3, '', 51);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (75, 4, 3, '', 83);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (76, 4, 5, '', 60);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (77, 4, 7, '', 47);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (78, 7, 8, '', 83);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (79, 7, 4, '', 83);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (80, 7, 2, '', 20);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (81, 7, 5, '', 59);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (82, 7, 6, '', 45);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (83, 8, 2, '', 83);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (84, 8, 3, '', 34);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (85, 8, 5, '', 23);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (86, 8, 6, '', 81);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (87, 8, 7, '', 82);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (88, 9, 2, '', 81);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (89, 9, 3, '', 36);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (90, 9, 5, '', 82);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (91, 9, 6, '', 86);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (92, 9, 7, '', 15);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (93, 9, 8, '', 83);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (94, 10, 7, '', 46);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (95, 10, 6, '', 24);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (96, 10, 5, '', 25);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (97, 10, 4, '', 28);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (98, 10, 3, '', 45);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (99, 10, 2, '', 87);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (100, 11, 3, '', 30);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (101, 11, 4, '', 81);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (102, 11, 7, '', 45);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (103, 11, 8, '', 81);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (104, 12, 7, '', 82);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (105, 12, 6, '', 22);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (106, 12, 4, '', 82);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (107, 12, 3, '', 82);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (108, 12, 1, '', 81);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (109, 13, 1, '', 82);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (110, 13, 2, '', 31);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (111, 13, 3, '', 81);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (112, 13, 6, '', 22);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (113, 13, 7, '', 83);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (114, 14, 7, '', 53);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (115, 14, 4, '', 50);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (116, 14, 3, '', 34);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (117, 14, 2, '', 37);
INSERT INTO product (id, ingredient_id, `Procedure_id`, `comment`, main_effect_id) VALUES (118, 7, 7, '', 46);


CREATE TABLE antigen
(
   effect_id INT NOT NULL,
   counter_id INT NOT NULL,
   CONSTRAINT fk_effect_1 FOREIGN KEY (effect_id) REFERENCES effect (id),
   CONSTRAINT fk_effect_2 FOREIGN KEY (counter_id) REFERENCES effect (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO antigen (effect_id, counter_id) VALUES (12, 13);
INSERT INTO antigen (effect_id, counter_id) VALUES (13, 12);
INSERT INTO antigen (effect_id, counter_id) VALUES (54, 31);
INSERT INTO antigen (effect_id, counter_id) VALUES (31, 54);
INSERT INTO antigen (effect_id, counter_id) VALUES (24, 23);
INSERT INTO antigen (effect_id, counter_id) VALUES (23, 24);
INSERT INTO antigen (effect_id, counter_id) VALUES (28, 29);
INSERT INTO antigen (effect_id, counter_id) VALUES (29, 28);
INSERT INTO antigen (effect_id, counter_id) VALUES (31, 75);
INSERT INTO antigen (effect_id, counter_id) VALUES (75, 31);
INSERT INTO antigen (effect_id, counter_id) VALUES (32, 33);
INSERT INTO antigen (effect_id, counter_id) VALUES (33, 32);
INSERT INTO antigen (effect_id, counter_id) VALUES (37, 39);
INSERT INTO antigen (effect_id, counter_id) VALUES (39, 37);
INSERT INTO antigen (effect_id, counter_id) VALUES (12, 40);
INSERT INTO antigen (effect_id, counter_id) VALUES (40, 12);
INSERT INTO antigen (effect_id, counter_id) VALUES (12, 17);
INSERT INTO antigen (effect_id, counter_id) VALUES (17, 12);
INSERT INTO antigen (effect_id, counter_id) VALUES (12, 15);
INSERT INTO antigen (effect_id, counter_id) VALUES (15, 12);
INSERT INTO antigen (effect_id, counter_id) VALUES (12, 44);
INSERT INTO antigen (effect_id, counter_id) VALUES (44, 12);
INSERT INTO antigen (effect_id, counter_id) VALUES (54, 73);
INSERT INTO antigen (effect_id, counter_id) VALUES (73, 54);
INSERT INTO antigen (effect_id, counter_id) VALUES (12, 14);
INSERT INTO antigen (effect_id, counter_id) VALUES (14, 12);
INSERT INTO antigen (effect_id, counter_id) VALUES (12, 42);
INSERT INTO antigen (effect_id, counter_id) VALUES (42, 12);
INSERT INTO antigen (effect_id, counter_id) VALUES (19, 41);
INSERT INTO antigen (effect_id, counter_id) VALUES (41, 19);
INSERT INTO antigen (effect_id, counter_id) VALUES (19, 21);
INSERT INTO antigen (effect_id, counter_id) VALUES (21, 19);
INSERT INTO antigen (effect_id, counter_id) VALUES (54, 72);
INSERT INTO antigen (effect_id, counter_id) VALUES (72, 54);
INSERT INTO antigen (effect_id, counter_id) VALUES (19, 59);
INSERT INTO antigen (effect_id, counter_id) VALUES (59, 19);
INSERT INTO antigen (effect_id, counter_id) VALUES (19, 22);
INSERT INTO antigen (effect_id, counter_id) VALUES (22, 19);
INSERT INTO antigen (effect_id, counter_id) VALUES (19, 61);
INSERT INTO antigen (effect_id, counter_id) VALUES (61, 19);
INSERT INTO antigen (effect_id, counter_id) VALUES (49, 55);
INSERT INTO antigen (effect_id, counter_id) VALUES (55, 49);
INSERT INTO antigen (effect_id, counter_id) VALUES (63, 16);
INSERT INTO antigen (effect_id, counter_id) VALUES (16, 63);
INSERT INTO antigen (effect_id, counter_id) VALUES (31, 74);
INSERT INTO antigen (effect_id, counter_id) VALUES (74, 31);
INSERT INTO antigen (effect_id, counter_id) VALUES (79, 57);
INSERT INTO antigen (effect_id, counter_id) VALUES (57, 79);
INSERT INTO antigen (effect_id, counter_id) VALUES (79, 38);
INSERT INTO antigen (effect_id, counter_id) VALUES (38, 79);
INSERT INTO antigen (effect_id, counter_id) VALUES (80, 35);
INSERT INTO antigen (effect_id, counter_id) VALUES (35, 80);
INSERT INTO antigen (effect_id, counter_id) VALUES (80, 34);
INSERT INTO antigen (effect_id, counter_id) VALUES (34, 80);
INSERT INTO antigen (effect_id, counter_id) VALUES (53, 56);
INSERT INTO antigen (effect_id, counter_id) VALUES (56, 53);
INSERT INTO antigen (effect_id, counter_id) VALUES (97, 30);
INSERT INTO antigen (effect_id, counter_id) VALUES (30, 97);


CREATE TABLE product_to_effect
(
   product_id INT NOT NULL,
   effect_id INT NOT NULL,
   CONSTRAINT fk_product_to_effect__product FOREIGN KEY (product_id) REFERENCES product (id),
   CONSTRAINT fk_product_to_effect__effect FOREIGN KEY (effect_id) REFERENCES effect (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO product_to_effect (product_id, effect_id) VALUES (118, 45);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (15, 19);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (15, 23);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (15, 51);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (15, 42);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (15, 13);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (22, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (22, 34);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (22, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (22, 19);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (9, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (9, 39);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (9, 30);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (9, 48);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (9, 15);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (34, 40);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (10, 39);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (10, 28);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (10, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (10, 21);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (10, 20);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (10, 14);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (10, 13);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (22, 20);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (17, 12);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (17, 16);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (17, 18);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (17, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (17, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (18, 42);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (18, 15);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (18, 13);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (18, 35);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (18, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (24, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (24, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (24, 35);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (24, 43);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (24, 40);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (20, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (20, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (20, 34);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (20, 46);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (20, 28);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (21, 41);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (21, 52);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (21, 24);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (21, 39);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (21, 34);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (23, 50);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (23, 47);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (23, 55);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (23, 35);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (23, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (25, 24);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (25, 58);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (25, 60);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (25, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (25, 39);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (26, 19);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (26, 51);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (26, 20);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (26, 43);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (26, 42);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (27, 19);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (27, 51);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (27, 58);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (27, 12);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (27, 48);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (27, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (28, 35);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (28, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (28, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (28, 12);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (28, 43);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (29, 22);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (29, 59);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (29, 23);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (29, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (29, 38);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (29, 26);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (30, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (30, 30);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (30, 38);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (30, 50);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (30, 54);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (31, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (31, 34);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (31, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (31, 54);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (31, 49);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (32, 14);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (32, 16);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (32, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (32, 49);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (32, 56);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (33, 18);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (33, 48);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (33, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (33, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (33, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (34, 17);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (34, 15);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (34, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (34, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (34, 21);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (35, 21);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (35, 41);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (35, 52);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (35, 17);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (35, 13);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (7, 83);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (68, 48);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (68, 43);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (68, 15);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (68, 55);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (36, 22);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (36, 20);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (36, 58);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (36, 31);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (36, 55);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (11, 13);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (11, 15);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (11, 43);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (11, 19);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (11, 51);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (37, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (37, 38);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (37, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (37, 40);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (37, 17);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (38, 26);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (38, 27);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (38, 28);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (38, 40);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (38, 42);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (39, 24);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (39, 21);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (39, 52);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (39, 29);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (39, 27);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (38, 16);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (38, 59);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (39, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (40, 45);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (40, 46);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (40, 29);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (40, 17);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (40, 40);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (41, 19);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (41, 23);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (41, 58);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (41, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (41, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (42, 34);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (42, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (42, 39);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (42, 23);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (42, 42);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (42, 59);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (43, 40);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (43, 17);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (43, 15);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (43, 55);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (43, 54);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (44, 39);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (44, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (44, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (44, 53);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (44, 54);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (45, 54);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (45, 53);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (45, 55);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (45, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (45, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (13, 54);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (13, 55);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (13, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (13, 30);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (13, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (46, 47);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (46, 54);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (46, 56);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (46, 22);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (46, 58);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (8, 14);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (8, 18);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (8, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (8, 17);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (8, 48);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (47, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (47, 30);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (47, 34);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (47, 22);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (47, 59);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (47, 23);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (48, 19);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (48, 51);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (48, 23);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (48, 58);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (48, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (48, 14);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (48, 38);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (49, 14);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (49, 18);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (49, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (49, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (49, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (14, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (14, 35);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (14, 30);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (14, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (14, 79);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (50, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (50, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (50, 38);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (50, 34);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (50, 39);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (14, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (51, 41);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (51, 21);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (51, 52);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (51, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (51, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (51, 12);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (52, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (52, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (52, 35);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (52, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (52, 41);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (52, 40);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (52, 16);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (53, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (53, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (53, 34);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (53, 48);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (53, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (54, 83);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (72, 83);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (55, 50);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (55, 47);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (55, 31);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (55, 49);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (55, 56);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (55, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (55, 16);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (19, 17);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (19, 16);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (19, 13);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (19, 18);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (19, 21);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (19, 52);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (56, 18);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (56, 48);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (56, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (56, 54);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (56, 49);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (57, 45);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (57, 25);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (57, 29);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (57, 39);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (57, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (58, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (58, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (58, 38);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (58, 31);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (58, 56);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (59, 59);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (59, 52);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (59, 22);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (59, 41);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (59, 24);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (60, 81);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (61, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (61, 35);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (61, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (61, 41);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (61, 21);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (62, 82);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (63, 50);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (63, 31);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (63, 47);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (63, 16);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (63, 14);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (63, 80);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (64, 14);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (64, 16);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (64, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (64, 38);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (64, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (65, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (65, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (65, 30);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (65, 38);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (65, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (65, 80);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (66, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (66, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (66, 38);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (66, 16);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (66, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (66, 80);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (67, 81);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (68, 53);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (69, 12);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (69, 48);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (69, 43);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (69, 80);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (69, 30);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (69, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (70, 83);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (71, 81);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (73, 26);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (73, 27);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (73, 28);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (73, 51);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (73, 59);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (74, 51);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (74, 59);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (74, 20);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (74, 27);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (74, 28);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (12, 42);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (12, 13);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (12, 15);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (12, 43);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (12, 16);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (75, 83);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (76, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (76, 35);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (76, 30);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (76, 17);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (76, 15);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (76, 60);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (77, 50);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (77, 47);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (77, 55);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (77, 54);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (77, 60);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (78, 83);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (79, 83);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (80, 20);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (80, 59);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (80, 21);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (80, 52);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (80, 60);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (81, 52);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (81, 59);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (81, 24);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (81, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (81, 17);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (82, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (82, 17);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (82, 40);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (82, 45);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (82, 27);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (82, 19);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (15, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (83, 83);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (84, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (84, 42);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (84, 13);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (84, 33);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (84, 34);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (84, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (16, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (16, 42);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (16, 13);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (16, 19);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (16, 58);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (85, 23);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (86, 81);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (87, 82);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (88, 81);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (89, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (89, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (89, 35);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (89, 60);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (89, 22);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (90, 82);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (91, 86);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (92, 35);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (92, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (92, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (92, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (92, 42);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (92, 15);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (93, 83);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (94, 46);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (94, 28);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (94, 25);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (94, 45);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (94, 79);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (95, 24);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (95, 58);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (95, 60);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (95, 25);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (95, 46);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (96, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (96, 25);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (96, 39);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (96, 60);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (96, 24);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (96, 79);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (97, 46);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (97, 28);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (97, 45);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (97, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (97, 79);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (98, 25);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (98, 46);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (98, 45);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (98, 60);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (98, 24);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (99, 87);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (100, 30);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (100, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (100, 39);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (100, 29);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (100, 45);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (101, 81);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (102, 30);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (102, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (102, 39);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (102, 34);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (102, 45);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (103, 81);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (104, 82);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (105, 22);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (105, 59);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (105, 23);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (105, 25);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (105, 26);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (106, 82);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (107, 82);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (108, 81);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (109, 82);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (110, 31);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (110, 55);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (110, 50);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (110, 56);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (110, 47);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (110, 22);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (111, 81);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (112, 22);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (112, 20);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (112, 58);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (112, 38);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (112, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (113, 83);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (114, 53);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (114, 50);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (114, 54);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (114, 49);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (114, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (115, 53);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (115, 50);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (115, 54);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (115, 35);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (115, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (116, 50);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (116, 49);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (116, 53);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (116, 18);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (116, 44);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (116, 31);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (116, 34);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (117, 32);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (117, 35);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (117, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (117, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (117, 62);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (118, 46);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (118, 29);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (118, 27);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (118, 24);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (118, 60);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (91, 22);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (91, 60);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (91, 57);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (91, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (99, 79);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (99, 36);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (99, 34);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (99, 39);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (85, 86);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (85, 20);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (85, 37);
INSERT INTO product_to_effect (product_id, effect_id) VALUES (85, 33);


CREATE TABLE special
(
   id INT NOT NULL AUTO_INCREMENT ,
   `name` NVARCHAR(100) NOT NULL,
   power INT NOT NULL,
   `comment` NVARCHAR(100),
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO special (id, `name`, power, `comment`) VALUES (13, 'זהב', 1, '');
INSERT INTO special (id, `name`, power, `comment`) VALUES (14, 'כסף', 2, '');
INSERT INTO special (id, `name`, power, `comment`) VALUES (15, 'זכוכית וולקנית', 3, '');
INSERT INTO special (id, `name`, power, `comment`) VALUES (16, 'פנינים', 4, '');
INSERT INTO special (id, `name`, power, `comment`) VALUES (17, 'חול', 9, '');
INSERT INTO special (id, `name`, power, `comment`) VALUES (18, 'ברזל', 8, '');
INSERT INTO special (id, `name`, power, `comment`) VALUES (19, 'שנהב', 5, '');
INSERT INTO special (id, `name`, power, `comment`) VALUES (20, 'אבני חן', 6, '');
INSERT INTO special (id, `name`, power, `comment`) VALUES (21, 'עור', 7, '');
INSERT INTO special (id, `name`, power, `comment`) VALUES (22, 'דם בן אדם', 14, 'כולל אלפים אפלים');
INSERT INTO special (id, `name`, power, `comment`) VALUES (23, 'דם אלפים', 15, 'רמים, יער, ים ואנשי לטאה');
INSERT INTO special (id, `name`, power, `comment`) VALUES (24, 'דם בטאל', 16, 'שייף + לונג שה');
INSERT INTO special (id, `name`, power, `comment`) VALUES (25, 'שן נמר', 10, 'פטריה מאזורים קרים המזכירה בצורתה ניב של נמר, נוזלים מאוד חריפים הטובים לחיטוי.');
INSERT INTO special (id, `name`, power, `comment`) VALUES (26, 'לב שחור', 11, 'ר - אצטרובל מיערות אליזאן, החומר השחור המופרש ממנו קורם להאטת רעל');
INSERT INTO special (id, `name`, power, `comment`) VALUES (27, 'סומק הרים', 12, 'צמח הרים אדום צהוב מאדמות השייף, האבקנים טובים להרגעה');
INSERT INTO special (id, `name`, power, `comment`) VALUES (28, 'שנהב צהוב', 13, 'פרח צהוב, "רחמיו של טיטאן", עלי הכותרת משמשים לזירוז החלמה');
INSERT INTO special (id, `name`, power, `comment`) VALUES (29, 'פלדת שייף', 17, 'כמו מתכת אבל חזק יותר!');
INSERT INTO special (id, `name`, power, `comment`) VALUES (30, 'עץ', 18, '');
INSERT INTO special (id, `name`, power, `comment`) VALUES (31, 'מתכת כוכבים', 19, '');

CREATE TABLE special_To_effect
(
   special_id INT,
   old_effect_id INT,
   new_effect_id INT,
   CONSTRAINT fk_special_To_effect__special FOREIGN KEY (special_id) REFERENCES special (id),
   CONSTRAINT fk_special_To_effect__old_effect FOREIGN KEY (old_effect_id) REFERENCES effect (id),
   CONSTRAINT fk_special_To_effect__new_effect FOREIGN KEY (new_effect_id) REFERENCES effect (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (20, 54, 74);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (20, 31, 72);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (20, 45, 69);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (15, 45, 68);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (16, 54, 75);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (16, 31, 73);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (16, 45, 70);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (18, 40, 66);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (15, 47, 77);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (15, 13, 78);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (13, 40, 63);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (17, 40, 65);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (14, 40, 71);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (21, 40, 64);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (19, 40, 67);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (19, 47, 76);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (31, 47, 84);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (21, 49, 85);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (18, 86, 88);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (16, 86, 89);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (23, 70, 90);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (24, 70, 90);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (22, 70, 90);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (23, 32, 92);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (24, 32, 93);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (22, 32, 91);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (23, 50, 95);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (24, 50, 96);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (22, 50, 94);
INSERT INTO special_To_effect (special_id, old_effect_id, new_effect_id) VALUES (28, 30, 97);


CREATE TABLE potion
(
   id INT NOT NULL AUTO_INCREMENT ,
   `name` NVARCHAR(100) NOT NULL,
   description NVARCHAR(500),
   `creator_name` NVARCHAR(100),
   primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE potion_effects
(
   potion_id INT,
   effect_id INT,
   effect_level INT,
   CONSTRAINT fk_potion_effects__potion_id FOREIGN KEY (potion_id) REFERENCES potion (id),
   CONSTRAINT fk_potion_effects__effect_id FOREIGN KEY (effect_id) REFERENCES effect (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (17, 'נוגד רעלים 1', 'השיקוי מבטל את השפעת רעלים מדרגה 1', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (18, 'כוהל אלכימי', 'משמש לחיטוי פצעים', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (19, 'חומר מלבין', 'נעשה שימוש בחומר זה ליצירת דפים לבנים', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (20, 'מרקחת הרגעה יבשה', 'מקל על דמויות הסובלות מהשפעות המערערות את עצביהן. רמת ההשפעה נתונה להחלטת השחקן, אך ככלל השיקוי יסייע במידה ניתנת להבחנה. דמות המצוייה במצב נפשי קשה או גבולי עלולה פשוט לאבד את הכרתה.
העור של הדמות נהיה יבש והיא נהיית צמאה.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (21, 'מרקחת חימום', '', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (22, 'שמן אתרי יבש', ' שמן בעל ניחוח נעים המשמש למגוון אירועים - בין אם לעיסוי מרגיע ובין אם לטקסי כוהנים.
השחקן שנמרח בשמן זה נהיה צמא במיוחד.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (23, 'רעל פטפטת בלתי נשלטת', 'הדמות מאבדת כל עכבה ומדברת בשטף תודעה מלא. בעזרת הכוונה עדינה נהוג להשתמש ברעל זה לתחקור שבויים, אם כי הוא איננו אמין במיוחד. השפעתו מתגברת ככל שהזמן עובר ואם לא יטופל ע"י נוגדן מתאים הקורבן ימות תוך יום.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (24, 'רעל גרד', 'גורם לגירוד בלתי נשלט שמתגבר ככל שהזמן עובר ואם לא יטופל ע"י נוגדן מתאים הקורבן ימות תוך יום.
', 'א.מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (62, 'סם אמת', 'הדמות אומרת את האמת לשלוש שאלות אשר נשאלות מיד לאחר תחילת השפעת השיקוי. כמו שהיא מבינה את האמת בכל מקרה', 'א.(רנדיר) מכאניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (63, 'מרקחת בריאות', 'אולי המרקחת המפורסמת ביותר, מסייעת ומרגיעה את הרקמות לאחר פציעה אלימה ומאפשרת לאלו שנפגעו לחזור לתפקד במהירות רבה. (מחזיר 1 נק"פ אבוד). ', 'א.(רנדיר) מכאניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (27, 'דשן', 'נעשה שימוש בחומר זה על מנת לגדל צמחי מרפא בגינות.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (28, 'אופוריה (ממכר)', 'השיקוי מרפה את השרירים וגורם לחזיונות נעימים אשר שורים על הדמות למשך כעשר דקות. התחושה המרוממת מלווה בהעצמה אישית ונטייה לחשוב שהדמות מסוגלת להרבה יותר ממה שהיא באמת.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (64, 'רעל פאניקה', 'הדמות חווה הזיות מן הזן הגרוע ביותר ומחפשת כל דבר שהוא להתחבא מאחוריו מפני החזיונות. השפעתו מתגברת ככל שהזמן עובר ואם לא יטופל ע"י נוגדן מתאים הקורבן ימות תוך שעה.', 'א.(רנדיר) מכאניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (30, 'נוגד רעלים 2', 'טיפות מרירות אשר מאפשרות לגוף להתנגד לרעלים פעילים ברמה 2.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (66, 'שיקוי ברזרקרים', 'סוד טאנדרולי שמור היטב, המעניק ללוחמים אחוזי הטירוף מהצפון את חוסנם האגדי. מוסיף 2 נק"פ למשך שעה או הקרב הקרוב - מה שמגיע קודם.', 'א.(רנדיר) מכאניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (67, 'שכחה מקסימה', 'השיקוי מפריע למעבר זיכרון מהזמן הקצר לזמן הארוך, בנוסף הדמות תאמין שכל הסובבים אותה הם חברים טובים שלה. לאחר חצי שעה, הדמות תחווה בלקאאוט ולא תזכור מה קרה מרגע ששתתה את השיקוי.', 'עולם');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (33, 'חומצת מנעולים חלשה', 'חומצה לפריצת מנעולים רמה 1 ו-2 - לא עובד על מנעולים קסומים.
שימשו בשיקוי זה על מנעול הורס אותו לחלוטין וניתן להתעלם ממנו. כל שיקוי מכיל מספיק חומצה למנעול יחיד.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (34, 'שכחה יבשה', 'השיקוי מפריע למעבר זיכרון מהזמן הקצר לזמן הארוך. לאחר חצי שעה, הדמות תחווה בלקאאוט ולא תזכור מה קרה מרגע ששתתה את השיקוי.
הדמות תהיה צמאה במיוחד לאחר 
שתיית השיקוי.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (35, 'שיקוי נגד לסם אמת', 'שיקוי זה מאפשר להתנגד להשפעות של שיקוי אמת. השיקוי מבטל שתייה של שיקוי אמת יחיד. שתייה של שיקוי אמת נוסף עדיין יפעיל כרגיל.
הדמות מרגיע קור עז אחר לקיחת, היא תתקשה לרוץ או לבצע פעולות פיזיות עצימות.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (36, 'סירופ מטהר', 'סירופ סמיך זה שואב את הרעל ממנת מזון או משקה יחידה ומבטל את השפעתו [ניתן להסיר את המדבקה]. למרבה הצער, הסירופ גם מריר מאוד ועל כן לעיתים רחוקות מישהו יהיה מוכן לאכול משהו שנמסך בו החומר.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (37, 'שיקוי חידוש רקמות', 'השיקוי מתקן רקמות בגוף מת והופך אותן לתקינות. הגוף אינו מתחיל לפעול מחדש אלה הינו רק במצב תקין לחלוטין. לא מרפא פציעות חמורות שהיו לגופה.', 'דוקטור איוון הומניק');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (38, 'קיבעון מחשבתי', 'הדמות מפתחת קיבעון בלתי נשלטת לישות הבאה אותה היא פוגשת לאחר שלגמה את השיקוי המריר. קיבעון זה מתבטא לרוב ברכושנות וחרדת נטישה בלתי מוסברת. השפעת השיקוי פגה לאחר שהדמות עליה התקבעה יוצאת מטווח הראייה שלה ליותר מכמה דקות ולרוב מתחלפת בתיעוב עמוק.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (39, 'רעל צמאון שלא ניתן להרוות', 'הרעל מסיר את יכולתה של הדמות לרוות שתייה ולרוב גורם לה להטביע את עצמה בהתקף טירוף. השפעתו מתגברת ככל שהזמן עובר ואם לא יטופל ע"י נוגדן מתאים הקורבן ימות תוך חצי שעה', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (40, 'רעל שיתוק', ' השיתוק מתחיל דקה לאחר שתיית הרעל, משתק את הידיים לאט וממשיך לשאר הגוף בשלושת הדקות שלאחר מכן. אם לא יטופל ע"י נוגדן מתאים הקורבן ימות תוך חצי שעה.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (41, 'נוגד רעלים 3 מעוור', 'מרקחת הנמשחת מתחת לעיניים ומבטלת את השפעתו של רעל מעוצמה 3.
אם זאת, הדמות אשר השיקוי נמרך עליה מאבדת לחלוטין את הראיה שלה למשך 15 דק''.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (42, 'רעל שינה רעה ושחורה ', 'המורעל חווה כעס רב כלפי כל מי שלידו אך גם ישנוניות ואובדן אוריינטציה למשך דקה ולאחריה יירדם. אם לא יאבחנו את הרעל ויטפלו בו במהלך העשר דקות הבאות, תמות הדמות בשנתה.
הדמות אינה אגרסיבית כאשר היא ישנה.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (43, 'נוגד רעלים דרגה 4 ומעלה בטחון עצמי', 'תרחיף של תמציות רבות אשר לרוב נמזג עם תה חזק, ומבטל את השפעתם של רעלים מעוצמה 4.
הדמות תרגיש חוסר דאגה למצבה האישי ולרעל אשר פגע בה.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (44, 'חיסון כנגד הרעלה', 'חומר השוהה במערכת של הדמות למשך שבוע ימים. במידה והדמות מורעלת באופן כלשהו בזמן הרלוונטי, היא תקיא את הרעל ואת הנסיוב ותבטל את השפעת הרעל - לא משנה מה עוצמת הרעל.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (45, 'היפנוזה', 'הופך את שותה השיקוי לנוח להשפעה למשך 15 דקות, ומאפשר למי שנתן לו את השיקוי לתת לו הוראה אחת פשוטה, אליה לא יוכל להתנגד.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (46, 'רעל דיליריום', 'הדמות מאבדת כל קשר עם המציאות - הדמות מאבדת את ההקשר עם הזמן, המיקום והנוכחים באופן אקוטי ונוראי. השפעתו מתגברת ככל שהזמן עובר ואם לא יטופל ע"י נוגדן מתאים הקורבן ימות תוך עשר דקות מהתקף לב.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (47, 'טוהר דם אלפי (ממכר)', '', 'ארנדיר');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (48, 'רופפות שרירים', 'השרירים של הדמות נהפכים לרופפים וחסרי כוח למשך 15 דק''. הדמות לא יכולה להילחם, לרוץ או לעשות עבודה פיזית כלשהי. היא יכולה ללכת לאט מאוד ובקושי או להעזר בשחקנית אחרת ולנוע במהירות רגילה.', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (49, 'רעל האנפה השחורה', 'הורג את הדמות תוך דקה אחת בלבד', 'א. מכניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (50, 'כוהל אדמאני', 'כוהל אלכימי אשר אפשר להשתמש בו לריפוי פציעות עבודה ללא צורך ברופא.', 'פרדריק מאדאמן');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (51, 'שמן לפירוזה', 'דרך חדשה לעשיית שמן אתרי יבש', 'פירוזה פלור');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (52, 'שורף הכאב של הקרוון', 'בעל תכונות של כוהל אלכימי ', 'דומי');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (53, 'כוהל אלכימי מתגבר', 'כוהל אלכימי אשר מתגבר עם הזמן. שימוש בחומר על הגוף לאורך זמן הופך הותו לדליק.', 'דומי מהקרוואן');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (54, 'חידוש רקמות קסם', 'פועל כמו חידוש רקמות של הדמות. אם זאת, יכול לחדש רקמות אשר פגועות באמצעים קסומים.', 'דר'' איוון הומניק');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (55, 'מחטא פירוזה', 'חומר מחטא לא דליק', 'פלור פירוזה ');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (56, 'גרדן יער', 'חומר שניתן למרוח על העור או לשתות אותו. גורם לבחילה ולגירודים בכל הגוף. לאחר מספר שניות של גירודים הגף משותק לחלוטין עד שכל הגוף משתתק.
כמו כן הדמות תמות תוך 10 דק'' ללא טיפול.', 'קראקרא מבת''ול דואל');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (57, 'טיול בזמן', 'כאשר דמות שותה את השיקוי היא מרגישה לפתע שאינה יודעת האם היא נמצאת בעבר בהווה או בעתיד. לרגעים היא בטוחה שהיא בעברה, לעיתים היא בטוחה שהיא בהווה ולעיתים היא בטוחה שהיא בעתידה. למרות זאת היא לא משתגעת. הדמות עמידה בפני פציעות פיזיות וחסינה לקסמים.', '');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (58, 'שיקוי זמני', '', '');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (59, 'שיקוי ערפדות בסיסי', 'הדמות יכולה לשתות דם של דמות אחרת על מנת להחזיר נק"פ. הדמות אינה יכולה להשתמש ביכולת זו יותר משלוש פעמים. נגמר בלילה של אותו היום.', 'הקיסר החיוור');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (60, 'נוגד רעלים וגורם להזיות', 'נוגד רעלים רמה 1 אשר גורם להזיות תוך חצי שעה
מזמן שתיית השיקוי', 'ספריה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (61, 'רעל גרד שמנוני', 'שמן זה גורם לגרד בלתי נשלט שמתגבר ככל שעובר הזמן. אם הקורבן לא יטופל ע"י נוגדן מתאים הוא ימות תוך יום.', 'ב. מכאניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (65, 'שיקוי ילדות', 'גורם לשותה להרגיש ולהתנהג כמו ילד למשך חצי שעה', 'א.(רנדיר) מכאניקה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (68, 'מרקחת הרגעה יבשה מחוזקת', 'מקל על דמויות הסובלות מהשפעות המערערות את עצביהן, גם אלו בעלות מום נפשי. רמת ההשפעה נתונה להחלטת השחקן, אך ככלל השיקוי יסייע במידה ניתנת להבחנה. דמות המצוייה במצב נפשי קשה או גבולי עלולה פשוט לאבד את הכרתה.
העור של הדמות נהיה יבש והיא נהיית צמאה.', 'עולם');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (70, 'משקה אנרגיה משכר', 'השיקוי גורם למרץ ואגרסיביות, יחד עם בלבול וקלות שכנוע, ומאפשר לשכנע את המושפע לבצע מעשים אלימים שלא היה עושה אחרת. בא עם גירוד.', 'דבי');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (71, 'כספית', 'כספית הינו מוצר הנספג בחומרים אחרים עקב תכונותיו הנזוליות והכבדות.  אם זאת, לחומר זה תכונות רעילות מסוכנות.', 'עולם');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (74, 'קפיצת הדרך', 'חיבור קוסמי מאד חזק, הזיות חזקות, נוחות חהשפעה, עיוורון וטרנספורמציה.', 'אדלסיה נסקונדר ואדון גריי');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (73, 'ברק ורעם', 'הדמות נהיית מלאת אנרגיה, כוח ושמחת חיים למשך 10 דק''. לאחר מכן הדמות נהיית חלשה ועייפה למשך 10 דק'' נוספות. (ממכר)', 'עולם');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (75, 'קפיצת הדרך - חומרים', '', '');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (76, 'מרקחת בטחון שווא', 'מעלה מאד את הבטחון,
נוגד רעלים, 
אך מחליש, עושה בחילה
וגם טרנספורמציוני', 'ניקולס פלמל');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (77, 'אבקה שחורה', 'אבדקה דליקה.
נשרפת ונעלמת במהירות.
אם מוסיפים אותה לאדמה, 
המצחים שגדלים בה נראים שרופים.', 'אדון גריי ואיזולדה סרפיקו');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (78, 'אבקת שריפה פשוטה', 'אבקת שריפה פשוטה:
חומר יבש ודליק
מתגבר חימום', '');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (79, 'טראנס גיל', 'מכניס לטראנס רגוע 
שבו הדמות חווה עצמה
צעירה או זקנה ממה שהיא', 'שייד');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (80, 'שומר קור פשוט', 'כאשר מוסף לאלמנטים - שומר עליהם קרים למשך שעה', 'אדון גריי ואיזולדה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (81, 'שמן מרגיע', 'שמן מרגיע בשימוש חיצאני.
יכול לגרום לפגיעה זמנית בראיה במגע בעיניים או שתיה.
מייבש מעבר לרגיל. ניתן לשימוש כשמן אתרי', 'זאהיר מהשייף ואריאל מחובלי של לורליי');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (82, 'זרז בערה', 'משכה מזרזת בערה', 'קסטרינה לסקונדר ואיתילוון לימיר');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (83, 'מזרז בערה מתקדם', 'אבקה דליקה מאד מאד.
במיוחד עבור צמחים ואלמנטים.', 'אדון גריי ואיזולדה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (84, 'סם אמת לפי המתכון?', '', '');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (85, 'טראנס גיל אגרסיבי', 'מי ששותה את השיקוי הופך למבוגר או צעיר יותר בגוף
הוא נכנס לטראנס כעס
אך הגוף שלו מרגיש כמו עיסה', 'שייד');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (86, 'בועת זמן מרפאת', 'מי ששותתה את השיקוי רואה את העבר, ההווה והעתיד יחדיו, חש בעירה פנימית, וכן מפסיק לסבול מכאבים ורעלים עד רמה 2.', 'אדון גריי ואיזולדה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (87, 'חמרמורת', 'הכל מציק לך כל דבר מעצבן אותך גם דברים שלא שם. בנוסף נוגד רעלים (2)', 'ניקולס פלאמה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (88, 'רעל שינה רעה ושחורה', 'רעל רמה 4 
הרעל מרדים תוך דקה.
במידה ולא יטופל תוך עשר דקות גורם למוות', 'מוריה ווינפילד');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (89, 'אהבת אליזאן', 'השיקוי גורם לכאב, פוגע בהחחמת פציעות ומרדים. טוב לעיכוב לוחמים.', 'סקלפל');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (90, 'שמן אתרי', 'שמן בעל ניחוח נעים המשמש למגוון אירועים - בין אם לעיסוי מרגיע ובין אם לטקסי כוהנים.
השחקן שנמרח בשמן זה נהיה צמא במיוחד.', '');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (91, 'עקרב שחור', 'רעל רמה 5
לאחר הצריכה הקורבן יכנס למצב של שיגעון קרב ולאחר דקה יפול מת לרצפה', 'האב סבסטיאן');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (92, 'עוצמת הכסיל', 'אתה נתקף ברצון בלתי נשלט לרוץ לכיכר העיר ולתת דרשה חוצבת להבות על עליונותך בעולם', 'סקאלפל');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (93, 'העיכוב', 'השיקוי מונע השפעה של מגוון קסמים ואף החזקים שבהם.לא ניתן לבצע קסמים לבצע יצירה קסומה או להישתתף בטקסים למשך שעה. תחושה של רוגע ורפיון שורה עליך.', 'ויקטור');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (94, 'שמחה טנדרולית', 'ככל שעובר הזמן אתה מתחיך להיות יותר אגרסיבי ובטוח בעצמך. בנוסך ככל שעובר הזמן הגוף שלך מתחמם ואתה מאדים', 'סקלפל');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (95, 'ירח אדום', 'הדמות יכולה לשתות דם של דמות אחרת על מנת להחזיר נק"פ. נדרש לשתות את הדם ישירות מהדמות או מיד לאחר לקיחת הדם ממנה. שתיית דם של דמות מוריד לה מיידית 1 נק"פ. כל נק"פ שיורד מדמות מחזיר לשותה נק"פ אחד. הדמות יכולה להשתמש ביכולת זו פעם בשעה. ההשפעה נגמרת לאחר חודש', 'האדון גריי ואיזולדה');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (96, 'מנטרל התמכרות', 'מפסיק התמכרות לחומר יחיד אצל דמות אחת. למשך שעה הדמות לא יכולה ללכת'' לרוץ, להילחם או לבצע עבודה פיזית. הדמות מרגישה רע ביותר, מקיאה ולא יכולה לאכול כלום. לקיחה של כל חומר ממכר במהלך השעה הזאת תבטל את תהליך הגמילה. לאחר השעה הדמות מרגישה טוב יותר אך עדיין חלשה ונדרשת לאכול ארוחה דשנה על מנת שתוכל להילחם, לרוץ או לבצע עבודה פיזית שוב. כמו כן ההתמכרות של הדמות לחומר יחיד מפסיקה.', 'עולם');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (97, 'שוטי הנבואה', 'גורם לשותה להתמותת ולאבד את ההכרה. נותן חלום נבואי על זמן ומקום אחר. אין דרך לשלוט על מה שרואים. 
! יש ללכת למאסטר לאחר שתיית השיקוי לקבלת החלום !', '');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (98, 'אבקת שריפה דליקה', 'חומר יבש ודליק במיוחד.
מתגבר חימום', '');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (99, 'אבקת פלאש', 'אבקה יבשה ודליקה
ניצת לרגע אחד ומפיק להבה קטנה', '');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (100, 'שמן אלפים', 'נוזל שמנוני
למשך עשר הדקות הבאות אתה חש אובדן שליטה קל והאוזניים שלך הופכות למחודדות', '');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (101, 'שומר קור משופר', 'כאשר מוסף לאלמנטים - שומר עליהם קרים למשך שבוע', '');

INSERT INTO potion (id, `name`, description, `creator_name`) VALUES (102, 'שמן הנשק של סמיט''', '', 'סמיט''');










ALTER TABLE `antigen` ADD CONSTRAINT `PK_antigen` PRIMARY KEY (effect_id, counter_id);

ALTER TABLE `product_to_effect` ADD CONSTRAINT `PK_product_to_effect` PRIMARY KEY (product_id, effect_id);



INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (17, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (17, 33, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (17, 37, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (18, 34, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (18, 36, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (19, 35, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (19, 36, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (20, 12, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (20, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (20, 43, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (20, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (21, 23, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (21, 28, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (21, 38, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (22, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (22, 49, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (22, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (22, 62, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (23, 15, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (23, 32, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (23, 48, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (23, 57, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (24, 21, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (24, 23, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (24, 32, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (62, 13, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (62, 15, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (62, 17, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (62, 73, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (63, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (63, 54, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (63, 37, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (63, 34, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (63, 57, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (64, 32, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (27, 27, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (27, 28, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (27, 42, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (28, 40, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (28, 15, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (28, 16, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (28, 30, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (64, 23, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (64, 64, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (64, 44, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (66, 23, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (30, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (30, 33, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (30, 37, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (66, 42, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (66, 40, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (66, 74, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (67, 13, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (67, 17, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (67, 18, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (67, 23, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (67, 38, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (33, 26, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (33, 31, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (33, 35, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (33, 59, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (34, 13, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (34, 18, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (34, 23, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (34, 38, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (34, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (35, 12, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (35, 29, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (35, 75, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (35, 57, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (35, 62, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (36, 74, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (36, 33, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (36, 36, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (36, 39, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (37, 74, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (37, 35, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (37, 36, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (37, 37, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (37, 47, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (38, 14, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (38, 17, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (38, 44, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (38, 57, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (38, 64, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (39, 32, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (39, 14, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (39, 62, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (39, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (39, 58, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (40, 32, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (40, 22, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (40, 34, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (40, 57, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (41, 33, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (41, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (41, 20, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (41, 36, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (41, 37, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (42, 32, 4);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (42, 13, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (42, 24, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (42, 30, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (42, 42, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (43, 33, 4);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (43, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (43, 37, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (43, 16, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (44, 33, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (44, 74, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (44, 38, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (44, 34, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (44, 39, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (45, 15, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (45, 17, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (45, 73, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (45, 48, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (46, 32, 4);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (46, 13, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (46, 18, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (46, 44, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (46, 57, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (47, 70, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (47, 30, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (47, 38, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (47, 50, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (47, 55, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (48, 22, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (48, 72, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (48, 57, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (48, 59, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (49, 32, 5);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (49, 22, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (49, 41, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (49, 52, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (49, 59, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (50, 36, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (50, 37, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (50, 34, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (51, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (51, 62, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (51, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (52, 34, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (52, 57, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (53, 36, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (53, 34, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (53, 57, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (54, 74, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (54, 35, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (54, 37, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (54, 55, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (54, 47, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (55, 36, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (56, 32, 4);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (56, 21, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (56, 22, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (56, 41, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (56, 62, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (57, 54, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (57, 35, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (57, 37, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (57, 55, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (57, 84, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (58, 33, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (58, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (58, 20, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (58, 42, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (58, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (59, 45, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (59, 37, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (59, 16, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (59, 50, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (59, 85, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (60, 33, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (60, 44, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (60, 79, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (61, 32, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (61, 21, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (61, 23, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (61, 62, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (62, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (65, 15, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (65, 71, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (65, 48, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (65, 62, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (66, 38, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (68, 12, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (68, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (68, 43, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (68, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (70, 13, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (70, 17, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (70, 21, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (70, 23, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (70, 42, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (71, 32, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (71, 86, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (71, 87, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (74, 17, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (74, 20, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (74, 44, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (74, 50, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (74, 49, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (73, 15, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (73, 23, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (73, 30, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (73, 31, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (73, 79, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (75, 17, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (75, 20, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (75, 63, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (75, 16, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (75, 44, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (76, 33, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (76, 31, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (76, 16, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (76, 41, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (76, 50, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (77, 27, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (77, 45, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (77, 34, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (77, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (78, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (78, 34, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (78, 57, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (78, 28, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (79, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (79, 44, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (79, 47, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (80, 45, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (80, 29, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (80, 38, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (81, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (81, 20, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (81, 51, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (81, 62, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (82, 45, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (82, 28, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (82, 34, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (83, 27, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (83, 45, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (83, 28, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (83, 34, 4);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (83, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (84, 15, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (84, 17, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (84, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (84, 62, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (84, 55, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (85, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (85, 42, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (85, 44, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (85, 47, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (86, 33, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (86, 28, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (86, 37, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (86, 34, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (86, 84, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (87, 33, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (87, 13, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (87, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (87, 42, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (87, 44, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (88, 32, 4);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (88, 13, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (88, 24, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (88, 30, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (88, 42, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (89, 24, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (89, 34, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (89, 39, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (89, 52, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (90, 19, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (90, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (90, 62, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (90, 49, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (91, 32, 5);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (91, 13, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (91, 15, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (91, 42, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (91, 54, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (92, 14, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (92, 15, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (92, 16, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (93, 12, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (93, 19, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (93, 55, 4);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (94, 28, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (94, 42, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (94, 36, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (94, 16, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (94, 57, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (95, 70, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (95, 37, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (95, 50, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (95, 85, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (95, 76, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (96, 31, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (96, 41, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (96, 52, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (96, 97, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (97, 16, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (97, 44, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (97, 49, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (97, 47, 2);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (98, 28, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (98, 34, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (98, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (98, 57, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (99, 34, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (99, 51, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (99, 57, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (100, 33, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (100, 48, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (100, 62, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (100, 95, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (101, 45, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (101, 29, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (101, 38, 3);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (101, 47, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (102, 26, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (102, 54, 5);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (102, 38, 6);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (102, 34, 1);

INSERT INTO potion_effects (potion_id, effect_id, effect_level) VALUES (102, 44, 1);

