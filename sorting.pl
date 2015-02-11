 /* Lets write a sorting predicate that takes an ordering and a list
 * and return the sorted list based on the given ordering.
 * To do this, we require a predicate check that checks if 
 * two terms are ordered based on the given ordering relation. */
checkOrdering(A, B, Relation) :-
	Predicate =.. [Relation, A, B],
	call(Predicate).
/* Sorting algorithms are as follow */
bubbleSort(List, SortedList, Relation) :-
	swap(List, NewList, Relation), !,
	bubbleSort(NewList, SortedList, Relation).
bubbleSort(SortedList, SortedList, _).
swap([A, B | List], [B, A | List], Relation) :-
	checkOrdering(A, B, Relation).
swap([A | List], [A | NewList], Relation) :-
	swap(List, NewList, Relation).