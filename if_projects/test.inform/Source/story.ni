"The Clock Ticks for You" by "Hung Nguyen".
Release along with a website. Release along with an interpreter.
Release along with the source text.

[Variables & Constructor]
Sunset is a time that varies. Sunset is 7:30 PM.
Sunrise is a time that varies. Sunrise is 6:00 AM.
Time of death is a time that varies. Time of death is 7:00 AM.
Started is a truth state that varies. Started is false.
Introspection counter is a number that varies. The introspection counter is 0.
Will to leave is truth state that varies. Will to leave is false.
Life satisfaction is a number that varies. Life satisfaction is 1.
Life dissatisfaction is a number that varies. Life dissatisfaction is 1. [From GDC talk by Ingold]
Happiness is a number that varies. Happiness is 50.
Use analog is a truth state that varies. Use analog is true. [TODO: could also use love mom]
Time changed by clock is a truth state that varies. Time changed by clock is false.
Seen clock is a truth state that varies. Seen clock is false.
Clock counter is a number that varies. Clock counter is 0.
Stopped reading is a truth state that varies. Stopped reading is false. 
You regain composure is an action applying to nothing.
Regained composure is a truth state that varies. Regained composure is false.
Shredded is a truth state that varies. Shredded is false.
Viewed laptop is a truth state that varies. Viewed laptop is false.

Table of Letter
Line (indexed text)	EOF (truth state)
"'Babe, I love you.
[line break]The words ‘I[’]m sorry’ was scribbled out, but you can still see it underneath the ink marks. ‘Thank you. For everything. For all the loving moments.’"	False
"‘I[’]m sorry that I must leave you early. I’m sorry I must leave our child motherless early. [if use analog is true]But I know he will grow up to be amazing regardless; you certainly did.'[otherwise]'I can only hope I was a better mother to him, than yours was to you.'"	False
"'Still, Be his friend and his dad. Take him to the baseball games or buy him makeup; whatever he’s into.'"	False
"'Love him. Love him again. Love him twice, so he can feel my love, too.’[line break]The text becomes a blur as your eyes water and your hands shake.[line break][italic type]Breathe.[roman type] You don't want to keep reading."	False
"Still, you wipe away the tears, and read on. ‘Lastly, mourn for me. Cry, punch, scream, write; whatever you need. [line break]Then move on.'"	False
"'I will always love you; but please, move on. For yourself, for me, for our child. [line break]Forever yours. [line break]Your wife, [line break][line break]Kate In-young Dessalegn.'[line break]"	True

[Prefabs]
Nighttime is a scene. Nighttime begins when the time of day is after sunset. Nighttime ends when the time of day is sunrise.
A window is a kind of thing that is fixed in place. The description of a window is "Outside, Manhattan
[if nighttime is happening]looks like a sea of fireflies, blinking[otherwise]glitters gold[end if] beneath you.
Everything is perfect.".

[Verbs/ synonyms]
Understand "sink into [something]" and "sit down" as entering.
[TODO: make music a real thing >:D]
Understand "chair" as armchair.
Understand "close eyes", "breathe", "wait here", and "close  your eyes" as waiting.
Understand "look around" as looking.
Understand "view [something]" as examining.
Understand the command "read" as something new. Understand "read [something]" as reading. Reading is an action applying to one thing. 
Understand the command "tear" as something new. Understand "tear [something]" as tearing. Tearing is an action applying to one thing.
Understand "tap [something]" as touching.
Understand the command "kill" as something new. Understand "kill [something]" as killing. Killing is an action applying to one thing.

[Start]
When play begins:
	now the command prompt is "What do you do this moment? >";
	now the time of day is 6:30 PM;
	Say "[italic type]Is this the real life?[line break]Is this just fantasy?[line break]Caught in a landslide[line break]No escape from reality...[roman type]";
	Say "[line break]cw: euthanasia, depression".

