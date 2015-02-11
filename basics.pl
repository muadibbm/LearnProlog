/* Prolog is a logic based declarative programming language.
 * Here is four facts defined in prolog */
bigger(sun, earth).
bigger(earth, moon).
bigger(moon, ball).
/* The bigger predicate is not transitive and thus bigger(sun, ball) will return False.
 * In order to make it transitive, we define the following function */
isBigger(A, B) :- bigger(A, B).
isBigger(A, B) :- isBigger(A, X), isBigger(X, B).
/* The ":-" is the if statement (or the assignment operator) and the "," is AND conjuction.
 * We have numbers, variables, atoms and compound terms in Prolog.
 * Atoms start with lowercase or are enclosed in single quotes.
 * Variables start with uppercase or an underscroe
 * Compound terms have a atom and number arguments
 * Atomes and compound terms are called predicates and terms without variables are called ground terms
 * Facts are predicates followed by a full stop. */
thisIsAFact(truth).
/* Rules consist of a head and body seperated by the if statement */
ruleAND(A, B) :-
	thisIsAFact(B),
	thisIsAFact(A).
/* Facts and rules are called clauses and a prolog program is a list of clauses.
 * A prolog program can be compiled by consult('PROGRAM_NAME.pl'). */
sayHello(YOURNAME, _reply) :- atom_concat('Hello ', YOURNAME, _reply), write(_reply).
/* The above rule can be called by sayHello('David', Reply).
 * The = operator can be used to test if two terms match */
isEqual(A, B) :- A = B.
/* The "_" is called the anonymous variable. Each occurence defines a unique variable.
 * The Two following facts are identical. */
fact1(X) :- f(1, X, 3) = f(1, 2, 3).
fact2(X) :- f(_, X, _) = f(1, 2, 3).
/* A sample prolog program about the mortality of socrates */
man(socrates).
mortal(X) :- man(X).
/* mortal(socrates) will return TRUE
 * Lists are one of the most usefull data structures in Prolog
 * The first element in a list is called a head and the rest is called a tail (always a list).
 * List = [Head | Tail]
 * Here are some built-in operations for the list type */
concat_lists([], List, List).
concat_lists([Head|List1], List2, [Head|Result]) :-
	concat_lists(List1, List2, Result).
/* Other operations are:
 * append(same as concat), 
 * length(List, Length).
 * member(Element, List).
 * reverse(List, ReversedList).
 * selecte(Element, List, Rest).
 */
show(List) :-
	member(Element, List),
	write(Element),
	nl,
	fail.
/* Arithmetic Expressions */
plus(A, B, C) :-
	C is A + B.
/* Using the "is" expression we can write the length functions for a list */
len([], 0).
len([_|Tail], N) :-
	len(Tail, M),
	N is M + 1 .
/* Some built-in operations of Arithmetic are:
 * C is max(A,B).
 * C is sqrt(A).
 * C is A mod B.
 * Equality is =:= and inequality is =\=
 * Precedence of a term is defined as the precedence of its pinciple operator. The lower the precedence value, the
 * stronger its binding. If the term is not an operator or is enclosed in parentheses then its precedence is 0.
 * To check precedence of an operator we can use the function current_op(Prec, Assoc, OPERATOR).
 * We can also create our own operators. To do that, the operator has to be already compiled. 
 */
:- op(400, xfx, isBigger).
 
 
 
 
  