"Inform Template" by Erin Hoffman-John

[frostpunk]

Center is a room.  The description is "This room is in the center. There are rooms to the north, south, east, and west."

A poison ball is a thing in Center. The description is "It appears to be made of poison."


Instead of taking the poison ball:
    say "You reach out and touch the poison ball. You die.";
    end the story.

Instead of snarfing the poison ball, say "The poison ball explodes!"

Snarfing is an action applying to one thing. Understand "snarf [something]" as snarfing.

Mood is a kind of value. The moods are happy, bored, annoyed, sad, and angry. A person has a mood.

Bill is a person in Center. Bill is happy. The description is "[if Bill is happy]Bill is smiling.[otherwise if Bill is angry]Bill is glowering at you."

Instead of attacking Bill:
    say "You kick Bill right in the shin! Bill is angry now.";
    now Bill is angry.

[Instead of giving Bill the poison ball:
    say "You give Bill the poison ball.";
    now Bill is happy.]

Instead of jumping, say "You leap into the sky and fly around! You're flying now."
