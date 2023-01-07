For Part 1:  my_concat takes one by one and adds the first element of list1 to the final list and once list1 is empty then by base case it adds list2 into the final list.
            my_element_at: base cases check whether the 1st element is the element that we need if not then decrease N and remove the first element of the list and recurse again.
            my_reverse uses a helper function that one by one puts the first element of list1 into the final list in reverse order and in the base case, the final list is compared to list2.
            my_flatten: recursively call itself on the first element of the list1 and the rest of list1 and combines the result that it gets from flattening the first element of list1 and rest of list1.
            my_compress: base case checks if the list is already compressed and if not it calls a helper function that as per the conditions again until the base case is met or else returns false.
For Part 2: I checked whether the length of Q = N and then I created a board that contain all possible values of an NxN board. 
            Then I called a helper function that checked which combination of the values in the board followed the rules and set that to outcomes.
Note: Initially, I had my is clause before the recursive call but I changed that as in Prof's OH, I released that as the correct value for decreased N was being passed.
Note: I removed all unused variables as they were causing warnings.
Webpages used:
    my_concat: http://www.cse.unsw.edu.au/~billw/prologdict.html
    my_element_at: https://stackoverflow.com/questions/6023717/prolog-building-list-with-conditional-clauses?rq=1
    my_flatten:http://www.cse.unsw.edu.au/~billw/prologdict.html#negation
    my_compress: https://stackoverflow.com/questions/6023717/prolog-building-list-with-conditional-clauses?rq=1
    n_queens: 
            http://www.cse.unsw.edu.au/~billw/dictionaries/prolog/functor.html
            http://www.cse.unsw.edu.au/~billw/dictionaries/prolog/arg.html
            https://en.wikipedia.org/wiki/Eight_queens_puzzle
            used code for https://www.geeksforgeeks.org/n-queen-problem-backtracking-3/ to confirm my answers to n_queens.

