% product(code, name, price)
% set_prolog_flag(encoding, utf8).

product(1, молоко, 90).
product(2, сыр, 320).
product(3, сметана, 100).
product(4, кефир, 80).
product(5, кумыс, 90).

customer(1, молоканов, 89999118621).
customer(2, малоконев, 88889118620).
customer(3, многоконев, 86669118619).
customer(4, ноуконев, 86996918619).

order(1, [1,2], date(2022, 9, 4), 410).
order(2, [2], date(2022, 11, 1), 320).
order(2, [3,4], date(2022, 10, 29), 180).
order(3, [1,2,3,4,5], date(2022, 12, 31), 680).
order(4, [5,5,5,1], date(2022, 11, 15), 360).
order(4, [1,1,1,5], date(2022, 10, 20), 360).


products([]).
products([X | Rest]):- product(X, Name, _), write(Name), write(', '), products(Rest).

question1(Customer):-
    customer(Id, Customer, _),
    order(Id, List, When, _),
    length(List, X),
    format_time(atom(Date), '%d %b %Y', When),
    products(List), write('дата: '), write(Date), write('; количество: '), write(X), nl, fail.

find(Id_p, [Id_p|_]).
find(Id_p, [_|Tail]):- find(Id_p, Tail).

question2(Product/*, DS-MS-YYYS, DE-ME-YYYE*/):-
    % D1 is DS+20,
    % D2 is DE+20,
    product(Id_p, Product, _),
    order(Id, List, _/*When*/, _),
    % format_time(atom(Date), '%d-%b-%Y', When),
    % atomic_list_concat(L,'-', Date),
    % nth0(2, L, YYYY), nth0(1, L, MM), nth0(0, L, DD),
    % number_chars(Y, YYYY),
    % write(YYYY), nl, write(MM),
    %  atom_number(MM, M), atom_number(DD, D),
    % write(Y),
    % Y >= YYYS, M >= MS, D >= D1, Y =< YYYE, M =< ME, D =< D2,
    find(Id_p, List),
    customer(Id, Name, Tel),
    write('Клиент: '), write(Name), write('; телефон: '), write(Tel), nl, fail.

question3(Price):-
    number(Price),
    order(Id, List, _, PPrice),
    PPrice > Price,
    customer(Id, Name, _),
    write('клиент: '), write(Name), write('; цена: '), write(PPrice), write('; продукты: '), products(List), nl, fail.

question4(Amount):-
    order(Id, List, When, _),
    length(List, X),
    Amount == X,
    customer(Id, Name, _),
    format_time(atom(Date), '%d %b %Y', When),
    write('клиент: '), write(Name), write('; дата: '), write(Date), write('; продукты: '), products(List), nl, fail.


