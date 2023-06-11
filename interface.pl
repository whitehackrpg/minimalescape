input_to_list(X) :-
    read_string(user_input, "\n", "\t ", _, String),
    split_string(String, " ", "", Y),
    maplist(atom_string,X,Y).

game_loop :-
    repeat,
    get_command(X),
    execute(X),
    X == quit,!.
    

get_command(C) :-
    input_to_list(L),
    command(X,L),
    C =.. X,
    !.

execute(go(X)) :- go(X),!.
execute(look) :- look,!.
execute(exits) :- exits,!.
execute(help) :- help,!.
execute(look(X)) :- look(X),!.
execute(take(X)) :- take(X),!.    
execute(drop(X)) :- drop(X),!.    
execute(drop(X,Y)) :- drop(X,Y),!.    
execute(punch(X)) :- punch(X),!.    
execute(quit) :- !.
    
     
