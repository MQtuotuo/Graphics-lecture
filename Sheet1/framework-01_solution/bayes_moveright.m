function bel = bayes_moveright(bel0);
%	function bel = bayes_moveright(bel0);
%	this function integrates the move-right step and returns a new believe over the state space, given the former believe bel0

% We declare the state transition Matrix
M = [ 	0.2 0.05 0    0; 
	0.8 0.15 0.05 0; 
	0   0.8  0.15 0.05; 
	0   0    0.8  0.95];

%Make sure you understand why this is exactly what we want (bel(x_i) = sum_over_all{j=1,...,4} P(X_i| X_j, u=move_right)*Bel_prime(X_j))
bel = M*bel0';

%here we just transpose the col-vector to a row-vector to be consistent with the bayes_obs function
bel = bel';

%Make sure you now why there is no normalization needed!!
endfunction
