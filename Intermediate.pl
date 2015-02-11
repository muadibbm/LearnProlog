/* We can load the file basics.pl as follow */
:- consult('basics.pl').
/* Now we shall use the isBigger operator that we defined in basics.pl */
isSunBiggerThanMoon :- sun isBigger moon.
/* During execution, Prolog keeps track of choicpoints(subgoals that can be satisfied in more than one way), if
 * a particular path turns out to be a fail then it jumps back to the most recent choicpoint. This process is called backtracking.
 * Lets use the concept of backtracking in prolog to create a permutation function 
 */
permutation([], []).
permutation(List, [Element | Permutation]) :-
	select(Element, List, Rest),
	permutation(Rest, Permutation).
/* To prevent backtracking to certain choicpoints, we use a cut dentoed by "!". This predicate always
 * succeeds and prevents backtracking to subgoals placed before the cut.
 * The following is an example of using a cut in a function */
remove_duplicates([], []).
remove_duplicates([Head | Tail], Result) :-
	member(Head, Tail), !,
	remove_duplicates(Tail, Result).
remove_duplicates([Head | Tail], [Head | Result]) :-
	remove_duplicates(Tail, Result).
/* Using same logic, we can have a function for adding elements to a list */
add_to_list(Element, List, Result) :-
	member(Element, List), !,
	Result = List.
add_to_list(Element, List, [Element | List]).
/* Negation in Prolog is as follow */
negatedFact :- \+ thisIsAFact(truth).
/* Disjunction in Prolog is implemented by using ";"
 * Using all we learned, we can write the and, or, implication and negate functions */
and(A, B) :- call(A), call(B).
or(A, B) :- call(A); call(B).
implies(A, B) :- call(A), !, call(B).
implies(_, _).
negate(A) :- \+ call(A).
neg(A) :- call(A), !, fail.
neg(_).
/* We can decompose terms using the "=.." operator, it can also be using to compose new terms */
decompose(A, List) :- A =.. List.
compose(List, A) :- A =.. List.
/* Now, lets write a function that returns true if the first term is also a subterm of the second term */
subterm(Term, Term).
subterm(Subterm, Term) :-
	Term =.. [_|Arguments],
	member(Argument, Arguments),
	subterm(Subterm, Argument).
/* findall is used to collect answers to the given query */
grade(student1, 8).
grade(student2, 8).
grade(student3, 6).
grade(student4, 1).
grade(student5, 5).
grade(student6, 8).
allStudentsWithGrade8 :- findall(STUDENT, grade(STUDENT, 8), L), write(L).
allStudentsWithVariableGrade :- bagof(STUDENT, grade(STUDENT, _), L), write(L).
/* setof is simillar to bagof. It also removes duplicates and orders the list.
 * We can also add to or remove from the Prolog knowledge base dynamically by using assert or retract
 * assert(animal(cat)).
 * assert(animal(dog)).
 * :- animal(X).
 * retract(animal(dog)).
 * :- animal(X).
 * We can use assert for example to create a fast fibonacci function.
 */
fib(0, 1).
fib(1, 1).
fib(N, F) :-
	N >= 2, N1 is N - 1, N2 is N-2,
	fib(N1, F1), fib(N2, F2), F is F1 + F2,
	assert(fib(N, F) :- !).
/* Input and Output is done as follow */
writeToTerminal :- write('hello world!').
writeToFile :- tell('file.txt'), write('a(b).'). told.
readFromFile(Line) :- see('file.txt'), read(Line), seen.
readFromTerminal(Input) :- read(Input).

 
