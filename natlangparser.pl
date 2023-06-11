command([V], In) :- 
    verb(V,In-[]).

command([V,O], In) :-
    verb(Object_Type, V, In-S1),
    object(Object_Type, O, S1-[]).

command([V,O1,O2], In) :-
    verb(Object_Type, V, In-S1),
    object(Object_Type, O1, S1-S2),
    object(Object_Type, O2, S2-[]).


verb(quit, [quit|X]-X).
verb(help, [help|X]-X).    
verb(look, [look|X]-X).    
verb(exits, [exits|X]-X).    
verb(thing, look, [look|X]-X).
verb(place, look, [look|X]-X).
verb(place, go, [go|X]-X).
verb(place, go, [go,to|X]-X).
verb(thing, take, [take|X]-X).
verb(thing, drop, [drop|X]-X).
verb(thing, punch, [punch|X]-X).

object(Type, N, S1-S3) :-
    determ(S1-S2),
    noun(Type, N, S2-S3).

object(Type, N, S1-S2) :-
    noun(Type, N, S1-S2).

determ([the|X]-X).

noun(place, R, [R|X]-X):- 
    room(R).

noun(thing, T, [T|X]-X):- 
    location(T,_).
