--The database scheme consists of four tables:
--Product(maker, model, type)
--PC(code, model, speed, ram, hd, cd, price)
--Laptop(code, model, speed, ram, hd, screen, price)
--Printer(code, model, color, type, price)
--The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

#1
--Find the model number, speed and hard drive capacity for all the PCs with prices below $500.
--Result set: model, speed, hd.
===================
SELECT model, speed, hd FROM PC 
WHERE price < 500

#2
--List all printer makers.
--Result set: maker.
===================
SELECT DISTINCT maker FROM product
WHERE type = 'printer'

#3
--Find the model number, RAM and screen size of the laptops with prices over $1000.
===================
SELECT model, ram, screen FROM laptop
WHERE price >1000

#4
--Find all records from the Printer table containing data about color printers.
===================
SELECT * FROM printer
WHERE color = 'y'

#5
--Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
===================
SELECT model, speed, hd FROM pc
WHERE price<600 AND (cd='12x' OR cd ='24x')

#6
--For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops.
--Result set: maker, speed.
===================
SELECT DISTINCT maker, speed FROM product
JOIN laptop ON product.model = laptop.model
WHERE hd>=10

#7
--Get the models and prices for all commercially available products (of any type) produced by maker B.
===================
SELECT a.model, price FROM (SELECT model FROM product
WHERE maker = 'B') as a JOIN
(SELECT model, price FROM pc
UNION SELECT model, price FROM laptop
UNION SELECT model, price FROM printer) as b
ON a.model = b.model

#8
--Find the makers producing PCs but not laptops.
===================
SELECT maker FROM product
WHERE type='pc'
EXCEPT
SELECT maker FROM product
WHERE type='laptop'

#9
--Find the makers of PCs with a processor speed of 450 MHz or more.
--Result set: maker.
===================
SELECT DISTINCT maker FROM product
JOIN pc ON product.model = pc.model
WHERE speed >=450

#10
--Find the printer models having the highest price.
--Result set: model, price.
===================
SELECT model, price FROM printer
WHERE price = (SELECT MAX (price) FROM printer)

#11
--Find out the average speed of PCs.
===================
SELECT AVG(speed) as avg_speed FROM pc

#12
--Find out the average speed of the laptops priced over $1000.
===================
SELECT AVG(speed) as avg_speed FROM laptop
WHERE price > 1000

#13
--Find out the average speed of the PCs produced by maker A.
===================
SELECT AVG(speed) as avg_speed FROM pc
JOIN product ON product.model = pc.model
WHERE maker = 'A'

--The database of naval ships that took part in World War II is under consideration. The database consists of the following relations:
--Classes(class, type, country, numGuns, bore, displacement)
--Ships(name, class, launched)
--Battles(name, date)
--Outcomes(ship, battle, result)
--Ships in classes all have the same general design. A class is normally assigned either the name of the first ship built according to the corresponding design, or a name that is different from any ship name in the database. The ship whose name is assigned to a class is called a lead ship.
--The Classes relation includes the name of the class, type (can be either bb for a battle ship, or bc for a battle cruiser), country the ship was built in, the number of main guns, gun caliber (bore diameter in inches), and displacement (weight in tons). The Ships relation holds information about the ship name, the name of its corresponding class, and the year the ship was launched. The Battles relation contains names and dates of battles the ships participated in, and the Outcomes relation - the battle result for a given ship (may be sunk, damaged, or OK, the last value meaning the ship survived the battle unharmed).
--Notes: 1) The Outcomes relation may contain ships not present in the Ships relation. 2) A ship sunk can’t participate in later battles. 3) For historical reasons, lead ships are referred to as head ships in many exercises.4) A ship found in the Outcomes table but not in the Ships table is still considered in the database. This is true even if it is sunk.

#14
--For the ships in the Ships table that have at least 10 guns, get the class, name, and country.
===================
SELECT b.class, name, country FROM classes as a
JOIN ships as b ON a.class = b.class
WHERE numGuns >= 10

#15
--Get hard drive capacities that are identical for two or more PCs.
--Result set: hd.
===================
SELECT hd FROM pc
GROUP BY hd
HAVING count(hd)>=2

#16
--Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i).
--Result set: model with the bigger number, model with the smaller number, speed, and RAM.
===================
SELECT DISTINCT a.model, b.model, a.speed, a.ram FROM pc as a, pc as b
WHERE a.model > b.model AND a.speed = b.speed AND a.ram = b.ram

#17
--Get the laptop models that have a speed smaller than the speed of any PC.
--Result set: type, model, speed.
===================
SELECT DISTINCT type, x.model, speed FROM product
JOIN (SELECT model, speed FROM laptop
WHERE speed < ALL (SELECT speed FROM pc)) x
ON product.model = x.model

#18
--Find the makers of the cheapest color printers.
--Result set: maker, price.
===================
SELECT DISTINCT maker, price FROM product
JOIN printer ON product.model = printer.model
WHERE color = 'y'
AND price = (SELECT MIN(price) FROM printer
WHERE color = 'y')

#19
--For each maker having models in the Laptop table, find out the average screen size of the laptops he produces.
--Result set: maker, average screen size.
===================
SELECT maker, AVG(screen) AS avg_sreen FROM product
JOIN laptop ON
product.model = laptop.model
GROUP BY maker

#20
--Find the makers producing at least three distinct models of PCs.
--Result set: maker, number of PC models.
===================
SELECT maker, COUNT(model) count_model FROM product
WHERE type = 'pc'
GROUP BY maker
HAVING COUNT(model) >=3

#21
--Find out the maximum PC price for each maker having models in the PC table.
--Result set: maker, maximum price.
===================
SELECT maker, MAX(price) max_price FROM product
JOIN pc ON product.model = pc.model
GROUP BY maker

#22
--For each value of PC speed that exceeds 600 MHz, find out the average price of PCs with identical speeds.
--Result set: speed, average price.
===================
SELECT speed, AVG (price) FROM pc
WHERE speed > 600
GROUP BY speed

#23
--Get the makers producing both PCs having a speed of 750 MHz or higher and laptops with a speed of 750 MHz or higher.
--Result set: maker
===================
SELECT maker FROM product
JOIN (SELECT model FROM pc
WHERE speed >= 750) a ON product.model = a.model
WHERE type='pc'
INTERSECT
SELECT maker FROM product
JOIN (SELECT model FROM laptop
WHERE speed >= 750) b ON product.model = b.model
WHERE type='laptop'
