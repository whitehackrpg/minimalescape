:- [interface,natlangparser].

help :-
    write("\n== M I N I M A L  E S C A P E ==\n\nThe objective is to escape. Commands: go, exits, look, take, drop, punch and quit. When you look, descriptions are given with the location followed by things in that location. For example,\n\ncockpit\ncomputer\n\nmeans that you are in the cockpit, and there's a computer there. If you get lost, type 'help' to see this message, or 'exits' to see possible exits.\n").

start_game :-
    retractall(location(_,_)),
    retractall(here(_)),
    help,
    [minimal],
    game_loop.

room(cockpit).
room(elevator).
room(escapepod).
room(mess).
room(protagonist).

:- dynamic location/2.
location(locker,mess).
location(cookie,locker).
location(computer,cockpit).
location(activationcode,computer).
location(monster,escapepod).


container(locker).
container(computer).


takeable(cookie).
copyable(activationcode).

door(cockpit,elevator).
door(mess,elevator).
door(escapepod,elevator).

can_pass(X,Y) :-
    (door(X,Y) ; door(Y,X)).

:- dynamic here/1.
here(elevator).

go(X) :-
    here(Y),
    can_pass(Y,X),
    retract(here(Y)),
    assertz(here(X)).


look :-
    here(X),
    write(X),
    nl,
    location(Y,X),
    write(Y),
    nl,
    fail.


look(X) :-
    here(Y),
    location(X,Y),
    location(Z,X),
    write(Z),
    nl,
    fail.

look(protagonist) :-
    location(X,protagonist),
    write(X),
    nl,
    fail.

exits :-
    here(X),
    can_pass(X,Y),
    write(Y),
    nl,
    fail.

inside(X,Y) :-
    location(X,Y).

inside(X,Y) :-
    location(X,Z),
    inside(Z,Y).

take(X) :-
    (takeable(X) ; copyable(X)),
    here(Y),
    inside(X,Y),
    location(X,Z),
    (copyable(X) ; retract(location(X,Z))),
    assertz(location(X,protagonist)),
    !.

drop(X) :-
    location(X,protagonist),
    (copyable(X) ; retract(location(X,protagonist))),
    here(Y),
    assertz(location(X,Y)),
    !,
    move(monster).
   
drop(X,Y) :-
    container(Y),
    here(Z),
    inside(Y,Z),
    location(X,protagonist),
    (copyable(X) ; retract(location(X,protagonist))),
    assertz(location(X,Y)),
    !.

move(monster) :-
    location(cookie,X),
    location(monster,Y),
    room(X),
    X \= Y,
    retract(location(monster,Y)),
    retract(location(cookie,X)),
    assertz(location(monster,X)),
    !,
    write("A monster comes running to munch on the cookie!\n").
  
punch(activationcode) :-
    location(monster,escapepod),
    write("The monster scares you.\n").

punch(activationcode) :-
    location(activationcode,protagonist),
    write("You escape!\n").

