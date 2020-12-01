# Defining Variables

param shifts; # the number of shifts (variables)
param hours; # the hours in a work day (constraints)
param teams; # number of teams
param wage := 20; # avg cost per hour labor

set SHIFTS := {1..shifts}; #shifts
set HOURS := {1..hours}; #hours
set TEAMS := {1..teams}; #teams

param hr{SHIFTS, HOURS}; #shifts matrix
param calls{TEAMS, HOURS}; #teams call volume matrix

# 1. Decision Variable
var staff{TEAMS, HOURS} integer; #people per hour


# 2. Objective Function: Minimize Staffing Cost
minimize obj_func:
	sum{j in HOURS, i in TEAMS} staff[i,j]*wage;
	
# 3. Constraints

# minimum required people per shift
s.t. schedule {l in SHIFTS}:
	sum{i in TEAMS, j in HOURS} hr[l, j]*staff[i,j] >= 1;

# minimum required people per team based on call freq
s.t. teamstaff {i in TEAMS, j in HOURS}: 
	staff[i,j] >= calls[i,j]/5;

# 8 hour shift per person
s.t. shiftlimit {l in SHIFTS, j in HOURS}:
	staff[l,j]*hr[l,j] = staff[l,l+8]*hr[l,j];