[Update]
Every turn:
	If time changed by clock is false and seen clock is true:
		Let X be a random number from 1 to 30;
		Let Y be the time of day plus x minus 1 minutes;
		Now the time of day is Y;
		[say "It's been [X in words] minutes. It is [time of day in words].";]
	otherwise:
		now time changed by clock is false;
	Now happiness is (100 * life satisfaction) / (life satisfaction + life dissatisfaction); 
	If time of day is greater than time of death, and time of day is before 12:00 PM:
		say "It's time..."; [TODO: change the ending statements depending on some variables]
		end the story.

[Rooms]
Bedroom is a room.  The description is "Your bed is perfectly made. Outside the window, you can see
[if nighttime is happening]the beautiful Manhattan skyline at night like a million stars[otherwise]the sun setting on the Manhattan skyline, bleeding orange onto you[end if].
The living room lies to the north of your bedroom." [TODO Change the backdrop scenery]
Living Room is a room. The description is "[if introspection counter < 4]Mostly bare, just the way you wanted it yesterday.[otherwise if introspection counter is 4]Mostly bare, but it's beginning to remind you of something.[otherwise]The room is filled with the objects of your life.[end if] An armchair sits dead center, facing the window. [if seen clock is true]The clock ticks, signaling the passage of time.[end if] The bedroom lies to the south[if will to leave is true], and a door lies to the east[end if]." It is north of the Bedroom. [TODO: changes the description when it starts filling up]
Hallway is a room. "It's pitch black. The light from the living room behind you isn't doing anything at all.". [It is east of the Living Room.]
The Space of Reflection is a room. "You shouldn't be here. Your head hurts." It is east of the Hallway.

[Items/Instance objects]
The description of a thing is usually "[The noun] looks just the way you remembered it.".
A bed is a thing in Bedroom. It is an enterable supporter and fixed in place. The description is "Tidy and perfect; you probably could sink into it."[Verb: sinking into] [TODO: change fake doors to real doors]
The bedroom window is a window in Bedroom. [Enables photoframe]
The living room window is a window in Living Room. [Enables photoframe]
The armchair is a thing in the Living Room. The armchair is an enterable supporter and fixed in place. The description is "It's a perfect replica of the same one your grandfather owned. It even smells of old cigarette smoke."
The clock is a thing and fixed in place. The description is "Well, time sure flies. The clock reads [if use analog is true][time of day in words][otherwise][time of day][end if].". The clock is nowhere.
The desk is a supporter and fixed in place. The desk is nowhere. The description is "A clear, wooden desk, popular back in the 2030[']s.  You picked it out when you first got your own place. It brings back so many memories."
The shredder is a container on the desk and fixed in place. The description is "Despite its small size, this shredder will blend almost anything into dust."
The laptop is a thing on the desk and fixed in place.  The description is "An old laptop. It's a perfect replica of your university's Surface Air, and you're reminded how old you are when you realized it doesn't support air touch; instead, you can only tap it."
The letter is a thing on the desk. The description is "Your wife[’]s cursive handwriting is difficult to read. Despite having read it a million times, you want to read it again.".
The shredded letter is a thing. The description is "This is what[']s left of your letter."

[Interactions/Rules]
Before examining yourself:
	say "You look down at yourself. You're wearing your best Sunday clothes, but it feels like wearing pajamas."; [TODO: change this to reflect your life satisfaction]
	stop the action.
Before looking:
	if started is false:
		now started is true;
		say "You mentally turn off Queen from playing in your head.
				[line break][italic type]It's old and overplayed,[roman type] you thought to yourself and get out of bed.".
Before entering the bed:
	say "You fall onto the bed, as it engulfs you. [line break]Ah. It's soft. You could stay here forever.";
	if introspection counter is greater than 4:
		say "You close your eyes, [run paragraph on]";
		if happiness > 70:
			say "and enter a peaceful slumber. You had been loved, you had loved. Death comes naturally, and it just happens to be your turn. [run paragraph on]";
		otherwise if happiness > 49:
			say "realizing you didn't amount to much in your life. [italic type]Just a victim of circumstance, [roman type]you thought to yourself. [run paragraph on]";
		otherwise if happiness > 30:
			say "crying. You miss them so much. Everyone you loved, dying one by one. [italic type]Everyone dies.[roman type] It[']s your turn. [run paragraph on]";
		otherwise if happiness > 0:
			say "but only for a brief moment to imagine a large syringe of pentobarbital. You reach for it and plunged it into your heart. You close your eyes, and made sure the full dose of pentobarbital enters your bloodstream.";
		end the story;
		say "You won[']t wake again.";
	otherwise:
		say "[line break]You get up again, though. [italic type]There's a time and place for everything. But not now.";
	stop the action.
