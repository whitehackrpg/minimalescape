# minimalescape
This is a barebones text adventure game that you can use as a starting template for actual games. You can move around, pick up stuff, drop it (also in containers), look around, punch stuff and -- hopefully -- manage to use the escapepod. The game has a natural language parser to fetch the commands from the user, so you typically write stuff like "go to the cockpit" to play. As this is just barebones, the vocabulary needs to be expanded -- there aren't any alternative verbs etc.

I used these books in this project:

* W.F. Clocksin and C.S. Mellish, _Programming in Prolog_, New York: Springer-Verlag, 1981.

* Dennis Merrit, _Adventure in Prolog_, New York: Springer-Verlag, 1990.

The code doesn't use Definite Clause Grammar, because I wanted everything laid bare in the template. For a real game, switching is probably a good idea.
