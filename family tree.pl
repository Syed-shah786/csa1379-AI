% Prolog implementation of a family tree

% Facts
parent('John', 'Mary').
parent('John', 'James').
parent('Susan', 'Mary').
parent('Susan', 'James').
parent('James', 'Alice').
parent('James', 'Bob').
parent('Linda', 'Alice').
parent('Linda', 'Bob').

% Rules
% Define father and mother based on parent relationship
father(F, C) :- parent(F, C), male(F).
mother(M, C) :- parent(M, C), female(M).

% Define gender
male('John').
male('James').
male('Bob').
female('Susan').
female('Mary').
female('Alice').
female('Linda').

% Define sibling relationship
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

% Define grandparent relationship
grandparent(GP, GC) :- parent(GP, P), parent(P, GC).

% Define ancestor relationship (recursive)
ancestor(Anc, Desc) :- parent(Anc, Desc).
ancestor(Anc, Desc) :- parent(Anc, P), ancestor(P, Desc).

% Query examples:
% ?- father('John', Child).
% Child = 'Mary' ;
% Child = 'James'.

% ?- mother('Susan', Child).
% Child = 'Mary' ;
% Child = 'James'.

% ?- sibling('Mary', Sibling).
% Sibling = 'James'.

% ?- grandparent('John', Grandchild).
% Grandchild = 'Alice' ;
% Grandchild = 'Bob'.

% ?- ancestor('John', Descendant).
% Descendant = 'Mary' ;
% Descendant = 'James' ;
% Descendant = 'Alice' ;
% Descendant = 'Bob'.