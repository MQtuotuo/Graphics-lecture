function [bel] = bayes_obs(bel0, z)
%	function bel = bayes_obs(bel0, z)
%	Calculates the new probability distribution for the prior distribution bel0 and the measurement z

%Data from the Map
data = [1 4 7 10];

%Here we see the benefit of using the error in the measurement instead of a distribution for every state.
%Also notice the dot . before - and *
bel = normpdf(z .- data, 0,1).*bel0;

%In Octave vectorization is preferable to loops, therefore we calculate the normalizer not incrementally like in the code of the lecture
eta = 1/sum(bel);

%finally we normalize, again notice the dot
bel.*=eta;


%Now bel is our updated believe over the state space this is what the function returns.
endfunction
