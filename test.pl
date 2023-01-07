foo(L, L, []). 
foo([X | L1], L2, [X | L3])  :- foo(L1, L2, L3).