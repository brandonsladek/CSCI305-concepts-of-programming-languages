% Brandon Sladek
% CSCI 305 Lab 4

% Is M the mother of C?
mother(M,C):- parent(M,C), female(M).

% Is F the father of C?
father(F,C):- parent(F,C), male(F).

% Are H and W married?
spouse(H,W):- married(H,W).

% Is C the child of P?
child(C,P):- parent(P,C).

% Is S the son of P?
son(S,P):- parent(P,S), male(S).

% Is D the daughter of P?
daughter(D,P):- parent(P,D), female(D).

% Are A and B siblings?
sibling(A,B):- parent(P,A), parent(P,B), not_equal(A,B).

% Is A the brother of B?
brother(A,B):- sibling(A,B), male(A).

% Is A the sister of B?
sister(A,B):- sibling(A,B), female(A).

% Is U the uncle of A by blood or marriage?
uncle(U,A):- parent(P,A), brother(U,P).
uncle(U,A):- aunt(T,A), spouse(U,T).

% Is A the aunt of B by blood or marriage?
aunt(A,B):- parent(P,B), sister(A,P).
aunt(A,B):- uncle(U,B), spouse(U,A).

% Is G the grandparent of A?
grandparent(G,A):- parent(P,A), parent(G,P).

% Is G the grandfather of A?
grandfather(G,A):- parent(P,A), parent(G,P), male(G).

% Is G the grandmother of A?
grandmother(G,A):- parent(P,A), parent(G,P), female(G).

% Is C the grandchild of G?
grandchild(C,G):- grandparent(G,C).

% Is A not equal to B?
not_equal(A,B):- A \= B.

% Is A the ancestor of B?
ancestor(A,B):- parent(A,B).                % Base case
ancestor(A,B):- parent(P,B), ancestor(A,P). % Recursive case

% Is A the descendant of B?
descendant(A,B):- child(A,B).                   % Base case
descendant(A,B):- child(C,B), descendant(A,C).	% Recursive case

% Is person X older than person Y?
older(X,Y):- born(X,A), born(Y,B), A < B.

% Is person X younger than person Y?
younger(X,Y):- born(X,A), born(Y,B), A > B.

% Who was the King or Queen X when Y was born?
regentWhenBorn(X,Y):- born(Y,A), reigned(X,B,C), A >= B, A =< C.