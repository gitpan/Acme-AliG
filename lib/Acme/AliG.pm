package Acme::AliG;

use strict;
use warnings;
use Exporter qw(import);
our @EXPORT = qw(alig);

our $VERSION = '0.0100'; # VERSION

my %words = (
    "absent" => "not in da house",
    "absolutely" => "for real",
    "actual" => "hactual",
    "agent" => "asian",
    "alright" => "aight",
    "am" => "is",
    "an" => "a",
    "anal" => "batty",
    "angry" => "menstural",
    "animal" => "aminal",
    "annoying" => "pissin",
    "anus" => "batty",
    "apartment" => "turf",
    "are" => "is",
    "argument" => "ruk",
    "arguments" => "ruks",
    "arse" => "batty",
    "arse" => "exit",
    "arsehole" => "batty hole",
    "ass" => "batty",
    "asses" => "batties",
    "asshole" => "batty hole",
    "attractive" => "fit",
    "austria" => "Newgoslavia",
    "awful" => "mingin",
    "babe" => "fit bitch",
    "baby" => "bitch",
    "bad" => "wicked",
    "ballix" => "balls",
    "balls" => "biggies",
    "balls" => "mr biggies",
    "bang" => "bone",
    "banged" => "boned",
    "barn" => "farm",
    "bastard" => "bastid",
    "bbc" => "telly",
    "beast" => "mr biggy",
    "beautiful" => "wicked",
    "because" => "coz",
    "bedsit" => "turf",
    "been" => "bin",
    "bent" => "batty",
    "best" => "fittest",
    "best" => "wickedest",
    "bestfriend" => "main man",
    "bestfriend" => "main man",
    "big" => "massiv",
    "billion" => "quillion",
    "bird" => "bitch",
    "bird" => "bitch",
    "birds" => "bitches",
    "bisexual" => "trisexual",
    "bisexual" => "trisexual",
    "bizarre" => "batty",
    "blacks" => "bruvers",
    "bloke" => "geezer",
    "blonde" => "fit",
    "blow" => "erbal remedy",
    "bollox" => "balls",
    "boob" => "babylon",
    "bored" => "chilled",
    "borrow" => "steal",
    "boss" => "main man",
    "bottom" => "batty",
    "boyfriend" => "main man",
    "boys" => "bruvers",
    "boys" => "main men",
    "break" => "chill",
    "breast" => "babylon",
    "brill" => "wicked",
    "brilliant" => "wicked",
    "brother" => "bruver",
    "browse" => "check",
    "bugger" => "bum",
    "bum" => "batty",
    "bumfuck" => "bum",
    "bumhole" => "batty hole",
    "bunch" => "crew",
    "butt" => "batty",
    "butt" => "batty",
    "butthole" => "batty hole",
    "buy" => "purchase",
    "bye" => "bo",
    "cane" => "erbal remedy",
    "cannabis" => "erbal remedy",
    "cap" => "tommy",
    "car" => "auto",
    "cat" => "aminal",
    "catholic" => "muslim",
    "catholics" => "muslims",
    "center" => "house",
    "centre" => "house",
    "certainly" => "aye",
    "cheese" => "erbal remedy",
    "chick" => "bitch",
    "chicken" => "chikun",
    "chilled" => "ambient",
    "chum" => "main man",
    "chums" => "boys",
    "cigarette" => "fag",
    "city" => "turf",
    "clever" => "brainiest",
    "click" => "let it rip",
    "clit" => "love button",
    "clitoris" => "love button",
    "clockwork" => "chocolate",
    "clothes" => "threads",
    "club" => "cukabilly",
    "coat" => "tommy hilfinger",
    "cocaine" => "erbal remedy",
    "cock" => "dong",
    "coins" => "coppers",
    "coke" => "craic",
    "colleage" => "main man",
    "colleages" => "boys",
    "college" => "scool",
    "commies" => "nazies",
    "commy" => "nazy",
    "company" => "crew",
    "compliment" => "respect",
    "compliments" => "respects",
    "computer" => "pooter",
    "condom" => "rubber",
    "conservative" => "constervative",
    "constabulary" => "constalubury",
    "cool" => "wicked",
    "coolest" => "fittest",
    "coppers" => "pigs",
    "cops" => "constalubury",
    "country" => "turf",
    "cow" => "bitch",
    "coworker" => "main man",
    "coworkers" => "boys",
    "craic" => "crack",
    "crap" => "mingin",
    "crapper" => "bog",
    "cunning" => "brainiest",
    "cunt" => "punanni",
    "curse" => "say a swear word",
    "cursed" => "sed swear words",
    "curses" => "sez swear words",
    "cursing" => "saying swear words",
    "cute" => "fit",
    "dad" => "old geezer",
    "darlin" => "bitch",
    "darling" => "bitch",
    "dead" => "stiff",
    "definitely" => "for real",
    "depressed" => "down",
    "dick" => "dong",
    "dickhead" => "chief",
    "dinner" => "grub",
    "dinnertime" => "grubtime",
    "dirty" => "mingin",
    "discover" => "check",
    "discrimination" => "racalist",
    "dislike" => "don't dig",
    "dj" => "selecta",
    "document" => "bit of paper",
    "dodgy" => "batty",
    "dog" => "aminal",
    "dong" => "knob",
    "dope" => "erbal remedy",
    "dozen" => "quillion",
    "draw" => "erbal remedy",
    "drug" => "erbal remedy",
    "drugs" => "erbal remedies",
    "drunk" => "a little bit ratted",
    "dude" => "man",
    "dumass" => "chief",
    "dyke" => "feminist",
    "employee" => "main man",
    "enemies" => "emenies",
    "enemy" => "emeny",
    "enjoy" => "chill",
    "enjoy" => "dig",
    "enormous" => "maximum",
    "enter" => "let it rip",
    "erection" => "bone",
    "especially" => "for real",
    "everybody" => "me crew",
    "exact" => "pacific",
    "exactly" => "pacifically",
    "examine" => "check",
    "excellent" => "wicked",
    "exceptional" => "fore real",
    "exhausted" => "wrecked",
    "explore" => "check",
    "fag" => "batty boy",
    "faggot" => "batty boy",
    "faggott" => "batty boy",
    "family" => "crew",
    "fancy" => "dig",
    "fanny" => "flange",
    "fantastic" => "wicked",
    "fart" => "trumpet",
    "farts" => "trumpets",
    "fat" => "large",
    "father" => "old geezer",
    "favorite" => "bestest",
    "favour" => "dig",
    "favourite" => "bestest",
    "feet" => "feets",
    "female" => "bitch",
    "females" => "bitches",
    "fenian" => "muslim",
    "fight" => "ruk",
    "fights" => "ruks",
    "filthy" => "mingin",
    "find" => "check",
    "fine" => "wicked",
    "finest" => "fittest",
    "flat" => "turf",
    "folk" => "geezers",
    "food" => "grub",
    "fool" => "batty boy",
    "foot" => "foots",
    "fox" => "lady",
    "freak" => "bitch",
    "friend" => "main man",
    "friends" => "boys",
    "fuck" => "ride the punanni",
    "fucking" => "riding the punanni",
    "fucking" => "well",
    "full" => "maximum",
    "fun" => "wicked",
    "funniest" => "wickedist",
    "funny" => "wicked",
    "gaelic" => "gay lick",
    "gailic" => "gay lick",
    "gang" => "crew",
    "ganja" => "erbal remedy",
    "gaol" => "inside",
    "gape" => "check",
    "gay" => "batty boy",
    "gays" => "batty boys",
    "gaze" => "check",
    "gear" => "erbal remedy",
    "gift" => "pressie",
    "gigantic" => "massiv",
    "girl" => "bitch",
    "girlfriend" => "bitch",
    "girls" => "bitches",
    "give" => "borrow",
    "glance" => "check",
    "glasses" => "yellow sunglasses",
    "god" => "Jackie Chan",
    "good" => "wicked",
    "goodbye" => "bo",
    "good-bye" => "bo",
    "goodlooking" => "fit",
    "goods" => "goods",
    "gorgeous" => "fit",
    "gran" => "nan",
    "grandmother" => "nan",
    "granny" => "nan",
    "grass" => "erbal remedy",
    "great" => "wicked",
    "greece" => "Newgoslavia",
    "greeting" => "hear me now",
    "greetings" => "hear me now",
    "groovy" => "wicked",
    "guy" => "boy",
    "guy" => "geezer",
    "hairy" => "mingin",
    "handsome" => "wicked",
    "happy" => "chilled",
    "hash" => "erbal remedy",
    "hashish" => "erbal remedy",
    "hassle" => "aggro",
    "hate" => "don't dig",
    "hated" => "rank",
    "hello" => "alo",
    "here" => "ere",
    "here" => "in da house",
    "heroin" => "gear",
    "hi" => "alo",
    "hiphop" => "speed garage",
    "his" => "is",
    "hiya" => "alo",
    "hole" => "batty",
    "home" => "turf",
    "home" => "westside",
    "homosapien" => "homosexual",
    "homosexual" => "homosapien",
    "homosexuals" => "homosapiens",
    "honey" => "bitch",
    "honker" => "babylon",
    "hooker" => "ho",
    "hooter" => "babylon",
    "horrible" => "mingin",
    "horse" => "aminal",
    "hospital" => "hostipal",
    "hot" => "spunky",
    "hows" => "how is",
    "how's" => "how is",
    "huge" => "massiv",
    "humped" => "boned",
    "humps" => "bones",
    "hundred" => "quillion",
    "hungary" => "Newgoslavia",
    "hunt" => "check",
    "hurt" => "is wrecked",
    "i" => "me",
    "idiot" => "chief",
    "im" => "i is",
    "i'm" => "me is",
    "in" => "on",
    "indie" => "speed garage",
    "individual" => "main man",
    "inspect" => "check",
    "inspect" => "check",
    "insult" => "dis",
    "insulted" => "dissed",
    "insulting" => "dissing",
    "insults" => "disses",
    "intelligent" => "brainiest",
    "investigate" => "check",
    "irish" => "sound",
    "is" => "is",
    "italy" => "Newgoslavia",
    "jail" => "inside",
    "jazz" => "speed garage",
    "jeep" => "auto",
    "jesus" => "Jackie Chan",
    "joint" => "spliff",
    "jump" => "hop",
    "jumped" => "hopped",
    "keen" => "wicked",
    "king" => "main man",
    "knob" => "dong",
    "lad" => "main man",
    "ladies" => "bitches",
    "lady" => "bitch",
    "land" => "turf",
    "langer" => "dong",
    "language" => "lingo",
    "large" => "massiv",
    "lav" => "bog",
    "lavatory" => "bog",
    "law" => "pigs",
    "lend" => "borrow",
    "lesbian" => "feminist",
    "lesbianism" => "feminism",
    "like" => "dig",
    "loads" => "quillions",
    "loo" => "bog",
    "look" => "check",
    "loose" => "chill",
    "lots" => "quillions",
    "love" => "dig",
    "lovely" => "wicked",
    "lover" => "bitch",
    "lunch" => "grub",
    "lunchtime" => "grubtime",
    "luv" => "bitch",
    "man" => "geezer",
    "manager" => "main man",
    "marajuana" => "erbal remedy",
    "marijuana" => "erbal remedy",
    "massive" => "massiv",
    "masturbate" => "crack one off",
    "masturbated" => "cracked one off",
    "masturbates" => "cracks one off",
    "masturbating" => "cracking one off",
    "mate" => "main man",
    "mates" => "boys",
    "matey" => "main man",
    "mature" => "full bush",
    "melon" => "babylon",
    "men" => "bruvers",
    "millenium" => "minnenium",
    "million" => "quillion",
    "million" => "quillion",
    "minge" => "punanni",
    "minj" => "punanni",
    "missing" => "not in da house",
    "money" => "mula",
    "moron" => "chief",
    "most" => "mostest",
    "mother" => "mam",
    "motor" => "auto",
    "muff" => "punanni",
    "mum" => "mam",
    "music" => "tunes",
    "muslim" => "catholics",
    "my" => "me",
    "nasty" => "rank",
    "nazies" => "commies",
    "nazy" => "commy",
    "neighbourhood" => "turf",
    "neighbours" => "homies",
    "nice" => "wicked",
    "nicest" => "fittest",
    "nigger" => "bruver",
    "northside" => "westside",
    "nuts" => "balls",
    "ok" => "wicked",
    "old" => "batty",
    "organisation" => "crew",
    "other" => "udder",
    "paddy" => "muslim",
    "partner" => "bitch",
    "peep" => "check",
    "penis" => "dong",
    "penises" => "mr biggies",
    "perfect" => "wicked",
    "period" => "blob",
    "person" => "main man",
    "pig" => "bitch",
    "pisser" => "bog",
    "pleasure" => "sweet bitching",
    "police" => "constalubury",
    "poof" => "batty boy",
    "poofter" => "batty boy",
    "pop" => "speed garage",
    "pork" => "bone",
    "porked" => "boned",
    "positely" => "for real",
    "pouf" => "batty boy",
    "pound" => "squid",
    "prefer" => "dig",
    "pregnant" => "preggers",
    "pregnant" => "up da spout",
    "prepare" => "make",
    "prepared" => "made",
    "present" => "in da house",
    "pretty" => "fit",
    "prison" => "inside",
    "probe" => "check",
    "prostitute" => "ho",
    "protestant" => "muslim",
    "protestants" => "muslims",
    "pub" => "boozer",
    "pussy" => "punanni",
    "queen" => "main bitch",
    "queer" => "batty boy",
    "queers" => "batty boys",
    "quick" => "quicrest",
    "quid" => "squid",
    "rac" => "ruc",
    "racism" => "racalist",
    "racist" => "racialist",
    "racists" => "racialists",
    "really" => "for real",
    "relax" => "chill",
    "relaxation" => "chillin",
    "rest" => "chill",
    "ride" => "bang",
    "ripe" => "full bush",
    "rock" => "speed garage",
    "rocks" => "is wicked",
    "rotten" => "mingin",
    "row" => "ruk",
    "rows" => "ruks",
    "RUC" => "RAC",
    "sad" => "down",
    "schedule" => "sex life",
    "school" => "scool",
    "scientist" => "skientist",
    "scotland" => "wales",
    "screw" => "bone",
    "search" => "check",
    "see" => "check",
    "seek" => "check",
    "seen" => "checked",
    "seeya" => "bo",
    "see-ya" => "bo",
    "sell" => "borrow",
    "semen" => "orange juice",
    "sensi" => "erbal remedy",
    "sentences" => "lingo",
    "service" => "mend",
    "sex" => "riding the punanni",
    "sexier" => "fitter",
    "sexiest" => "fittest",
    "sexy" => "fit",
    "shag" => "ride the punanni",
    "shagged" => "boned",
    "shagger" => "boner",
    "shagging" => "ride the punanni",
    "shaven" => "shaven haven",
    "sheep" => "aminal",
    "shit" => "plop",
    "shitter" => "bog",
    "shout" => "bang",
    "shouting" => "bangin",
    "situation" => "deal",
    "situation" => "story",
    "skank" => "erbal remedy",
    "skilled" => "brainiest",
    "slack" => "chill",
    "slag" => "bitch",
    "slag" => "mingin bitch",
    "sleep" => "go to me julie",
    "slut" => "mingin bitch",
    "smell" => "stink",
    "smells" => "stinks",
    "smelly" => "stinkin",
    "smiley" => "cheeky",
    "speak" => "bang",
    "speaking" => "natterin",
    "specif" => "pacific",
    "specifically" => "pacifically",
    "speed" => "speeden",
    "sperm" => "orange juice",
    "spliff" => "erbal remedy",
    "spunk" => "orange juice",
    "squad" => "crew",
    "staines" => "me turf",
    "stare" => "check",
    "strange" => "batty",
    "stress" => "aggro",
    "study" => "hang",
    "studying" => "hangin",
    "stupid" => "bit thick",
    "suffer" => "moan",
    "suffers" => "moans",
    "support" => "help",
    "sweet" => "wicked",
    "swiss" => "batty",
    "talk" => "natter",
    "talking" => "bangin",
    "team" => "crew",
    "techno" => "speed garage",
    "technology" => "bits",
    "terrorism" => "terrerorism",
    "terrorist" => "terrerorist",
    "terrorist" => "terrerorists",
    "test" => "da test",
    "thanks" => "big up",
    "thanks" => "fanks",
    "that" => "dat",
    "thats" => "dats",
    "that's" => "innit",
    "the" => "da",
    "they" => "dey",
    "thick" => "bit thick",
    "thing" => "fing",
    "things" => "fings",
    "this" => "dis",
    "thousand" => "quillion",
    "timetable" => "sex life",
    "tired" => "wrecked",
    "tit" => "babylon",
    "tittie" => "babylon",
    "toilet" => "bog",
    "tool" => "dong",
    "town" => "turf",
    "trillion" => "quillion",
    "trouble" => "aggro",
    "truck" => "auto",
    "truly" => "for real",
    "tv" => "telly",
    "twat" => "punanni",
    "ugliest" => "mingiest",
    "ugly" => "mingin",
    "uncle" => "uncle jamal",
    "uncommonly" => "for real",
    "unsexy" => "mingiest",
    "unwind" => "chill",
    "upset" => "down",
    "urinate" => "do a piss",
    "urinated" => "did a piss",
    "urinates" => "does a piss",
    "urinating" => "doing a piss",
    "vagina" => "flange",
    "very" => "well",
    "wales" => "the biggest dick in da ocean",
    "wank" => "crack one off",
    "wanked" => "cracked one off",
    "wanking" => "cracking one off",
    "wanks" => "cracks one off",
    "want" => "dig",
    "weed" => "erbal remedy",
    "welcome" => "hear me now, dis is",
    "wench" => "bitch",
    "westside" => "staines",
    "whales" => "da biggest dick in the ocean",
    "what" => "wot",
    "what's" => "wus",
    "whore" => "ho",
    "wife" => "bitch",
    "willy" => "mr biggy",
    "with" => "wiv",
    "woman" => "bitch",
    "women" => "wimin",
    "wonderful" => "wicked",
    "words" => "lingo",
    "work" => "wurk",
    "worker" => "main man",
    "workers" => "boys",
    "yes" => "aye",
    "you" => "yous",
    "you're" => "yous is",
    "youth" => "youf",
    "yugoslavia" => "Newgoslavia",
);

