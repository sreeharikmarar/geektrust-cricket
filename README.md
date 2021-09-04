# Cricket Problem 1: The last FOUR


## Setup

First, install [Ruby](https://www.ruby-lang.org/en/documentation/installation/). Then run the following commands under the `bin` dir.

`bin/setup` will install bundler gem if it is not present and will also install all the other depended gems. 
Once the setup is finished it will also execute all the `spec` (unit test cases ) written under `spec` directory.

```
cricket_1$ bin/setup 
Installing bundler
Installing ruby gems
...
...
Cricket::Ball
  #initialize
    should initialize ball with over number and ball number

Finished in 0.05515 seconds (files took 0.38184 seconds to load)
34 examples, 0 failures
```

You can run all the `spec` unit tests files separate, by doing

```
cricket_1$ rspec
Cricket::Ball
  #initialize
    should initialize ball with over number and ball number
..
..
Finished in 0.05515 seconds (files took 0.38184 seconds to load)
34 examples, 0 failures
``` 


## Run Program

Once you are done with the setup, You can start the program by running `bin/cricket`. 

```
cricket_1$ bin/cricket 

Lengaburu requires 40 runs in 4 overs

0.1 Kirat Boli scores 6 runs
0.2 Kirat Boli scores 1 runs
0.3 Ns Nodhi scores 1 runs
0.4 Kirat Boli scores 2 runs
0.5 Kirat Boli scores 1 runs
0.6 Ns Nodhi scores 6 runs

Lengaburu requires 23 runs in 3 overs

1.1 Kirat Boli scores 1 runs
1.2 Ns Nodhi scores 1 runs
1.3 Kirat Boli is OUT!
1.4 R Rumrah is OUT!
1.5 Shashi Henra scores 0 runs
1.6 Shashi Henra scores 1 runs

Lengaburu requires 20 runs in 2 overs

2.1 Shashi Henra is OUT!

-------------------------------
         Game Summary
-------------------------------
Lengaburu failed by 20 runs

Kirat Boli		- 11 	(6 balls)
Ns Nodhi		- 8* 	(3 balls)
R Rumrah		- 0 	(1 ball)
Shashi Henra	- 1 	(3 balls)
```

# Cricket Problem 2: The tie breaker


## Setup

First, install [Ruby](https://www.ruby-lang.org/en/documentation/installation/). Then run the following commands under the `bin` dir.

`bin/setup` will install bundler gem if it is not present and will also install all the other depended gems. 
Once the setup is finished it will also execute all the `spec` (unit test cases ) written under `spec` directory.

```
cricket_2$ bin/setup 
Installing bundler
Installing ruby gems
...
...
Cricket::Ball
  #initialize
    should initialize ball with over number and ball number

Finished in 0.03826 seconds (files took 0.347 seconds to load)
32 examples, 0 failures
```

You can run all the `spec` unit tests files separate, by doing

```
cricket_2$ rspec
Cricket::Ball
  #initialize
    should initialize ball with over number and ball number
..
..
Finished in 0.03826 seconds (files took 0.347 seconds to load)
32 examples, 0 failures
``` 


## Run Program

Once you are done with the setup, You can start the program by running `bin/cricket`. 

```
cricket_2$ bin/cricket 

Enchai:
0.1 Db Velliyers scores 6 runs
0.2 Db Velliyers scores 4 runs
0.3 Db Velliyers scores 2 runs
0.4 Db Velliyers scores 4 runs
0.5 Db Velliyers scores 2 runs
0.6 Db Velliyers scores 3 runs

Lengaburu:
0.1 Kirat Boli scores 2 runs
0.2 Kirat Boli scores 6 runs
0.3 Kirat Boli is OUT!

-------------------------------
         Game Summary
-------------------------------
Lengaburu failed by 14 runs

Enchai:
Db Velliyers 	- 21* 	(6 balls)
H Mamla 	 	- 0* 	(0 ball)

Lengaburu:
Kirat Boli 	 	- 8 	(3 balls)
Ns Nodhi 	 	- 0* 	(0 ball)
```


