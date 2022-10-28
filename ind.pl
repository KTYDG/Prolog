% predicates
    % man(symbol).
    % woman(symbol).
    % parent(symbol,symbol).
    % married(symbol, symbol).
% clauses
man(fedor).
man(dima).
man(egor).
man(max).
man(lexa).
man(lepexa).
woman(anna).
woman(irina).
woman(nina).
woman(olya).
%
married(fedor, anna).
married(egor, nina).
married(dima, irina).
married(lexa, olya).
%
parent(fedor, nina).
parent(anna, nina).
parent(fedor, irina).
parent(anna, irina).
parent(fedor, lexa).
parent(anna, lexa).

parent(egor, max).
parent(nina, max).

parent(lexa, lepexa).
parent(olya, lepexa).
%
child(X, Y) :- parent(Y, X).
father(X, Y):- man(X), parent(X, Y).
mother(X, Y):- woman(X), parent(X, Y).
son(X, Y):- man(X), child(X, Y).
daughter(X, Y):- woman(X), child(X, Y).
grandmother(X, Y):- woman(X), parent(X, Z), parent(Z, Y).
cousin_brother(X, Y):- man(Y), once((child(Y, Z), child(X, T), child(T, K), child(Z, K))), X \= Y.
husband_father(X, Y):- man(Y), parent(Y, Z), married(Z, X).
wife_of_brother(X, Y):- woman(Y), married(T, Y), child(X, Z), child(T, Z), not(married(X, Y)).

% 6 14 21 30