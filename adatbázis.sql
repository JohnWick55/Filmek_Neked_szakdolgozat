-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Jún 29. 09:09
-- Kiszolgáló verziója: 10.4.19-MariaDB
-- PHP verzió: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `m4u`
--
CREATE DATABASE IF NOT EXISTS `m4u` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `m4u`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `feladat`
--

CREATE TABLE `feladat` (
  `feladatid` int(11) NOT NULL,
  `filmid` int(11) NOT NULL,
  `szemelyid` int(11) NOT NULL,
  `megnevezes` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `feladat`
--

INSERT INTO `feladat` (`feladatid`, `filmid`, `szemelyid`, `megnevezes`) VALUES
(2, 1, 3, 'színész'),
(3, 1, 2, 'színész'),
(4, 1, 4, 'rendező'),
(5, 2, 5, 'színész'),
(6, 2, 6, 'színész'),
(7, 2, 7, 'színész'),
(8, 2, 8, 'rendező'),
(9, 3, 9, 'színész'),
(10, 3, 10, 'színész'),
(11, 3, 11, 'színész'),
(12, 3, 12, 'rendező'),
(13, 4, 13, 'színész'),
(14, 4, 14, 'színész'),
(15, 4, 15, 'színész'),
(16, 5, 16, 'színész'),
(17, 5, 17, 'színész'),
(18, 5, 18, 'színész'),
(19, 5, 19, 'rendező'),
(20, 6, 20, 'színész'),
(21, 6, 21, 'színész'),
(22, 6, 22, 'színész'),
(23, 7, 23, 'színész'),
(24, 7, 24, 'színész'),
(25, 7, 25, 'színész'),
(26, 7, 26, 'rendező'),
(27, 8, 20, 'színész'),
(28, 8, 22, 'színész'),
(29, 8, 30, 'színész'),
(30, 8, 20, 'színész'),
(31, 8, 22, 'színész'),
(32, 8, 30, 'színész'),
(33, 8, 32, 'rendező'),
(34, 10, 33, 'színész'),
(35, 10, 34, 'színész'),
(36, 10, 35, 'színész'),
(37, 10, 36, 'rendező'),
(38, 6, 32, 'rendező'),
(39, 4, 37, 'rendező'),
(40, 11, 38, 'színész'),
(41, 11, 39, 'színész'),
(42, 11, 40, 'rendező'),
(43, 12, 41, 'színész'),
(44, 12, 42, 'színész'),
(45, 12, 43, 'színész'),
(46, 12, 37, 'rendező'),
(47, 13, 44, 'rendező'),
(48, 13, 45, 'színész'),
(49, 13, 46, 'színész'),
(50, 13, 47, 'színész'),
(51, 14, 26, 'rendező'),
(52, 14, 41, 'színész'),
(53, 14, 33, 'színész'),
(54, 14, 48, 'színész'),
(55, 15, 49, 'rendező'),
(56, 15, 50, 'színész'),
(57, 15, 51, 'színész'),
(58, 15, 52, 'színész'),
(59, 16, 53, 'színész'),
(60, 16, 54, 'színész'),
(61, 16, 55, 'színész'),
(62, 16, 56, 'rendező');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `id` int(11) NOT NULL,
  `felhasznev` varchar(30) NOT NULL,
  `jelszo` varchar(250) NOT NULL,
  `email` varchar(40) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `felhasznev`, `jelszo`, `email`, `admin`) VALUES
