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

/* myfor(L,U,Result)
*/
myfor(L,U,Result) :-
        L =< U,
        L1 is L+1,
        myfor(L1,U,Res1),
        Result = [L | Res1].
myfor(L,U,[]) :-
        L>U.

crossmyfor(0,_,[]).
%crossmyfor(R,H,Z) :-
%         list(R),R = [Head|Tail], myfor(Head,H,[X|T]), distribute(R, H, W), crossmyfor(T,H,Q), append(W, Q, Z).
crossmyfor(R,H,Z) :-
        myfor(1,R,X), myfor(1,H,Y),  last(X,V), K is V-1, distribute(V, Y, W), crossmyfor(K,H,Q), append(Q,W,Z).

getallmeetings([],[]).

getallmeetings(C,Z) :-
        C = [H|T], H = [_|[W|_]], getallmeetings(T, U), append(W, U, V), sort(V, Z).

participants([],[]).

participants(C,Z) :-
        C = [H|T], H = [Name|[MeetingList|_]], makelist(MeetingList, Mlist),
         distribute2([Name],Mlist,G), participants(T,U), append(G,U,V), sort(V, Z). 
         %join_names(ListSeparate, Joined_list), sort(Joined_list, Z).

distribute2(_,[],[]).

distribute2(W,[H|T],Y) :-
        append([H],[W],G), distribute2(W,T,V), append([G],V,Y).

join_names([],[]).
join_names([H|T],Z) :-
        mymember(0,H,T,X), join_names(T,_), append([H|T],X,Z).


makelist([],[]).
makelist([H|T],Z) :-
        makelist(T,U), append([H],U,Z).


mymember(_,[_|_],[],[]).
mymember(_,[X|[N1|_]],[[X|[N2|_]]|T],Z) :-
        append(N1, N2, N), mymember(1,[X|[N1|_]],T,Y), append(X,[N],V),
        append(V,Y,U), sort(U, Z).
mymember(1, [X|N1],[H|T],Z) :-
        mymember(1,[X|N1],T,G), append(H, G, Z).
mymember(0, [X|N1],[H|T],Z) :-
        mymember(0,[X|N1],T,G), append([X|N1],H, U), append(U, G, Z).
