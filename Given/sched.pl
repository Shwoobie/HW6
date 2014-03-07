%% all course numbers
c_numbers(N) :-
        course(N,_,_).

%% numbers of all programming languages courses
c_pl(N) :-
        course(N, programming_languages, _).

%% numbers ofall nonprogramming languages courses
c_notpl(N) :-

		 course(N,_,_), \+(course(N,programming_languages,_)).
%% list of those teaching
c_inst60(L) :-
                 course(60,_,L).

c_inst20(L) :-
                 course(20,_,L).


%% list of those teaching
c_inst60_sorted(X) :-
		 course(60,_,L), sort(L,X).

%% list of those teaching
c_inst20_sorted(X) :-
                 course(20,_,L), sort(L,X).

%% list of those teaching
c_inst_sorted(N,X) :-
                 course(N,_,L), sort(L,X).

c_single_inst(M) :-
	course(M,_,L), length(L, X), (X = 1).

c_multi_inst(M) :-
        course(M,_,L), length(L, X), (X > 1).

c_exclusive(I,M) :-
        course(M,_,L), length(L, X), (X = 1), (L = [H]), (H = I).

c_12_inst_1or(M) :-
	 course(M,_,L), length(L, X), (X = 1); 
	 course(M,_,L), length(L, X), (X = 2).

c_12_inst_2wo(M) :-
	course(M,_,L), length(L, X), (X = 1).

c_12_inst_2wo(M) :-
        course(M,_,L), length(L, X), (X = 2).

sortappend(L1, L2, R) :-
	append(L1, L2, X), sort(X,R).

delete_question("my answer goes here").

distribute(_,[],[]).

distribute(W,[H|T],Y) :-
	append([W],[H],G), distribute(W,T,V), append([G],V,Y).