(17, 'Admin01', '3CEDBE825E44D66E896DC40B185D94BA146F4A82C6C464663BDE4BA420BBB0BDB2AED7B91835363D7CBC1CA6E5B56FE7AACA86692A245B5B23BAA02A2B43FC5A', 'admin@gmail.com', 1),
(22, 'Felhasznalo3', 'AB553623D229226CE36628513B66176959ECAAA5A491D7DCDBB3A7363699F46EBEDDDF6C35CA95595BAD3B4F2BAF34457B2779B53E02B7F65C710CE84BE4A512', 'felhasznalo3@gmail.com', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `filmek`
--

CREATE TABLE `filmek` (
  `filmid` int(11) NOT NULL,
  `filmcim` varchar(50) NOT NULL,
  `kiadas_eve` int(11) NOT NULL,
  `ismerteto` varchar(2000) NOT NULL,
  `ertekeles` float NOT NULL,
  `filmhossz` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `filmek`
--

INSERT INTO `filmek` (`filmid`, `filmcim`, `kiadas_eve`, `ismerteto`, `ertekeles`, `filmhossz`) VALUES
(1, 'A keresztapa', 1973, 'A gengszterfilmek legnagyobbika, világhírű színészek és rendező munkája, minden idők egyik legnagyobb szabású maffiafilmje, a Keresztapa. A történet bemutatja azokat az embereket és azt a gépezetet, ami az olasz maffiában gyökerezve, a világ leghatalmasabb és legrettegettebb hatalmává vált az Egyesült Államokban. Figyelemmel követhetjük a kegyetlen, gyilkos módszereket, amivel a Corleone család feje dolgozik. Tanúi lehetünk a hihetetlen összetartásnak, az érdekek és a félelem összetartó erejének, ami ezt a világot jellemzi. Emberek sorsa, élet és halál kérdése dől el Don Vito Corleone dolgozószobájában. Egyesek védelemért fordulnak a nagyúrhoz, mások hadüzenettel érkeznek. A rivális maffia, a Tattaglia család ugyanis végső leszámolásra szólította fel a Corleone családot. S a hadüzenet után az egész város lángba borul.', 9.2, '2 óra 55 perc'),
(2, 'Star Wars III. rész - A Sith-ek bosszúja', 2005, 'A tanács Obi-Wan Kenobit (Ewan McGregor) bízza meg azzal, hogy felkutassa és a törvény színe elé hozza őket a klónháború felelőseit. Ezalatt Palpatine szenátor (Ian McDiarmid) egyre nagyobb hatalomra tesz szert, létrehozza a Galaktikus Birodalmat. A szenátor közvetlen társaságában Anakin (Hayden Christensen) egyre nehezebben tud ellenállni Palpatine befolyásának, aki mindent elkövet, hogy a fiatal jedit a sötét oldalra csábítsa.', 7.5, '2 óra 20 perc'),
(3, 'A remény rabjai', 1994, '1946-ban egy Andy Dufresne nevű bankárt - noha makacsul hangoztatja ártatlanságát - kettős gyilkosság elkövetése miatt életfogytiglani börtönbüntetésre ítélnek. Dufresne egy Maine állambeli büntetés-végrehajtó intézetbe kerül és hamar meg kell ismerkedjen a börtönélet kegyetlen mindennapjaival, a szadista börtönszemélyzettel, a szinte elállatiasodott rabokkal. Azonban Andy nem törik meg. A bankéletben szerzett tapasztalatai segítségével elnyeri az őrök kegyét és azzal, hogy elvállalja egyik rabtársa illegális akcióiból származó bevételeinek könyvelését, kivívja társai elismerését is. Cserébe viszont lehetőséget kap a börtön könyvtár fejlesztésére, ezzel némi emberi méltóságot csempészve a keserű körülmények között élő rabok mindennapjaiba.', 9.3, '2 óra 22 perc'),
(4, 'A sötét lovag', 2008, 'Batman (Christian Bale), Gordon felügyelő (Gary Oldman) és a megvesztegethetetlen ügyész, Harvey Dent (Aaron Eckhart) hatásos hadjáratot indítanak a bűnözők ellen. Önként vállalt feladatukat már-már siker koronázza, ám ekkor megjelenik Joker (Heath Ledger), aki a bűnözők között is rettegett, ravaszabb és veszélyesebb bárkinél. A városban újra a félelem az úr, kitör a káosz, és mindenkit megfertőz a romlottság.', 9, '2 óra 20 perc'),
(5, 'Schindler listája', 1993, 'Oskar Schindler (Liam Neeson) a második világháború során a németek által megszállt Lengyelországba kerül, ahol jó kapcsolatai és ügyeskedése révén megszerez egy gyárat. Zsidó származású könyvelője tanácsára kezd el zsidókat alkalmazni az üzemben, amely kiváló üzleti húzásnak tűnik, ám egy sokkal fontosabb oka is van: az alkalmazásába álló családokat így meg tudja menteni a deportálástól és a biztos haláltól. Az igaz történeten alapuló film egy megható történet arról, hogy egy ember is meg tudja változtatni a történelem menetét, ha képes az önfeláldozásra.', 8.9, '3 óra 15 perc'),
(6, 'A Gyűrűk Ura: A király visszatér ', 2003, 'Gandalf (Ian McKellen) Pipinnel (Billy Boyd) Gondorba vágtat, hogy Denethort (John Noble) felkészítse Szauron túlerejével szemben. Théoden király (Bernard Hill) összevonja seregeit Gondor segélyhívására. Aragorn (Viggo Mortensen) végül vállalja sorsát, és hű társaival harcba szólítja a hegyek közt élő holtakat. Középfölde sorsa azonban egészen máshol fog eldőlni. Frodó (Elijah Wood) és Samu (Sean Astin) a Hatalom gyűrűjével Mordor sötét útvesztőit járja. De minél közelebb kerülnek a Végzet hegyéhez, Frodót annál jobban húzza a Gyűrű szörnyű súlya. A világ sorsa egy apró hobbit kezében van, aki kétséges, hogy ellen tud állni a legnagyobbakat is legyőző kísértésnek.', 8.9, '3 óra 21 perc'),
(7, 'Ponyvaregény', 1994, 'Adott két idősödő, szabad szájú, tökös, szimpatikus gengszter, Vincent (John Travolta) és Jules (Samuel L. Jackson), akik igyekeznek főnöküknek visszaszerezni egy aktatáskát. Ehhez persze meg kell ölniük pár embert, de ez az egyszerű bérgyilkosokkal gyakran megesik. Jules a rá célzott golyókat csodával határos módon elkerüli, s ezt jelnek tekintvén úgy dönt, felhagy eddigi életével. Társának viszont el kell vinnie szórakozni a gengszterfőnök feleségét... Van továbbá egy boxoló, Butch (Bruce Willis), aki a hírhedt marffiafőnök, Marselleus Wallace (Ving Rhames) átvágását tervezi. Hogy-hogy nem, odáig fajul a történet, hogy végül már inkább a megmentésére készül, mint a lelövésére... Nem utolsósorban, pedig, van egy piti rabló-párosunk is (Tim Roth és Amanda Plummer), akik éppen egy étterem kirablására készülnek. Ám ott reggelizik Vincent és Jules.', 8.9, '2 óra 34 perc'),
(8, 'A Gyűrűk Ura: A gyűrű szövetsége', 2001, 'Frodó (Elijah Wood), az ifjú hobbit egy gyűrűt kap Bilbótól, amiről kiderül, hogy az Egy Gyűrű, mellyel a Sötétség Ura rabszolgasorba taszíthatja Középfölde népeit. Gandalf (Ian McKellen) Völgyzugolyba küldi Frodót, ahol a tündék legbölcsebb vezetője, Elrond dönt a gyűrű sorsáról. Nincs más lehetőség, a gyűrűt el kell pusztítani Mordorban, a Végzet-katlanban. A szabadnépek tanácsán megújul a Szövetség, és Gandalf vezetésével Frodó és társai, a dúnadán Aragorn (Viggo Mortensen), a tünde Legolas (Orlando Bloom), Gimli, a törp (John Rhys-Davies), és Boromir, az emberek képviseletében, nekivágnak a reménytelen küldetésnek. A jövő attól függ, hogyan alakul a szövetség sorsa.', 8.8, '2 óra 58 perc'),
(10, 'Harcosok klubja', 1999, 'Jack terápiás csoportokba jár, mégsem kerül közelebb önmagához és embertársaihoz. Összebarátkozik Tylerrel, aki egy különös, titkos társaság megalapításával próbál úrrá lenni a világ káoszán. A Harcosok klubjának híre hamar elterjed az egyre intenzívebb élményekre vágyó yuppie-k között. A fiúk barátságának Marla vet véget, aki kétségbe vonja Tyler erőltetetten férfias ideológiáját.', 8.8, '2 óra 19 perc'),
(11, 'Forrest Gump', 1994, 'A georgiai Savannah városka árnyas buszmegállójában különös mesemondó üldögél. Forrest Gump mindent látott és mindent átélt, de nem mindent értett. Nem éppen a legfényesebb elme. De hát az anyja is mindig azt mondta: \"Csak az a hülye, aki hülyeséget csinál.\" Forrest Gump pedig semmi egyebet nem csinált, mint jelen volt a XX. század minden fontos eseményén a focipályától a harctérig, az elnökök klubjától a médiavitákig, míg végül meg nem pihent egyetlen igaz szerelme karjában. Forrest Gump IQ-ja nem szárnyal az egekig, de rendkívül becsületes és jólelkű fiú. Különös véletlenek azonban hozzásegítik, hogy az 1950-es évektől 1970-ig Amerika minden jelentős eseményén részt vegyen, és minden jelentős személyiségével találkozzon, köztük: Elvis Presley-vel, JFK-vel, Lyndon Johnsonnal, Richard Nixonnal. Forrest elvégzi a főiskolát, harcol Vietnamban, élsportoló lesz, az egyetlen probléma csak az, hogy túl buta ahhoz, hogy megértse ezen fontos események jelentőségét.', 8.8, '2 óra 22 perc'),
(12, 'Eredet', 2010, 'Dom Cobb (Leonardo DiCaprio) az ipari kémkedés legzseniálisabb bűnözője, aki mások álmait szerzi meg. Amikor áldozata az álomfázisba jut, ő belopózik az elméjükbe, és hozzáfér a legtitkosabb információkhoz is. Saito (Ken Watanabe) visszautasíthatatlan és életveszélyes ajánlattal keresi fel. Egy gondolatot kell elültetnie a haldokló milliárdos, Maurice Fisher (Pete Postlethwaite) fiának, Robert Fischernek (Cillian Murphy) tudatalattijába úgy, hogy a célszemély halálos védelmi rendszerrel felvértezett elméje ne kaphassa el. Legjobb emberét, Arthurt (Joseph Gordon-Lewitt) bízza meg a csapat összeállításával.', 8.8, '2 óra 28 perc'),
(13, 'A Birodalom visszavág', 1980, 'Egy párhuzamos világegyetem Bégaméni nevű falvában egy elnyomott törzs az égiekhez könyörög, hogy szabadítsák fel őket Zotan, a kannibál önkényúr diktatúrája alól. A valódi világ Párizs nevű világvárosában Remy Bassano (Benoit Poelvoorde), a visszahúzódó és jelentéktelen restaurátor egy nap leforgása alatt elveszíti megélhetését és a felesége is elhagyja. A szülei házában próbál menedéket keresni, de egy időkapu magába szippantja... és egyszeriben Bégaméniben találja magát. Az őslakosok rég várt felszabadítójukat látják benne, és ettől a pillanattól fogva az élete egy csapásra megváltozik. A két világ között lavírozva próbálja meg hol kisszerű életének morzsáit összeszedegetni, hol újdonsült népét felszabadítani, s háborút vívni Zotán hordái ellen. A különös alaphelyzetből egy igazán eredeti francia vígjáték bontakozik ki.', 8.7, '2 óra 4 perc'),
(14, 'Volt egyszer egy... Hollywood', 1900, '1969, Los Angeles. Egy munka nélkül maradt, western tévésorozatából kikerült, munkanélküli színész (Leonardo DiCaprio) és jó barátja, kaszkadőre (Brad Pitt) együtt próbálnak boldogulni Hollywood kegyetlen világában.', 7.6, '2 óra 41 perc'),
(15, 'Tom és Jerry', 2021, 'A világ leghíresebb macska-egér párosa, akik soha nem hagyjá abba a vetélkedést és verekedést.', 5.2, '1 óra 41 perc'),
(16, 'A nyolcadik utas: a Halál', 1979, 'A Nostromo űrhajó a hazatérés helyett a képernyőn villogó pont nyomába ered. Váratlan küldetésük egy kihalt bolygóra vezeti őket, ahol egy elhagyott űrhajót találnak, belsejében számtalan, tojás alakú kapszulával. Miközben óvatosan próbálják feltárni az űrsikló titkát, az egyik tojásból hirtelen kirobban egy lény és rátapad Kane (John Hurt) arcára, aki teljesen megbénul. Miután Kane visszanyeri az eszméletét és csatlakozik a többiekhez, megdöbbentő dolog történik. Kane testéből egy szörny kel ki, amely sorra végez az űrhajósokkal. Ripley (Sigourney Weaver) azonban nem törődik bele a halálba.', 8.4, '1 óra 57 perc');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `filmkategoriak`
--

CREATE TABLE `filmkategoriak` (
  `id` int(11) NOT NULL,
  `kategid` int(11) NOT NULL,
  `filmid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `filmkategoriak`
--

INSERT INTO `filmkategoriak` (`id`, `kategid`, `filmid`) VALUES
(1, 9, 1),
(3, 1, 2),
(4, 13, 2),
(5, 6, 3),
(6, 1, 4),
(7, 9, 4),
(8, 6, 4),
(9, 6, 5),
(10, 15, 5),
(11, 1, 6),
(12, 2, 6),
(13, 6, 6),
(14, 9, 7),
(15, 6, 7),
(16, 1, 8),
(17, 2, 8),
(18, 6, 8),
(19, 6, 10),
(20, 6, 11),
(21, 12, 11),
(22, 1, 12),
(23, 2, 12),
(24, 13, 12),
(25, 1, 13),
(26, 2, 13),
(27, 13, 13),
(28, 16, 14),
(29, 6, 14),
(30, 3, 15),
(31, 16, 15),
(32, 7, 16),
(33, 13, 16),
(34, 6, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `filmlista`
--

CREATE TABLE `filmlista` (
  `id` int(11) NOT NULL,
  `filmid` int(11) NOT NULL,
  `felhasznid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `filmlista`
--

INSERT INTO `filmlista` (`id`, `filmid`, `felhasznid`) VALUES
(44, 2, 17),
(45, 5, 17),
(56, 4, 17),
(57, 7, 17),
(61, 2, 22),
(62, 3, 22);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoria`
--

CREATE TABLE `kategoria` (
  `kategid` int(11) NOT NULL,
  `kategorianev` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `kategoria`
--

INSERT INTO `kategoria` (`kategid`, `kategorianev`) VALUES
(1, 'Akció'),
(2, 'Kaland'),
(3, 'Animációs'),
(4, 'Rajzfilm'),
(5, 'Dokumentumfilm'),
(6, 'Dráma'),
(7, 'Horror'),
(8, 'Thriller'),
(9, 'Krimi'),
(10, 'Kult'),
(11, 'Némafilm'),
(12, 'Romantikus'),
(13, 'Sci-fi'),
(14, 'Fantasy'),
(15, 'Történelmi'),
(16, 'Vígjáték'),
(17, 'Musical');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szemelyek`
--

CREATE TABLE `szemelyek` (
  `szemelyid` int(11) NOT NULL,
  `nev` varchar(60) NOT NULL,
  `nem` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `szemelyek`
--

INSERT INTO `szemelyek` (`szemelyid`, `nev`, `nem`) VALUES
(1, 'Marlon Brando', 1),
(2, 'Al Pacino', 1),
(3, 'James Caan', 1),
(4, 'Francis Ford Coppola', 1),
(5, 'Hayden Christensen', 1),
(6, 'Natalie Portman', 0),
(7, 'Ewan McGregor', 1),
(8, 'George Lucas', 1),
(9, 'Tim Robbins', 1),
(10, 'Morgan Freeman', 1),
(11, 'Bob Gunton', 1),
(12, 'Frank Darabont', 1),
(13, 'Christian Bale', 1),
(14, 'Heath Ledger', 1),
(15, 'Aaron Eckhart', 1),
(16, 'Liam Neeson', 1),
(17, 'Ralph Fiennes', 1),
(18, 'Ben Kingsley', 1),
(19, 'Steven Spielberg', 1),
(20, 'Elijah Wood', 1),
(21, 'Viggo Mortensen', 1),
(22, 'Ian McKellen', 1),
(23, 'John Travolta', 1),
(24, 'Uma Thurman', 0),
(25, 'Samuel L. Jackson', 1),
(26, 'Quentin Tarantino', 1),
(30, 'Orlando Bloom', 1),
(32, 'Peter Jackson', 1),
(33, 'Brad Pitt', 1),
(34, 'Edward Norton', 1),
(35, 'Meat Loaf', 1),
(36, 'David Fincher', 1),
(37, 'Christopher Nolan', 1),
(38, 'Tom Hanks', 1),
(39, 'Robin Wright', 0),
(40, 'Robert Zemeckis', 1),
(41, 'Leonardo DiCaprio', 1),
(42, 'Joseph Gordon-Levitt', 1),
(43, 'Elliot Page', 0),
(44, 'Irvin Kershner', 1),
(45, 'Mark Hamill', 1),
(46, 'Harrison Ford', 1),
(47, 'Carrie Fisher', 0),
(48, 'Margot Robbie', 0),
(49, 'Tim Story', 1),
(50, 'Chloë Grace Moretz', 0),
(51, 'Michael Peña', 0),
(52, 'Colin Jost', 1),
(53, 'Sigourney Weaver', 1),
(54, 'Tom Skerritt', 1),
(55, 'John Hurt', 1),
(56, 'Ridley Scott', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tartalmak`
--

CREATE TABLE `tartalmak` (
  `borito_utv` varchar(200) NOT NULL,
  `kepek_utv` varchar(200) NOT NULL,
  `elozetes` varchar(400) NOT NULL,
  `filmid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `tartalmak`
--

INSERT INTO `tartalmak` (`borito_utv`, `kepek_utv`, `elozetes`, `filmid`) VALUES
('godfather2.jpg', 'godfather_pics1.jpg,godfather_pics2.jpg', 'https://www.youtube.com/watch?v=kTlhEX0kmL8', 1),
('sw3.jpg', 'sw3_pics1.jpg,sw3_pics2.jpg', 'https://www.youtube.com/watch?v=5UnjrG_N8hU', 2),
('remenyrabjai.jpg', 'remenyrabjai_pics1.jpg,remenyrabjai_pics2.jpg', 'https://www.youtube.com/watch?v=P9mwtI82k6E', 3),
('sotetlovag.jpg', 'sotetlovag_pics1.jpg,sotetlovag_pics2.jpg', 'https://www.youtube.com/watch?v=TQfATDZY5Y4', 4),
('schindlerlistaja.jpg', 'schindlerlistaja_pics1.jpg,schindlerlistaja_pics2.jpg', 'https://www.youtube.com/watch?v=mxphAlJID9U', 5),
('gyuruk_ura_a_kiralyvisszater.jpg', 'gyuruk_ura_a_kiralyvisszater_pics1.jpg,gyuruk_ura_a_kiralyvisszater_pics2.jpg', 'https://www.youtube.com/watch?v=mxphAlJID9U', 6),
('ponyvaregeny.jpg', 'ponyvaregeny_pics1.jpg,ponyvaregeny_pics2.jpg', 'https://www.youtube.com/watch?v=tGpTpVyI_OQ', 7),
('gyuruk_ura_a_gyuru_szov.jpg', 'gyuruk_ura_a_gyuru_szov_pics1.jpg,gyuruk_ura_a_gyuru_szov_pics2.jpg', 'https://www.youtube.com/watch?v=_nZdmwHrcnw', 8),
('fight_club.jpg', 'fight_club_pics1.jpg,fight_club_pics2.jpg', 'https://www.youtube.com/watch?v=dfeUzm6KF4g', 10),
('forestgump.jpg', 'forestgump3.jpg,forestgump2.jpg,forestgump1.jpg', 'https://www.youtube.com/watch?v=LPKOTSn9CaM', 11),
('eredet.jpg', 'eredet3.jpg,eredet2.jpg,eredet1.jpg', 'https://www.youtube.com/watch?v=koiMqY-Jc3c', 12),
('swesb.jpg', 'swesb2.jpg,swesb1.jpg', 'https://www.youtube.com/watch?v=JNwNXF9Y6kY', 13),
('voltegyszeregyhollywood.jpg', 'voltegyszeregyhollywood1.jpg', 'https://www.youtube.com/watch?v=IHKhymQpDEs', 14),
('tomesjerry.jpg', 'tomesjerry1.jpg', 'https://www.youtube.com/watch?v=KW8fGRTFWKc', 15),
('alien.png', 'alien1.jpg', 'https://www.youtube.com/watch?v=jeVx31tcWc0', 16);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `feladat`
--
ALTER TABLE `feladat`
  ADD PRIMARY KEY (`feladatid`),
  ADD KEY `filmid` (`filmid`),
  ADD KEY `szemelyid` (`szemelyid`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `filmek`
--
ALTER TABLE `filmek`
  ADD PRIMARY KEY (`filmid`),
  ADD UNIQUE KEY `filmcim` (`filmcim`);

--
-- A tábla indexei `filmkategoriak`
--
ALTER TABLE `filmkategoriak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filmid` (`filmid`),
  ADD KEY `kategid` (`kategid`);

--
-- A tábla indexei `filmlista`
--
ALTER TABLE `filmlista`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filmid` (`filmid`),
  ADD KEY `felhasznid` (`felhasznid`);

--
-- A tábla indexei `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`kategid`);

--
-- A tábla indexei `szemelyek`
--
ALTER TABLE `szemelyek`
  ADD PRIMARY KEY (`szemelyid`),
  ADD UNIQUE KEY `nev` (`nev`);

--
-- A tábla indexei `tartalmak`
--
ALTER TABLE `tartalmak`
  ADD PRIMARY KEY (`filmid`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `feladat`
--
ALTER TABLE `feladat`
  MODIFY `feladatid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT a táblához `filmek`
--
ALTER TABLE `filmek`
  MODIFY `filmid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `filmkategoriak`
--
ALTER TABLE `filmkategoriak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT a táblához `filmlista`
--
ALTER TABLE `filmlista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT a táblához `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `kategid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `szemelyek`
--
ALTER TABLE `szemelyek`
  MODIFY `szemelyid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT a táblához `tartalmak`
--
ALTER TABLE `tartalmak`
  MODIFY `filmid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `feladat`
--
ALTER TABLE `feladat`
  ADD CONSTRAINT `feladat_ibfk_1` FOREIGN KEY (`filmid`) REFERENCES `filmek` (`filmid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `feladat_ibfk_2` FOREIGN KEY (`szemelyid`) REFERENCES `szemelyek` (`szemelyid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `filmkategoriak`
--
ALTER TABLE `filmkategoriak`
  ADD CONSTRAINT `filmkategoriak_ibfk_1` FOREIGN KEY (`filmid`) REFERENCES `filmek` (`filmid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `filmkategoriak_ibfk_2` FOREIGN KEY (`kategid`) REFERENCES `kategoria` (`kategid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `filmlista`
--
ALTER TABLE `filmlista`
  ADD CONSTRAINT `filmlista_ibfk_1` FOREIGN KEY (`filmid`) REFERENCES `filmek` (`filmid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `filmlista_ibfk_2` FOREIGN KEY (`felhasznid`) REFERENCES `felhasznalok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `tartalmak`
--
ALTER TABLE `tartalmak`
  ADD CONSTRAINT `tartalmak_ibfk_1` FOREIGN KEY (`filmid`) REFERENCES `filmek` (`filmid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
