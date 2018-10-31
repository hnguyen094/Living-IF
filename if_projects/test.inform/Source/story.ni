"Living" by "Hung Nguyen".
Release along with a website. Release along with an interpreter.
Release along with the source text.

[Variables & Constructor]
Sunset is a time that varies. Sunset is 7:30 PM.
Sunrise is a time that varies. Sunrise is 6:00 AM.
Time of death is a time that varies. Time of death is 7:00 AM.
Started is a truth state that varies. Started is false.
Introspection counter is a number that varies. The introspection counter is 0.
Will to leave is truth state that varies. Will to leave is false.
Life satisfaction is a number that varies. Life satisfaction is 0.
Life dissatisfaction is a number that varies. Life dissatisfaction is 0. [From GDC talk by Ingold]
Use analog is a truth state that varies. Use analog is true. [TODO: could also use love mom]
Time changed by clock is a truth state that varies. Time changed by clock is false.
Seen clock is a truth state that varies. Seen clock is false.

[Prefabs]
Nighttime is a scene. Nighttime begins when the time of day is after sunset. Nighttime ends when the time of day is sunrise.
A window is a kind of thing that is fixed in place. The description of a window is "Outside, Manhattan
[if nighttime is happening]looks like a sea of fireflies, blinking[otherwise]glitters gold[end if] beneath you.
Everything is perfect.".

[Verbs/ synonyms]
Understand "sink into [something]" as entering.
[TODO: make music a real thing >:D]
Understand "chair" as armchair.
Understand "sit down" as entering.
Understand "close eyes", "breathe", and "close  your eyes" as waiting.
Understand "look around" as looking.

[Start]
When play begins:
	[now the command prompt is "[] >";]
	now the time of day is 6:30 PM;
	Say "[italic type]Is this the real life?[line break]Is this just fantasy?[line break]Caught in a landslide[line break]No escape from reality...".

[Update]
Every turn:
	If time changed by clock is false and seen clock is true:
		Let X be a random number from 1 to 30;
		Let Y be the time of day plus x minus 1 minutes;
		Now the time of day is Y;
		[say "It's been [X in words] minutes. It is [time of day in words].";]
	otherwise:
		now time changed by clock is false;
	If time of day is greater than time of death, and time of day is before 12:00 PM:
		say "It's time..."; [TODO: change the ending statements depending on some variables]
		end the story.

[Rooms]
Bedroom is a room.  The description is "Your bed is perfectly made. Outside the window, you can see
[if nighttime is happening]the beautiful Manhattan skyline at night like a million stars[otherwise]the sun setting on the Manhattan skyline, bleeding orange onto you[end if].
The living room lies to the north of your bedroom." [TODO Change the backdrop scenery]
Living Room is a room. The description is "Mostly bare, just the way you wanted it yesterday. An armchair sits dead center, facing the window. The bedroom lies to the south[if will to leave is true], and a door lies to the east[end if]." It is north of the Bedroom. [TODO: changes the description when it starts filling up]
Hallway is a room. "It's pitch black. The light from the living room behind you isn't doing anything at all.". [It is east of the Living Room.]
The Space of Reflection is a room. "You shouldn't be here. Your head hurts." It is east of the Hallway.

[Items/Instance objects]
A bed is a thing in Bedroom. It is an enterable supporter. The description is "Tidy and perfect; you probably could sink into it."[Verb: sinking into] [TODO: change fake doors to real doors]
The bedroom window is a window in Bedroom. [Enables photoframe]
The living room window is a window in Living Room. [Enables photoframe]
The armchair is a thing in the Living Room. The armchair is an enterable supporter and fixed in place. The description is "It's a perfect replica of the same one your grandfather owned. It even smells of old cigarette smoke."
The clock is a thing. The description is "Well, time sure flies. The clock reads [if use analog is true][time of day in words][otherwise][time of day][end if].". The clock is nowhere.
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
    say "You fall onto the bed, as it engulfs you.
[line break]Ah. It's soft. You could stay here forever.
[line break]You get up again, though. [italic type]There's a time and place for everything. But not now.";
	stop the action.
Entering armchair is being reminicsient.
Touching armchair is being reminiscient.
Before entering armchair: [TODO: make gendered memories or choices]
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
Before examining a clock:
	Now time changed by clock is true;
	Let X be a random number from 1 to 60;
	Let Y be the time of day plus x minus 1 minutes;
	Now the time of day is Y;
	If seen clock is false:
		Increase introspection counter by 1; [should now be 4]
		Now seen clock is true;
		say "Your mother taught you how to read an analog clock; how 21st century she was. Do you remember how to read an analog clock?";
		if player consents:
			say "She was a good teacher, despite not being a good mother.
				[line break]You take a deep breath. Still, you miss her. Her laughter was contagious. Her love, although conditional, was abundant. She wouldn’t want to see you like this.
				[line break][line break]You miss her.[line break][line break]";
			Now use analog is true;
			Increase life satisfaction by 2;
		otherwise:
			say "The memory of your mother makes your blood boil; she was never there for you. She was a terrible teacher, and an even worse mother. She stopped making dinner for the family when you were 6. She stopped picking you up from school when you were 9. She forgot your 13th birthday, and every birthday after that.
					[line break][italic type]    Breathe.[roman type][line break]Her birth date is July 29th, 2003.
					[line break][italic type]    Breathe.[roman type][line break]She’s a Leo. Your grandfather was also a Leo. You miss him.
					[line break][italic type]    Breathe.[roman type][line break]You regain some composure, as your mind wandered back to him."; [TODO: haven't done anything here]
			Now use analog is false;
			Increase life dissatisfaction by 3;
		if use analog is true:
			say "With your mother in your mind and heart, you're reminded that you have until [time of death in words] tomorrow morning, when you, too, will pass and join her.  [line break]This is what I've coded so far. _hung";
		otherwise:
			say "With your grandfather in your mind and heart, you're reminded that you have until [time of death] tomorrow, when you, too, will pass and join him.  [line break]This is what I've coded so far. _hung";
	continue the action.
Before going to the Hallway:
	say "You're not supposed to leave. Are you sure you want to?";
	if player consents:
		continue the action;
	otherwise:
		stop the action.
Before going to the The Space of Reflection:
	if introspection counter is less than 2:
		say "It's pitch black.";
		stop the action.
