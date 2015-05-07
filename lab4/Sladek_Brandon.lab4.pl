% Brandon Sladek
% CSCI 305 Lab 4

% Is M the mother of C? Only if M is the female parent of C.

mother(M,C):- parent(M,C), female(M).


% Is F the father of C? Only if F is the male parent of C.

father(F,C):- parent(F,C), male(F).


% Are H and W married?

spouse(H,W):- married(H,W).
spouse(W,H):- married(H,W).


% Is C the child of P? Only if P is the parent of C.

child(C,P):- parent(P,C).


% Is S the son of P? Only if P is the parent of the male S.

son(S,P):- parent(P,S), male(S).


% Is D the daughter of P? Only if P is the parent of the female D.

daughter(D,P):- parent(P,D), female(D).


% Are A and B siblings? Only if they both have the same parent.

sibling(A,B):- parent(P,A), parent(P,B), not_equal(A,B).


% Is A the brother of B? Only if A is a male sibling of B.

brother(A,B):- sibling(A,B), male(A).


% Is A the sister of B? Only if A is a female sibling of B.

sister(A,B):- sibling(A,B), female(A).


% Is U the uncle of A by blood or marriage?
% If U is the brother of the parent of A.

uncle(U,A):- parent(P,A), brother(U,P). 

% If U is the husband of the aunt of A.

uncle(U,A):- aunt(T,A), spouse(U,T).


% Is A the aunt of B by blood or marriage?
% If A is the sister of the parent of B.

aunt(A,B):- parent(P,B), sister(A,P).

% If A is the wife of the uncle of B.

aunt(A,B):- uncle(U,B), spouse(U,A).


% Is G the grandparent of A? Only if G is the parent of the parent of A.

grandparent(G,A):- parent(P,A), parent(G,P).


% Is G the grandfather of A? Only if G is the male grandparent of A.

grandfather(G,A):- parent(P,A), parent(G,P), male(G).


% Is G the grandmother of A? Only if G is the female grandparent of A.

grandmother(G,A):- parent(P,A), parent(G,P), female(G).


% Is C the grandchild of G? Only if G is the grandparent of C.

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
% Only if the year X was born is smaller than the year Y was born.

older(X,Y):- born(X,A), born(Y,B), A < B.


% Is person X younger than person Y?
% Only if the year X was born is greater than the year Y was born.

younger(X,Y):- born(X,A), born(Y,B), A > B.


% Who was the King or Queen X when Y was born?

regentWhenBorn(X,Y):- born(Y,A), reigned(X,B,C), A >= B, A =< C.