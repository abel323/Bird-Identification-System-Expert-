top_goal(X):-bird(X).
bird(laysan_albatross):-
    family(albatross),
    color(white).
bird(black_footed_albatross):-
    family(albatross),
    color(dark).
bird(whistling_swan):-
    family(swan),
    voice(muffled_musical_whisle).
bird(canada_goose):-
    family(goose),
    season(winter),
    country(united_states),
    head(black),
    cheek(white).
bird(canada_goose):-
    family(goose),
    season(summer),
    country(canada),
    head(black),
    cheek(white).
bird(mallard):-
    family(duck),
    voice(quack),
    head(green).
bird(mallard):-
    family(duck),
    voice(quack),
    head(green).

country(united_states):-
    region(mid_west).
country(united_states):-
    region(south_west).
country(united_states):-
    region(north_west).
country(united_states):-
    region(mid_atlantic).

region(new_england):-
    state(X),
    member(X,[massachusetts,vermont]).
region(south_east):-
    state(X),
    member(X,[florida,mississippi]).

nostrils(external_tubular).
live(at_sea).
bill(hooked).
size(large).
wings(long_narrow).
color(white).
color(dark).
neck(green).

%voice
voice(muffled_musical_whistle).

%order
order(tubenose):-
    nostrils(external_tubular),
    live(at_sea),
    bill(hooked).
order(waterfowl):-
    feet(webbed),
    bill(flat).

%family
family(albatross):-
    order(tubenose),
    size(large),
    wings(long_narrow).
family(swan):-
    order(waterfowl),
    neck(long),
    color(white),
    flight(ponderous).

%asking the user%
family(X):- ask(family,X).
eats(X):- ask(eats,X).
feet(X):- ask(feet,X).
wings(X):- ask(wings,X).
neck(X):- ask(neck,X).
color(X):- ask(color,X).
nostrils(X):- ask(nostrils,X).
live(X):- ask(live,X).
bill(X):- ask(bill,X).
size(X):-
    menuask(size,X,[large,plump,medium,small]).
flight(X):-
    menuask(flight,X,[ponderous,agile,flap_glide]).

%menuask predicate
menuask(A, V, MenuList):-
    write('What is the value for '), write(A), write('?'),nl,
    write(MenuList),nl,
    read(X),
    check_val(X,A,V,MenuList),
    asserta(known(yes,A,X)),
    X==V.
check_val(X,A,V,MenuList):-
    member(X,MenuList),
    !.
check_val(X,A,V,MenuList):-
    write(X),write(' is not a legal value, try again!'),nl,
    menuask(A,V,MenuList).
%ask predicate
ask(Attr, Val):-
   write(Attr:Val),
   read(yes).
%assert questions
known(yes,Y,Z).
ask(A, V):-
    known(yes, A, V), %successed if true
    !.%stop looking
ask(A,V):-
    known(_,A,V),%fail if false
    !,
    fail.
ask(A,V):-
    write(A:V), % ask the user
    write('?: '),
    read(Y),%get the answer
    asserta(known(Y,A,V)),%remeber the answer
    Y==yes.%succssed or fail











