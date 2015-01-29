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
 / * A sample prolog program about the mortality of socrates */
 man(socrates).
 mortal(X) :- man(X).
 / * mortal(socrates) will return TRUE */
 