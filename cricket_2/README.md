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


