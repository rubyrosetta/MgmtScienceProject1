set I ordered; 
set J ordered;
set K ordered;

param cs {i in I, j in J};
param cd {j in J, k in K};
param s{i in I};
param d{k in K};

var x {i in I, j in J} >= 0;
var y {j in J, k in K} >= 0;

minimize z: sum{i in I, j in J} cs[i,j] * x[i,j] + sum{j in J, k in K} cd[j,k] * y[j,k];

subject to c1 {i in I} : sum{j in J} x[i,j] <= s[i];
subject to c2 {j in J} : sum{i in I} x[i,j] - sum{k in K} y[j,k] = 0;
subject to c3 {k in K} : sum{j in J} y[j,k] >= d[k];
