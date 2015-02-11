 /* Lets write a sorting predicate that takes an ordering and a list
 * and return the sorted list based on the given ordering.
 * To do this, we require a predicate check that checks if 
 * two terms are ordered based on the given ordering relation. */
checkOrdering(A, B, Relation) :-
	Predicate =.. [Relation, A, B],
	call(Predicate).
/* Sorting algorithms are as follow
 * Bubble Sort */
bubbleSort(List, SortedList, Relation) :-
	swap(List, NewList, Relation), !,
	bubbleSort(NewList, SortedList, Relation).
bubbleSort(SortedList, SortedList, _).
swap([A, B | List], [B, A | List], Relation) :-
	checkOrdering(B, A, Relation).
swap([A | List], [A | NewList], Relation) :-
	swap(List, NewList, Relation).
/* Quick Sort */
quickSort([Head | Tail], SortedList, Relation) :-
	partition(Head, Tail, Left, Right, Relation),
	quickSort(Left, SortedLeft, Relation),
	quickSort(Right, SortedRight, Relation),
	append(SortedLeft, [Head | SortedRight], SortedList).
quickSort([], [], _).
partition(Middle, [Head | Tail], [Head | Left], Right, Relation) :-
	checkOrdering(Head, Middle, Relation), !,
	partition(Middle, Tail, Left, Right, Relation). 
partition(Middle, [Head | Tail], Left, [Head | Right], Relation) :-
	partition(Middle, Tail, Left, Right, Relation). 
partition(_, [], [], [], _).

