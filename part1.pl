% my_concat(Lst1, Lst2, L): meaning the concatenation of two lists Lst1 and Lst2 is L.
% my_concat([1, 2, 3], [4], [1, 2, 3, 4]) is true.
% my_concat([1, 2, 3], [4], X) is X = [1, 2, 3, 4].
% my_concat([1, [2, 3]], [4], [1, 2, 3, 4]) is false.
% my_concat([1, [2, 3]], [4], [1, [2, 3], 4]) is true.
% my_concat([1, [2, 3]], [4], X) is X = [1, [2, 3], 4].
% BASE CASE
my_concat([], Lst2, Lst2).
% RECURSIVE CALL
my_concat([First_elem | Rest_lst1], Lst2, [First_elem | Rest_lst]) :- my_concat(Rest_lst1, Lst2, Rest_lst).

% my_element_at(X, N, L): meaning the element X is the Nth element in list L.
% my_element_at(2, 1, [2, 3, 4]) is true.
% my_element_at(2, 1, [3, 2, 4]) is false.
% my_element_at(2, 1, [[2], 3, 4]) is false.
% my_element_at(5, 2, [3, 2, 4]) is false.
my_element_at(X, 1, [X | _]).
my_element_at(X, N, [_ | Rest_lst]) :- 
    my_element_at(X, N_dec, Rest_lst),
    N is N_dec + 1.



% my_reverse(L1, L2): meaning the reverse of list L1 is L2.
% my_reverse([1, 2, 3], [3, 2, 1]) is true.
% my_reverse([1, 2, 3], X) is X = [3, 2, 1].
% my_reverse([1, 2, 3], [2, 1, 3]) is false.
% my_reverse([1, [2, 3], 4, [5]], [[5], 4, [2, 3], 1]) is true.
% my_reverse([1, [2, 3], 4, [5]], X) is X = [[5], 4, [2, 3], 1].
% my_reverse([1, [2, 3], 4, [5]], [[5], 4, [3, 2], 1]) is false.
% my_reverse([], []) is true.
% my_reverse([], X) is X = [].
my_reverse(Lst1, Lst2) :- r_help(Lst1, Lst2, []).
r_help([], Final, Final).
r_help([First_elem | Rest], Lst2, Final_lst) :- r_help(Rest, Lst2, [First_elem | Final_lst]).



% my_flatten(L1, L2): Given a list L1, its flattened version is L2.
% my_flatten([1, 2, 3], [1, 2, 3]) is true. 
% my_flatten([1, 2, 3], X) is X = [1, 2, 3]. 
% my_flatten([3, [2, 1]], [3, 2, 1]) is true.
% my_flatten([3, [2, 1]], X) is X = [3, 2, 1].
% my_flatten([1, [2, 3]], [1, 2, 3]) is true.
% my_flatten([1, [2, 3]], X) is X = [1, 2, 3].
% my_flatten([1, [2], [3, 4]], [1, 2, 3, 4]) is true.
% my_flatten([1, [2], [3, 4]], X) is X = [1, 2, 3, 4].
% my_flatten([1, [2, 3, [4, 5], 6]], [1, 2, 3, 4, 5, 6]) is true.
% my_flatten([1, [2, 3, [4, 5], 6]], X) is X = [1, 2, 3, 4, 5, 6].
my_flatten([], []).
my_flatten(First_elem, [First_elem]) :- \+ is_list(First_elem).
my_flatten([First_elem | Rest_lst], Lst) :-
    my_flatten(First_elem, Lst1), 
    my_flatten(Rest_lst, Lst2), 
    append(Lst1, Lst2, Lst).



% my_compress(L1, L2): Given a list L1, L2 is its compressed version by eliminating the duplicates.
% my_compress([1, 2, 3], [1, 2, 3]) is true. 
% my_compress([1, 2, 3], X) is X = [1, 2, 3]. 
% my_compress([3, 1, 2, 2], [3, 1, 2]) is true.
% my_compress([3, 1, 2, 2], X) is X = [3, 1, 2].
% my_compress([1, 2, 2], [1, 2]) is true. 
% my_compress([1, 2, 2], X) is X = [1, 2].
% my_compress([1, 2, [2]], [1, 2]) is false.
% my_compress([1, 2, [3, 4], [5], [5], [3]], [1, 2, [3, 4], [5], [3]]) is true.
% my_compress([1, 2, [3, 4], [5], [5], [3]], X) is X = [1, 2, [3, 4], [5], [3]].

my_compress([], []).
my_compress([First_elem], [First_elem]).
my_compress([First_elem, First_elem | Rest_lst], Final_lst):-
	my_compress([First_elem | Rest_lst], Final_lst), !.
my_compress([First_elem, First_elem1 | Rest_lst1], [First_elem | Final_lst]):-
	my_compress([First_elem1 | Rest_lst1], Final_lst).