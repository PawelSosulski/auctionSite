/* Category tree */
/*
Motoryzacja id 1
	Samochody osobowe id 10
	Motocykle i Skutery id 11
	Dostawcze i Ciężarowe id 12
	Przyczepy id 13
	Części samochodowe id 14
	Części motocyklowe id 15
	Opony i Felgi id 16
	Sprzęt car audio id 17
	Pozostałe id 18

Nieruchomości id 2
	Mieszkania id 19
	Domy id 20
	Działki id 21
	Biura i Lokale id 22
	Garaże i Parkingi id 23
	Pozostałe id 24

Dom i Ogród id 3
	Meble id 25
	Sprzęt AGD id 26
	Zdrowie id 27
	Ogród id 28
	Narzędzia id 29
	Materiały budowlane id 30
	Ogrzewanie id 31
	Wyposażenie wnętrz id 32
	Pozostałe id 33

Elektronika id 4
	Telefony komórkowe id 34
	Akcesoria telefoniczne id 35
	Komputery id 36
	Tablety id 37
	Telewizory id 38
	Gry i Konsole id 39
	Sprzęt video id 40
	Sprzęt audio id 41
	Fotografia id 42
	Pozostałe id 43

Moda id 5
	Ubrania id 44
	Buty id 45
	Bielizna id 46
	Odzież ciążowa id 47
 	Dodatki id 48
	Biżuteria id 49
	Torebki id 50
	Zegarki id 51
	Kosmetyki i perfumy id 52
	Pozostałe id 53

Rolnictwo id 6
	Ciągniki id 54
	Maszyny rolnicze id 55
	Przyczepy id 56
	Części do maszyn rolniczych id 57
	Opony rolnicze id 58
	Produkty rolne id 59
	Pozostałe id 60

Dla dzieci id 7
	Zabawki id 61
	Wózki dziecięce id 62
	Akcesoria dla niemowlnąt id 63
	Ubranka dla dzieci id 64
	Buciki id 65
	Meble dla dzieci id 66
	Pozostałe id 67

Sport i Hobby id 8
	Rowery id 68
	Fitness id 69
	Sporty zimowe id 70
	Wędkarstwo id 71
	Turystyka id 72
	Sporty wodne id 73
	Odzież sportowa id 74
	Obuwie sportowe id 75
	Akcesoria jeździeckie id 76
	Pozostałe id 77

Muzyka i Edukacja id 9
	Książki id 78
	Muzyka id 79
	Filmy id 80
	Instrumenty id 81
 	Sprzęt muzyczny id 82
	Pozostałe id 83
*/
    
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('1', 'motoryzacja', 'Motoryzacja', '0');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('2', 'nieruchomosci', 'Nieruchomości', '0');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('3', 'dom i ogrod', 'Dom i Ogród', '0');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('4', 'elektronika', 'Elektronika', '0');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('5', 'moda', 'Moda', '0');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('6', 'rolnictwo', 'Rolnictwo', '0');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('7', 'dla dzieci', 'Dla dzieci', '0');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('8', 'sport i hobby', 'Sport i Hobby', '0');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('9', 'muzyka i edukacja', 'Muzyka i Edukacja', '0');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('10', 'samochody osobowe', 'Samochody osobowe', '1');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('11', 'motocykle i skutery', 'Motocykle i Skutery', '1');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('12', 'dostawcze i ciezarowe', 'Dostawcze i Ciężarowe', '1');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('13', 'przyczepy motoryzacja', 'Przyczepy', '1');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('14', 'czesci samochodowe', 'Części samochodowe', '1');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('15', 'czesci motocyklowe', 'Części motocyklowe', '1');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('16', 'opony i felgi', 'Opony i Felgi', '1');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('17', 'sprzet car audio', 'Sprzęt car audio', '1');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('18', 'pozostale motoryzacja', 'Pozostałe', '1');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('19', 'mieszkania', 'Mieszkania', '2');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('20', 'domy', 'Domy', '2');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('21', 'dzialki', 'Działki', '2');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('22', 'biura i lokale', 'Biura i Lokale', '2');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('23', 'garaze i parkingi', 'Garaże i Parkingi', '2');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('24', 'pozostale nieruchomosci', 'Pozostałe', '2');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('25', 'meble', 'Meble', '3');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('26', 'sprzet agd', 'Sprzęt AGD', '3');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('27', 'zdrowie', 'Zdrowie', '3');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('28', 'ogrod', 'Ogród', '3');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('29', 'narzedzia', 'Narzędzia', '3');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('30', 'materialy budowlane', 'Materiały budowlane', '3');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('31', 'ogrzewanie', 'Ogrzewanie', '3');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('32', 'wyposazenie wnetrz', 'Wyposażenie wnętrz', '3');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('33', 'pozostale dom i ogorod', 'Pozostałe', '3');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('34', 'telefony komorkowe', 'Telefony komórkowe', '4');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('35', 'akcesoria telefoniczne', 'Akcesoria telefoniczne', '4');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('36', 'komputery', 'Komputery', '4');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('37', 'tablety', 'Tablety', '4');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('38', 'telewizory', 'Telewizory', '4');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('39', 'gry i konsole', 'Gry i Konsole', '4');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('40', 'sprzet video', 'Sprzęt video', '4');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('41', 'sprzet audio', 'Sprzęt audio', '4');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('42', 'fotografia', 'Fotografia', '4');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('43', 'pozostale elektronika', 'Pozostałe', '4');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('44', 'ubrania', 'Ubrania', '5');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('45', 'buty', 'Buty', '5');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('46', 'bielizna', 'Bielizna', '5');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('47', 'odziez ciazowa', 'Odzież ciążowa', '5');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('48', 'dodatki', 'Dodatki', '5');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('49', 'bizuteria', 'Biżuteria', '5');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('50', 'torebki', 'Torebki', '5');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('51', 'zegarki', 'Zegarki', '5');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('52', 'kosmetyki i perfumy', 'Kosmetyki i Perfumy', '5');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('53', 'pozostale moda', 'Pozostałe', '5');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('54', 'ciagniki', 'Ciągniki', '6');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('55', 'maszyny rolnicze', 'Maszyny rolnicze', '6');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('56', 'przyczepy rolnicze', 'Przyczepy', '6');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('57', 'czesci do maszyn rolniczych', 'Części do maszyn rolniczych', '6');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('58', 'opony rolnicze', 'Opony rolnicze', '6');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('59', 'produkty rolne', 'Produkty rolne', '6');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('60', 'pozostale rolnictwo', 'Pozostałe', '6');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('61', 'zabawki', 'Zabawki', '7');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('62', 'wozki dzieciece', 'Wózki dziecięce', '7');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('63', 'akcesoria dla niemowlat', 'Akcesoria dla niemowląt', '7');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('64', 'ubranka dla dzieci', 'Ubranka dla dzieci', '7');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('65', 'buciki', 'Buciki', '7');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('66', 'meble dla dzieci', 'Meble dla dzieci', '7');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('67', 'pozostale dla dzieci', 'Pozostałe', '7');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('68', 'rowery', 'Rowery', '8');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('69', 'fitness', 'Fitness', '8');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('70', 'sporty zimowe', 'Sporty zimowe', '8');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('71', 'wedkarstwo', 'Wędkarstwo', '8');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('72', 'turystyka', 'Turystyka', '8');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('73', 'sporty wodne', 'Sporty wodne', '8');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('74', 'odziez sportowa', 'Odzież sportowa', '8');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('75', 'obuwie sportowe', 'Obuwie sportowe', '8');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('76', 'akcesoria jezdziecki', 'Akcesoria jeździeckie', '8');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('77', 'pozostale sport i hobby', 'Pozostałe', '8');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('78', 'ksiazki', 'Książki', '9');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('79', 'muzyka', 'Muzyka', '9');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('80', 'filmy', 'Filmy', '9');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('81', 'instrumenty', 'Instrumenty', '9');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('82', 'sprzet muzyczny', 'Sprzęt muzyczny', '9');
INSERT INTO `auction_db`.`categories` (`id`, `description`, `name`, `parent_id`) VALUES ('83', 'pozostale muzyka i edukacja', 'Pozostałe', '9');