Fredwina
========

Challenge description
---------------------

Please see the related pdf file

Hypothesis
----------

I've considered that each dog execute one order at the same time.

There are two types of orders:

* 'move' orders
* 'turn' orders

I've considered that at each step, only one order can be executed by each dog.

Rules
-----

The dogs cannot go outside of the paddock and cannot bump into each other. If instructions make that happen, an error will be raised, then catched by a high level function and finally an appropriate message will be returned.


Tests
-----

To implement my solution, I've followed the TDD and BDD practices.

Both unit testing and feature/integration testing have been implemented. To run all the test, simply type:

```
rake
```

Continuous integration
----------------------

Even if it's not completely relevant to use continous integration for that kind of application, I've used travis-ci during the development.

You can see the minimalistic configuation in .travis.yml

Execution
---------

To execute the program with one of the example file of the specs, type:

```
FILE_NAME=spec/fixtures/input_example_success.txt rake fredwina
```