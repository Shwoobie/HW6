%% all course numbers
c_numbers(N) :-
        course(N,_,_).

%% numbers of all programming languages courses
c_pl(N) :-
        course(N, programming_languages, _).

%% numbers ofall nonprogramming languages courses
c_notpl(N) :-
		course(N,\+ programming_languages,_).