Entering armchair is being reminiscient. Touching armchair is being reminiscient.
Before being reminiscient: [TODO: make gendered memories or choices]
	if introspection counter is 0:
		say "You touch the fabric of the chair, and memories of being with your family flood back to you. You sit down. The smoky smell reminds you of your grandfather, and the way he always smiled at you when you walked by. You lean back and close your eyes to take in a deep breath. Your grandfather passed when you were fifteen. It'll be your turn soon. [line break]You open your eyes and turn towards your room, wanting to look around."; [TODO: add something that changes base on nighttime]
		Increase introspection counter by 1;[should now be 1]
		move the player to the armchair;
		stop the action.
Before looking in the Living Room:
	if introspection counter is 1:
		Say "You wanted this room earlier today. It reminds you of the emptiness of life, and your impending death.
					[line break]You just want to close your eyes and wait here.";
		Increase introspection counter by 1; [should now be 2]
		stop the action;
	otherwise if introspection counter is 4:
		continue the action.
Before waiting:
	if introspection counter is 2:
		say "[italic type]Breathe,[roman type] you tell yourself. In the silence, the clock ticks.";
		Increase introspection counter by 1; [should now be 3]
		Now the clock is in the Living Room;
	otherwise:
		say "You wait, patiently.".
Examining the clock is checking the time. Reading the clock is checking the time.
Before checking the time:
	Increase clock counter by 1;
	Now time changed by clock is true;
	Let X be a random number from 1 to 60;
	Let Y be the time of day plus x minus 1 minutes;
	Now the time of day is Y;
	If clock counter is greater than 4:
		say "Life is composed of moments, unmeasurable by any clock.";
	if clock counter is greater than 5:
		say "[italic type]The more conscious we are of our time left, the less time we actually end up having.[roman type]";
	If seen clock is false:
		Increase introspection counter by 1; [should now be 4]
		Now seen clock is true;
		say "Your mother taught you how to read an analog clock; [italic type]how 21st century she was. [roman type]Do you remember how to read an analog clock?[run paragraph on]";
		if player consents:
			say "She was a good teacher, despite not being a good mother.
				[line break]You take a deep breath. Still, you miss her. Her laughter was contagious. Her love, although conditional, was abundant. She wouldn’t want to see you like this.
				[line break][line break]You miss her.[line break][line break]";
			Now use analog is true;
			Increase life satisfaction by 1;
		otherwise:
			say "The memory of your mother makes your blood boil; she was never there for you. She was a terrible teacher, and an even worse mother. She stopped making dinner for the family when you were 6. She stopped picking you up from school when you were 9. She forgot your 13th birthday, and every birthday after that.
					[line break][italic type]    Breathe.[roman type][line break]Her birth date is July 29th, 2003.
					[line break][italic type]    Breathe.[roman type][line break]She’s a Leo. Your grandfather was also a Leo. You miss him.
					[line break][italic type]    Breathe.[roman type][line break]You regain some composure, as your mind wandered back to him."; [TODO: haven't done anything here]
			Now use analog is false;
			Increase life dissatisfaction by 2;
		if use analog is true:
			say "With your mother in your mind and heart, you're reminded that you have until [time of death in words] tomorrow morning, when you, too, will pass and join her.";
		otherwise:
			say "With your grandfather in your mind and heart, you're reminded that you have until [time of death] tomorrow, when you, too, will pass and join him.";
		continue the action;
	otherwise if introspection counter is 4:
		say "Ah, time. For thousands of years, humankind worried about their limited lifespan. But no more. In the last century, the advancements in medicine have allowed wealthy people to streamline the ability to live forever. The layman[’]s explanation? The cells are told to stop aging, and failed organs are replaced with artificial ones.[line break]
			[line break]And it was a simple decision, really. 
			[line break]You can remember the exact layout of your desk, years ago, when you made the decision. You turn around and see it just the way it was that day, in the corner of the room.";
		now the desk is in the Living Room;
	say the description;
	stop the action.
