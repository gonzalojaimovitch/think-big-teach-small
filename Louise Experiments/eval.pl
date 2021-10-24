:-module(eval, [test/2,identityt/2,onet/2,lastt/2,reverset/2,firstt/2,zerot/2,emptyt/2,secondt/2,flipt/2,firstzerot/1,firstonet/1]).


identityt(X,X).

onet([],[1]).
onet([_|_],[1]).

lastt([],[]).
lastt([X|Xs], [Last]) :-
		  lastt_(Xs, X, Last).

lastt_([], Last, Last).
lastt_([X|Xs], _, Last) :-
		  lastt_(Xs, X, Last).

reverset(Xs, Ys) :-
    reverset(Xs, [], Ys, Ys).

reverset([], Ys, Ys, []).
reverset([X|Xs], Rs, Ys, [_|Bound]) :-
    reverset(Xs, [X|Rs], Ys, Bound).

firstt([],[]).
firstt([X|_],[X]).

zerot([],[0]).
zerot([_|_],[0]).

emptyt([],[]).
emptyt([_|_],[]).

secondt([],[]).
secondt([_],[]).
secondt([_,Y|_],[Y]).

flipt([],[]).
flipt([0|X],[1|Y]) :- flipt(X,Y).
flipt([1|X],[0|Y]) :- flipt(X,Y).

firstzerot([0|_]).
firstonet([1|_]).
