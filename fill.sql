INSERT INTO locations (name) VALUES ('Поле'), ('Ветка дерева');

INSERT INTO characters (name, description, location_id) VALUES
('Малыш', 'Детеныш мамы динозавра', (SELECT id FROM locations WHERE name = 'Поле')),
('Динозавриха', 'Мама динозавр, выглядит очень забавно из-за изогнутых губ', (SELECT id FROM locations WHERE name = 'Поле')),
('Лекси', 'Внучка генерального директора парка юрского периода', (SELECT id FROM locations WHERE name = 'Ветка дерева')),
('Грант', 'Палеонтолог, работник парка юрского периода', (SELECT id FROM locations WHERE name = 'Ветка дерева'));

INSERT INTO actions (description, performer_id, timestamp) VALUES
('Пискнул', (SELECT id FROM characters WHERE name = 'Малыш'), '2022-10-10 11:30:30'),
('Укрылся под маминым брюхом', (SELECT id FROM characters WHERE name = 'Малыш'), '2022-10-10 11:31:00'),
('Отступила от дерева', (SELECT id FROM characters WHERE name = 'Динозавриха'), '2022-10-10 11:31:00'),
('Подняла голову', (SELECT id FROM characters WHERE name = 'Динозавриха'), '2022-10-10 11:32:00'),
('Посмотрела на ветку дерева', (SELECT id FROM characters WHERE name = 'Динозавриха'), '2022-10-10 11:32:00'),
('Села на ветку дерева', (SELECT id FROM characters WHERE name = 'Лекси'), '2022-10-10 11:20:00'),
('Сел на ветку дерева', (SELECT id FROM characters WHERE name = 'Грант'), '2022-10-10 11:20:00');

INSERT INTO emotions (name) VALUES ('Испуг'), ('Спокойствие');

INSERT INTO characters_emotions_log (character_id, emotion_id, timestamp) VALUES
((SELECT id FROM characters WHERE name = 'Малыш'), (SELECT id FROM emotions WHERE name = 'Испуг'), '2022-10-10 11:30:30'),
((SELECT id FROM characters WHERE name = 'Малыш'), (SELECT id FROM emotions WHERE name = 'Спокойствие'), '2022-10-10 11:31:00');