Check reading:
	if the noun is the letter:
		say "The letter reads:[line break]";
		repeat with i running from 1 to the number of filled rows in the Table of Letter:
			choose row i in the Table of Letter;
			say "[Line entry]";
			if EOF entry is true:
				say "Your legs give out beneath you, and you break down in tears. You just need a moment to be okay.";
				You regain composure in 1 turn from now;
				break;
			say " Continue?  [run paragraph on]";
			if player consents:
				next;
			otherwise:
				Say "You put the letter down. Her words remind you of her too much.";
				Now stopped reading is true;
				break;
	otherwise if the noun is the laptop:
		Now viewed laptop is true;
		say "August 10th, 2057 [line break]Dear friend, welcome to the future. My name is Steven Musk, founder of Elon Tech. If you are here, you know we have mastered death.  [line break]I[']m proud to announce that today, Elon Tech will open up this technology to the public, allowing anyone to be able to extend their lives indefinitely.  Join the human evolution with me. Subscribe below.[paragraph break][bold type]Sign Up Now".
At the time when you regain composure:
	if introspection counter is less than 6:
		say "[italic type]Breathe,[roman type] you tell yourself. You wipe away the tears, regain control of your legs and arms, and pull yourself up. You look at the letter in your hand.";
		now regained composure is true.
Tearing the letter is destroying the momento. Inserting letter into the shredder is destroying the momento. 
Before destroying the momento:
	if shredded is true:
		say the description;
		stop the action;
	say "Are you sure you want to shred the [noun]?";
	if player consents:
		remove letter from play;
		Now shredded is true;
		Move the shredded letter to the shredder;
		Now the description of the shredder is "You turn towards the shredder, and is reminded that it had already destroyed your letter.";
		say "Feeling betrayed, you [if use analog is true]shove[otherwise]put[end if] the [noun] into the shredder. 
			[line break]'Bbbbbbbbbshhhhhhzzzzzzzzzzzzzzzzzzzz,' the shredder hummed.[line break][line break]The [noun] is now completely destroyed, just like it was before, when you first read it years ago.";
		say "[italic type]How could she?[roman type] You thought to yourself back then. She didn't even fight it; she just accepted her death, and let the illness take her. You turn to the laptop, and you remembered how you found yourself here.";
	stop the action.
Instead of touching laptop:
	say "There's only one button to tap, and it reads 'Sign Up Now.' [if viewed laptop is false]You should probably read what's on the laptop first, though.[end if]Tap it?";
	if player consents:
		Increase introspection counter by 1; [should be 5]
		say "This is what you wanted. To live forever, so you can love forever, and never leave anyone behind. Your child, your grandchild, and your great-grandchild will never have to know loss. [line break][line break]How wrong you were. [italic type]Why did I click it? [roman type]Here you are now, waiting out the last few moments of life. Intentionally waiting for someone to put you down, like a dog. You chuckle in the silence.";
		remove laptop from play;
		if shredded is true: 
			increase life dissatisfaction by 3;
		Otherwise: 
			increase life satisfaction by 2;
		If regained composure is true, increase life satisfaction by 3;
		if stopped reading is true, increase life dissatisfaction by 1;
		say "(EN: This is what I've made so far - there is a specific action left, which can end the game. You can also wait around until the game ends, up to you. - Hung)".
Before going to the Hallway:
	say "You're not supposed to leave. Are you sure you want to?";
	if player consents:
		continue the action;
	otherwise:
		stop the action.

Before killing yourself:
	if introspection counter < 5:
		say "You don[']t quite think it[']s time yet.";
	otherwise:
		say "You[']re getting rather tired. The bed must be nearby.";
	if bed is visible and introspection counter is 5:
		say "You just want to get in bed...";
	stop the action;
Before going to the The Space of Reflection:
	if introspection counter is less than 2:
		say "It's pitch black.";
		stop the action.
