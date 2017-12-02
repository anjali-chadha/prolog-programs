% Given Predicates:

occupation(joe, oral_surgeon).
occupation(sam, patent_laywer).
occupation(bill, trial_laywer).
occupation(cindy, investment_banker).
occupation(joan, civil_laywer).
occupation(len, plastic_surgeon).
occupation(lance, heart_surgeon).
occupation(frank, brain_surgeon).
occupation(charlie, plastic_surgeon).
occupation(lisa, oral_surgeon).

address(joe, houston).
address(sam, pittsburgh).
address(bill, dallas).
address(cindy, omaha).
address(joan, chicago).
address(len, college_station).
address(lance, los_angeles).
address(frank, dallas).
address(charlie, houston).
address(lisa, san_antonio).

salary(joe,50000).
salary(sam,150000).
salary(bill,200000).
salary(cindy,140000).
salary(joan,80000).
salary(len,70000).
salary(lance,650000).
salary(frank,85000).
salary(charlie,120000).
salary(lisa,190000).

in_state(houston, texas).
in_state(college_station, texas).
in_state(dallas, texas).
in_state(san_antonio, texas).
in_state(omaha, nebraska).
in_state(pittsburgh, pennsylvania).
in_state(chicago, illinois).

type_of_surgeon(oral_surgeon).
type_of_surgeon(plastic_surgeon).
type_of_surgeon(hear_surgeon).
type_of_surgeon(brain_surgeon).

% Find surgeons who live in Texas and make over 100,000$ per year
% Query
rich_surgeons_in_texas(X):- type_of_surgeon(O), occupation(X, O), in_state(C, texas), address(X, C), salary(X, S), S > 100000.
