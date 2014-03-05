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

		 course(60,_,L), mergesort(L,X).


mergesort(Xs, S) :-
    length(Xs, Len),
    (Len < 2 ->
        S = Xs;
        split_in_half(Xs, Ys, Zs),
        mergesort(Ys, SY),
        mergesort(Zs, SZ),
        merge(SY, SZ, S)
    ).

% First two cases: merging any list Xs with an empty list yields Xs
merge([], Xs, Xs).
merge(Xs, [], Xs).
merge(Xs, Ys, S) :- %compare lists
    Xs = [X|Xs0],
    Ys = [Y|Ys0],
    (X @>= Y ->
        S = [X|S0],
        merge(Xs0, Ys, S0);
        S = [Y|S0],
        merge(Xs, Ys0, S0)).

split_in_half(Xs, Ys, Zs) :-
    length(Xs, Len),
    Half is Len // 2,    % integer division, rounding down
    split_at(Xs, Half, Ys, Zs).

 %split_at(Xs, N, Ys, Zs) divides Xs into a list Ys of length N
% and a list Zs containing the part after the first N.
split_at(Xs, N, Ys, Zs) :-
    length(Ys, N),
    append(Ys, Zs, Xs).