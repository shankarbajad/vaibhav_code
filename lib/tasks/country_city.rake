namespace :country_city do
  desc "Create Countries and their Cities"
  task create_country_and_cities: :environment do
  	CS.countries.each do |key, value| 
  		# map country name and code
  		country = Country.create(code: key, name: value)

  		# map country related cities name and code
  		CS.states(country.code.downcase).keys.flat_map { |state| CS.cities(state, country.code) }.each do |city|
  			country.cities.create(name:city, code: city)
  		end
  	end
  	country = Country.find_by_name("Aruba")
		["Angochi",	"Arasji",	"Babijn",	"Barcelona",	"Blumond",	"Boton",	"Brasil",	"Bringamosa",	"Bubali",	"Butucu",	"Calabas",	"Camacuri",	"Canashito",	"Cas Ariba",	"Cas di Paloma",	"Cashero",	"Casibari",	"Catashi",	"Catiri",	"Ceru Colorado",	"Cobo Lodo",	"Cunucu Abao",	"Cura Cabai",	"Dacota",	"Daimari",	"Eagle Beach",	"Fontein",	"Gasparito",	"Jamanota",	"Jan Flemming",	"Juwana Morto",	"Lago Colony",	"Largo Cadushi",	"Macuarima",	"Madiki",	"Mahuma",	"Marawiel",	"Maria Mai",	"Modansa",	"Mon Pos",	"Morgenster",	"Noord",	"Noord Cura Cabai",	"Oranjestad (capital)",	"Palm Beach",	"Parkietenbos",	"Piedra Plat",	"Plantersrust",	"Ponton",	"Pos Abao",	"Pos Chiquito",	"Rooi Afo",	"Rooi Prikichi",	"San Nicolas",	"Santa Cruz",	"Savaneta",	"Sero Blanco",	"Shabiruri",	"Shiribana",	"Tamarijn",	"Tanki Flip",	"Tanki Lender"].map{ |city|	[country.cities.create(name:city, code: city)] }
    
    country = Country.find_by_name("Anguilla")
    ["The Valley",   "Blowing Point Village",    "Cannifist",    "Cauls Bottom",   "Chalvilles",   "Crocus Hill",    "Deep Waters",    "East End",   "East End Village",   "Ebenezer",   "George Hill",    "Island Harbour",   "Junks Hole",   "Little Dicks",   "Little Dix",   "Long Bay Village",   "Long Ground",    "Betty Hill",   "Lower South Hill",   "Mahogany Tree",    "Mount Fortune",    "North Hill Village",   "North Side",   "Rey Hill",   "Saint Mary's",   "Sandy Ground Village",   "Shoal Bay Village",    "Shoal Village",    "South Hill Village",   "Stoney Ground",    "The Copse",    "The Farrington",   "The Forest",   "The Quarter",    "Long Path"].map{ |city| [country.cities.create(name:city, code: city)] }
    
    country = Country.find_by_name("Antarctica")
    ["McMurdo Station"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Åland")
    ["Mariehamn", "Jomala", "Finström", "Lemland",  "Saltvik",  "Hammarland", "Sund", "Eckerö", "Föglö",  "Brändö"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Saint-Barthélemy")
    ["Gustavia"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Bonaire")
    ["Kralendijk",  "Dorp Antriol", "Upper Hell's Gate",  "Dorp Rincón",  "Dorp Tera Kora", "Oranjestad", "Golden Rock",  "The Bottom", "Windward Side",  "Saint John's Flat"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Cook Islands")
    ["Avarua",    "Amuri",    "Omoka",    "Roto",   "Tauhunu"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Curaçao")
    ["Willemstad",    "Sint Michiel Liber",   "Barber",   "Dorp Soto",    "Newport",    "Sabana Westpunt",    "Dorp Sint Willebrordus",   "Lagún"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Djibouti")
    ["Djibouti City", "Ali Sabieh", "Tadjourah",  "Obock",  "Dikhil", "Arta", "Holhol", "Dorra",  "Galafi", "Loyada", "Alaili Dadda"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Falkland Islands")
    ["Stanley",  "Goose Green", "Port Howard"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Federated States of Micronesia")
    ["Chuuk",  "Kosrae", "Pohnpei",  "Yap"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Faroe Islands")
    ["Tórshavn",    "Klaksvík",   "Hoyvík",   "Argir",    "Vágur",    "Fuglafjørður",   "Vestmanna",    "Tvøroyri",   "Sørvágur",   "Kollafjørður"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Mayotte")
    ["Mamoudzou","Dzaoudzi","Dembeni","Koungou","Pamandzi ","Bandraboua","Mtsamboro","Sada","Mont Bénara","Tsingoni","Mayotte ","Acoua","Bandraboua","Bandrele ","Bouéni","Chiconi ","Chirongui ","Dembeni ","Dzaoudzi","Kani-Kéli ","Koungou","Mamoudzou ","Mtsamboro ","M'Tsangamouji ","Ouangani","Pamandzi ","Sada ","Tsingoni","Dzaoudzi Pamandzi International Airport ","Acoua","M'Tsangamouji  ","Chiconi ","Chirongui","Eastern Africa ","Lac Zeánn","Mayotte","Chissioua Mtsamboro","Bandrélé","Bouéni","Kani Kéli","Île Pamandzi","Mont Ouchongui","Chissioi M’Zamboro","Îlot Mognameri","Mirereni ","Rassi Douamougno","Sisoa Bouzi","Chissioi Bandele","Mtsahara"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Kosovo")
    ["Pristina ","Prizren ","Mitrovica","Kosovo","Peć ","Ferizaj","Suva Reka","Gjakovë ","Gnjilane","Glogovac", "Gjeravica ","Deçan","Peskovi", "Vrtop","Karanikolica ","Gornji Lab","Dragash ","Podujevo ","Marijash", "Malo Kosovo ", "Pristina International Airport Adem Jashari ", "Gjakova ", "Gjilan","Mitrovica ","Pec ","Pristina ","Prizren ","Ferizaj ", "Zhiti","Zhaq ","Vushtrri ","Vushtrri ","Vriqec","Vraniq","Komuna e Vitisë ","Vitina","Gjurgjevik i Madh","Komuna e Ferizajt","Trnava", "Trđevac","Komuna e Mitrovicës ","Svetlje","Suvo Grlo","Komuna e Thërandës ","Krushevo",  "Krushevo", "Krpimej","Kamenica","Kosovo Polje ","Kojuš"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Wallis and Futuna")
      ["Mata-Utu ","Utufua  ","Liku","Falaleu  ","Alele ","Wallis and Futuna","Vaitupu","Mont Singavi","Sigavé ","Halalo  ","Ahoa","Circonscription d'Uvéa ","Circonscription de Sigavé","Circonscription d'Alo  ","Akaka","Pointe Vele Airport ","Hihifo Airport  ","Alo","Wallis Islands ","Vailala","Wallis Island","Tufuone","Teesi ","Kolopopo ","Haatofo ","Gahi ","Futuna Island ","Fineveke ","Île Nukuaéta","Mua ","Mua","Les Deux Lions","Îles de Horne","Île Alofi ","Pointe Tufumal","Nukula’ela’e","Nukufetau","Mont Lulu Fakahega","Lac Kikila","Lac Alofivai","Polynesia ","Vaiapuaka","Kaha","Vailepo","Fuvalu","Fatai","Falemei","Puko","Kau’utu","Vaonoa"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("British Virgin Islands")
      ["Road Town","British Virgin Islands  ","Mount Sage","Virgin Gorda Airport ","Terrance B. Lettsome International Airport","Auguste George Airport","Windy Hill","Virgin Gorda Island","Tortola ","Norman Island","Caribbean ","The Settlement  ","Spanish Town ","Scrub Island","Sandy Spit ","Sandy Cay ","Salt Island ","Saba Rock ","Pelican Island","Mosquito Island","Marina Cay","Little Cay ","Little Camanoe","The Indians ","Green Cay ","Great Dog Island ","Ginger Island","George Dog Island ","Eustatia Island ","East Seal Dog  ","Diamond Cay ","Dead Chest ","Cooper Island ","Cockroach Island ","Buck Island ","Bellamy Cay ","Beef Island","The Baths","Peter Island ","Necker Island ","Nanny Cay ","Little Jost Van Dyke Island","Little Anegada Island  ","Jost Van Dyke Island","Guana Island ","Great Tobago Island","Great Thatch Island ","Great Camanoe Island","Fallen Jerusalem","Dog Islands "].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Vatican City")
      ["Vatican City","Vatican City","Southern Europe ","St. Peter's Basilica ","Vatican City Heliport","Vatican museum ","Saint Peter's Square","Vatican Radio ","Sistine Chapel","Vatican Railway Station","Viale Centro del Bosco","Piazza di Santa Maria","Ethiopian Seminary","Civil Administration Building","Palace of Justice","Chuch of St Stephen","Piazza Pio XII","Church of St Anne","Vatican City Post Office","Belvedere Courtyard","Pigna Courtyard","Torre San Giovanni","Audience Hall","Vatican Radio Centre"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("U.S. Minor Outlying Islands")
      ["U.S. Minor Outlying Islands ","Midway Atoll","Navassa Island","Baker Island","Howland Island","Jarvis Island ","Johnston Atoll  ","Kingman Reef  ","Midway Islands","Palmyra Atoll ","Johnston Atoll","Kingman Reef","Palmyra Atoll","Pacific Remote Islands Marine National Monument","Navassa Island National Wildlife Refuge ","Henderson Field / Midway Atoll Airport  ","Wake Island  wikipedia article","Wake Island Airfield ","Serranilla Bank  ","Bajo Nuevo Bank ","Baker Island","Howland Island","Jarvis Island","Midway Islands","Wake Island","Baker Island National Wildlife Refuge","Center Lagoon","East Lagoon","Howland Island National Wildlife Refuge","Jarvis US National Wildlife Refuge","Meyerton pre-WW2  wikipedia article","West Lagoon","Japanese Wilkes Landing Site WW2","Japanese Wake Landing Sites WW2","US Fish and Wildlife Service 1996","Johnston Atoll National Wildlife Refuge","Pacific Remote Islands Marine National Monument","Pacific Remote Islands Marine National Monument","Pacific Remote Islands Marine National Monument","Pacific Remote Islands Marine National Monument","Pacific Remote Islands Marine National Monument","Pacific Remote Islands Marine National Monument","Kingman Reef National Wildlife Refuge","Palmyra Atoll National Wildlife Refuge","Northwestern Hawaiian Islands Marine National Monument","UNESCO Heritage Site Northwestern Hawaiian Islands","Battle of Midway WW2","Battle of Wake Island WW2","Kita Island","US Air Force Airfield "].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Tonga")
      ["Nuku'alofa ","Tonga ","South Pacific Ocean ","Neiafu","Pangai ","Haveluloto","Vaini","‘Ohonua","Hihifo","Vava‘u ","Tongatapu ","Ha‘apai","ʻEua ","Niuas  ","Kaufana Airport ","Mata'aho Airport ","Niuatoputapu Airport ","Vava'u International Airport ","Fuaʻamotu International Airport ","Salote Pilolevu Airport ","Vava‘u Island","Vava‘u Islands Group","Polynesia","Niuatoputapu Island","Niuafo‘ou","Niuatoputapu","Niuafo'ou","Vaipoa ","Vaimalo ","‘Utulau  ","Toku Island ","Tofua Island ","Tafahi Island","Sisia","Pukutala ","Pangaimotu Island","Ovalau ","Nukunamu Island","Nukuleka","Nomuka Iki Island","Niutoua","Muitoa ","Mui Hopohoponga Point","Malapo ","Lotofoa  ","Lifuka Island ","Koulo ","Kolovai ","Kolonga "].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Tokelau")
    ["Atafu", "Nukunonu", "Fale old settlement"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Turks and Caicos Islands")
    ["Cockburn Town", "Cockburn Harbour"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Sint Maarten")
    ["Cul de Sac", "Philipsburg"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("South Sudan")
    ["Juba",  "Malakal",  "Wau",  "Pajok",  "Yei",  "Yambio", "Aweil",  "Gogrial",  "Rumbek", "Bor"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Svalbard and Jan Mayen")
    ["Longyearbyen",  "Barentsburg",  "Sveagruva",  "Ny", "Olonkinbyen",  "Pyramiden"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Réunion")
    ["Saint-Denis", "Saint-Paul", "Saint-Pierre", "Le Tampon",  "Saint-André",  "Saint-Louis",  "Le Port",  "Saint-Benoît", "Saint-Joseph", "Sainte-Marie"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Palau")
    ["Koror", "Koror Town", "Kloulklubed",  "Ulimang",  "Mengellang", "Angaur", "Ngchesar Hamlet",  "Melekeok Village", "Ngchemiangel", "Ngerkeai"].map{ |city| [country.cities.create(name:city, code: city)] }

    Country.find_by_name("Palestine").destroy
    Country.find(728).destroy

    country = Country.find_by_name("Puerto Rico")
    ["San Juan",  "Bayamón",  "Carolina", "Ponce",  "Caguas", "Guaynabo", "Mayaguez", "Trujillo Alto",  "Arecibo",  "Fajardo "].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Niue")
    ["Alofi", "Hakupu", "Avatele", "Mutalau", "Tuapa", "Lakepa", "Makefu", "Liku", "Hikutivake", "Fatiau"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Nauru")
    ["Arijejen",  "Yaren District", "Baitsi District",  "Anabar", "Uaboe",  "Ijuw"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Norfolk Island")
    ["Kingston"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Montserrat")
    ["Brades", "Cork Hill", "Salem", "Saint John's Village", "Gerald's"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Martinique")
    ["Fort-de-France", "Le Lamentin", "Le Robert", "Sainte-Marie", "Le François", "Ducos", "Saint-Joseph", "La Trinité", "Rivière-Pilote", "Le Gros-Morne"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Macao")
    ["Zhuhai", "Jiangmen", "Shenzhen", "Daliang", "Dongguan", "Foshan", "Guangzhou", "Huizhou", "Zhaoqing", "Yangjiang", "Wuzhou", "Chaozhou", "Maoming", "Shaoguan", "Rongcheng", "Shantou", "Zhanjiang", "Haikou", "Ganzhou", "Beihai", "Liuzhou", "Hengyang", "Nanning", "Pingxiang", "Zhuzhou"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Marshall Islands")
    ["Majuro", "Ebaye", "Arno", "Jabor", "Wotje", "Mili", "Namdrik", "Ebon", "Kili", "Likiep"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Madagascar")
    ["Antananarivo",  "Toamasina",  "Antsirabe",  "Fianarantsoa", "Mahajanga",  "Toliara",  "Antsiranana",  "Antanifotsy",  "Ambovombe",  "Ambilobe"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Saint Martin")
    ["Marigot"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Monaco")
    ["Monaco", "Monte Carlo", "La Condamine", "Fontvieille", "Saint-Roman", "Moneghetti "].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Cayman Islands")
    ["George Town", "West Bay", "Bodden Town", "East End", "North Side"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("North Korea")
    ["Pyongyang", "Hamhung", "Namp’o", "Hŭngnam", "Kaesong", "Wonsan", "Chongjin", "Sariwŏn", "Sinuiju", "Haeju"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Jersey")
    ["Newark", "Jersey City", "Paterson", "Elizabeth", "Edison", "Toms River", "Clifton", "Trenton", "Camden", "Brick Township"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("British Indian Ocean Territory")
    ["Diego Garcia"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Isle of Man")
    ["Douglas", "Ramsey", "Peel", "Port Erin", "Castletown", "Laxey"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Guam")
    ["Dededo Village", "Yigo Village", "Tamuning-Tumon-Harmon Village", "Mangilao Village", "Barrigada Village", "Santa Rita", "Mongmong-Toto-Maite Village", "Chalan Pago-Ordot Village", "Yona Village", "Agat Village"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Guadeloupe")
    ["Les Abymes", "Baie-Mahault", "Le Gosier", "Petit-Bourg", "Sainte-Anne", "Le Moule", "Sainte-Rose", "Capesterre-Belle-Eau", "Pointe-à-Pitre", "Lamentin"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Gibraltar")
    ["Gibraltar", "Catalan", "Catalan Bay", "Catalan Bay Village", "Gibilterra", "Rosia", "Caleta", "Waterport"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("Guernsey")
    ["St Peter Port", "Sark", "La Seigneurie"].map{ |city| [country.cities.create(name:city, code: city)] }

    country = Country.find_by_name("French Guiana")
    ["Cayenne", "Matoury",  "Saint-Laurent-du-Maroni",  "Kourou", "Rémire-Montjoly",  "Macouria", "Mana", "Apatou", "Grand-Santi",  "Sinnamary"].map{ |city| [country.cities.create(name:city, code: city)] }
  end	
end