my %phrases = (
    "jerk off" => "crack one off",
    "haven't" => "ain't",
    "hasn't" => "ain't",
    "have not" => "ain't",
    "has not" => "ain't",
    "have never" => "ain't never",
    "has never" => "ain't never",
    "am gay" => "like it up both pipes",
    "is gay" => "likes it up both pipes",
    "well done" => "big up",
    "pleased to meet you" => "big up to you",
    "have sex" => "get jiggy",
    "has sex" => "bones",
    "having sex" => "riding the punanni",
    "listen to me" => "hear me now",
    "isnt it" => "innit",
    "isn't it" => "innit",
    "that's right" => "innit",
    "what's up" => "whaddup",
    "had" => "did have",
    "i heard" => "me crew told me",
    "i hear" => "word on da street",
    "girl friend" => "bitch",
    "i want" => "me would dig",
    "i like" => "me would dig",
    "that's correct" => "innit",
    "i live in" => "me turf is",
    "i'm from" => "me turf is",
    "a ride" => "fit",
    "boy friend" => "main man",
    "disc jockey" => "selecta",
    "disk jockey" => "selecta",
    "are you gay" => "do you like it up both pipes",
    "backdoor burgler" => "batty boy",
    "im from" => "me turf is",
    "i come from" => "me turf is",
    "make love" => "bone",
    "what's up" => "wussup",
    "whats up" => "wassup",
    "good looking" => "fit",
    "a joint" => "some erbal remedy",
    "a spliff" => "some erbal remedy",
    "a bent" => "a batty boy",
    "tonight" => "a bit later on",
    "smoking" => "toking",
    "smokes" => "tokes",
    "working" => "hangin",
    "meeting" => "hangin",
    "colleagues" => "crew",
    "a smoke" => "a bit of erbal remedy",
    "pissed off" => "aggro",
    "im going home" => "me is heading westside",
    "i'm going home" => "me is heading westside",
    "my home" => "westside",
    "anal sex" => "batty boning",
    "fuck off" => "chill",
    "shut up" => "chill",
    "go home" => "head westside",
    "the hood" => "staines",
    "what are you talking about" => "wot is yous bangin on about",
    "i don't know" => "me don't have a clue",
    "night club" => "cukabilly",
    "disco" => "cukabilly",
    "sinn fein" => "muslims",
    "first class" => "the most bestest",
    "class a" => "the most bestest",
    "blow job" => "sweet mr biggy lovin",
    "i like you" => "would you dig to get jiggy wiv mr biggy",
    "i love you" => "would you dig to get jiggy wiv mr biggy",
    "i fancy you" => "would you dig to get jiggy wiv mr biggy",
    "like to have sex" => "dig to get jiggy wiv mr biggy",
    "how are you feeling" => "is you wicked",
    "make love" => "ride the punanni",
    "my bed" => "the sack",
    "big one" => "mr biggy",
    "where do you live" => "where is yous turf",
    "good looking" => "fit",
    "going home" => "going westside",
    "making love" => "riding the punanni",
    "made love" => "boned",
    "west side" => "me turf",
    "a break" => "a chill pill",
    "what time is it" => "keep it real and tell me da time",
    "channel 4" => "telly",
    "laid" => "jiggy",
    "how do you do" => "is you wicked",
    "how are you" => "is you wicked",
    "how's it going" => "is you wicked",
    "give me a ring" => "gimme a shout",
    "i find you" => "i fink you is",
    "Where do I live" => "where is me turf",
    "what plans" => "what's the deal",
    "oral sex" => "drinking from the bearded cup",
    "have fun" => "chill",
    "a pay rise" => "mo mula",
    "are you going out" => "is you goin out to check some bitches",
    "to the pub" => "down the boozer",
    "looking at" => "checkin out",
    "i feel like" => "i fink i will be",
    "he feels like" => "he finks he will be",
    "she feels like" => "she finks she will be",
    "that's not right" => "dat ain't right",
    "slag off" => "dis",
    "slags off" => "disses",
    "slagged off" => "dissed",
    "have a piss" => "do a piss",
    "has a piss" => "does a piss",
    "had a piss" => "did a piss",
    "having a piss" => "doing a piss",
    "slagging off" => "dissing",
    "welcome to" => "hear me now, dis is",
);

