
measurements = [1, 2, 5.4, 8.6, 9]

printf('Presence Exercises part 1:\n');
bel0 = ones(1,4)./4;

for cases=1:5

printf('For the measurement z = %f the believe over the state space is:\n', measurements(cases));
bel =bayes_obs(bel0, measurements(cases))
[i,ix] = max(bel);
printf('The most likely place is X_%i with probability %f \n\n', ix, i);
endfor

printf('\nPresence Exercises part 2:\n');
bel0 = [0.1 0.4 0.4 0.1];

for cases=1:5

printf('For the measurement z = %f the believe over the state space is:\n', measurements(cases));
bel =bayes_obs(bel0, measurements(cases))
[i,ix] = max(bel);
printf('The most likely place is X_%i with probability %f \n\n', ix, i);
endfor

printf('\nPresence Exercises part 3:\n');
bel0 = ones(1,4)./4;
z1 = 5.5;
z2 = 5.5;
printf('After the first measurement of z1 = %f we get the Updated believe : \n', z1);
bel1 = bayes_obs(bel0, z1)

printf('Now we integrate the movement step and get: \n');
bel2 = bayes_moveright(bel1)

printf('and finally we integrate the measurement of z2 = %f \n', z2);
bel3 = bayes_obs(bel2, z2)
