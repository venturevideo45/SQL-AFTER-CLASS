-- Create JJK Characters table
CREATE TABLE IF NOT EXISTS JJK_Characters (
  name TEXT,
  technique TEXT,
  cursed_energy INTEGER,
  grade TEXT,
  type TEXT
);

-- Insert data
INSERT INTO JJK_Characters (name, technique, cursed_energy, grade, type)
VALUES
  ('Yuji Itadori', 'Black Flash', 1, 'Grade 3', 'Sorcerer'),
  ('Megumi Fushiguro', 'Ten Shadows', 2, 'Grade 2', 'Sorcerer'),
  ('Gojo Satoru', 'Limitless / Infinity', 3, 'Special Grade', 'Sorcerer'),
  ('Nobara Kugisaki', 'Hairpin: Straw Doll', 2, 'Grade 3', 'Sorcerer'),
  ('Nanami Kento', 'Ratio Technique', 1, 'Grade 1', 'Sorcerer'),
  ('Maki Zenin', 'Cursed Tool Mastery', 2, 'Grade 1', 'Sorcerer'),
  ('Sukuna', 'Cleave / Dismantle', 4, 'Special Grade', 'Curse'),
  ('Mahito', 'Idle Transfiguration', 3, 'Special Grade', 'Curse'),
  ('Jogo', 'Cursed Technique: Ryu', 3, 'Special Grade', 'Curse');

-- 1) Distinct grades
SELECT DISTINCT grade
FROM JJK_Characters;

-- 2) Distinct types
SELECT DISTINCT type
FROM JJK_Characters;

-- 3) Sorcerers only
SELECT *
FROM JJK_Characters
WHERE type = 'Sorcerer';

-- 4) Characters with cursed energy 3 and above
SELECT *
FROM JJK_Characters
WHERE cursed_energy >= 3;

-- 5) Sorcerers with Grade 1 or Grade 2
SELECT *
FROM JJK_Characters
WHERE type = 'Sorcerer'
  AND grade IN ('Grade 1', 'Grade 2');

-- 6) Characters with exactly Grade 1
SELECT *
FROM JJK_Characters
WHERE grade = 'Grade 1';

-- 7) Characters whose name contains "Gojo"
SELECT *
FROM JJK_Characters
WHERE name LIKE '%Gojo%';

-- 8) Sorcerers and curses
SELECT *
FROM JJK_Characters
WHERE type IN ('Sorcerer', 'Curse');

-- 9) Curse characters only
SELECT *
FROM JJK_Characters
WHERE type = 'Curse';

-- 10) Top 4 strongest based on cursed energy
SELECT *
FROM JJK_Characters
ORDER BY cursed_energy DESC
LIMIT 4;