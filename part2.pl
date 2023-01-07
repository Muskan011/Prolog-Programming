% if N == len(Q) make a chess board of size NxN and call helper function for queens.
queens(N, Q) :-
    length(Q, N),
	chess_b(Q, B, 0, N, _, _),
	q_help(B, 0, Q).
% base case for chess board.
chess_b([], [], N, N, _, _).
% recursive call for making a board of size NxN.
chess_b([_ | Q], [Column-X | B], C_init, N, [_ | U_row], U_col) :-
	Column is C_init+1,
	functor(X, f, N),
	conditions(N, X, U_row, U_col),
	chess_b(Q, B, Column, N, U_row, [_ | U_col]).
% after we get all possible positions of the queen on the chess board the conditions funct checks if a queen can be at a certain location without disobeying the rules.
conditions(0, _, _, _) :- !.
conditions(N, Count_r, [Cur_row | Con_r], [Cur_col | Con_c]) :-
	arg(N, Count_r, Cur_row-Cur_col),
	N_inc is N-1,
	conditions(N_inc, Count_r, Con_r, Con_c).
% base case for qu_help
q_help([], _, []).
% q iterates through the rows and selects the cases in which the queens can be placed such that they dont kill each other in the next move from the board of NxN.
q_help([Cur_col | Con_c], R_init, [Column | Outcome]) :-
	Count_r is R_init + 1,
	select(Column-X, [Cur_col | Con_c], B),
	arg(Count_r, X, Count_r-Count_r),
	q_help(B, Count_r, Outcome).