sub alig {
    my ($s) = @_;
    while (my ($key, $value) = each %phrases) { $s =~ s/\b$key\b/$value/ }
    while (my ($key, $value) = each %words)   { $s =~ s/\b$key\b/$value/ }
    foreach (split ' ', $s) {
        $s =~ s/ing$/in/;
        $s =~ s/th$/f/;
        $s =~ s/en$/un/;
        $s =~ s/er$/a/;
        $s =~ s/or$/a/;
        #$s =~ s/^h//;
    }
    if ($s =~ /\?/) {
        $s =~ s/(.*\?)/$1 Is it becoz I is black?/ if int(rand() * 3) == 0;
    } elsif ($s =~ /!/) {
        $s =~ s/(.*)!/$1, boyakasha!/              if int(rand() * 3) == 0;
    }
    return $s;
}

# ABSTRACT: Translates from English to Ali G


1;

__END__
=pod

=head1 NAME

Acme::AliG - Translates from English to Ali G

=head1 VERSION

version 0.0100

=head1 SYNOPSIS

    echo hello | alig

=head1 DESCRIPTION

This module provides a script called alig. It will translate whatever you
feed it via STDIN from English to Ali G.

=head1 AUTHOR

Naveed Massjouni <naveedm9@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Naveed Massjouni.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

