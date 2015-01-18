Fredwina
========

Challenge description
---------------------

Please see the related pdf file

Hypothesis
----------

I've considered that each dogs execute an order at the same time.

There are two types of orders:

* 'move' orders
* 'turn' orders

I've considered that at each step, only one order can be executed by the dog.

Rules
-----

The dogs cannot go outside of the paddock and cannot bump into each other. If instructions make that happen, an error will be raised, then catched by the high level function and an appropriate message will be returned.


Tests
-----

Both unit testing and feature/integration testing have been done. To run all the test, simply type:

   rake

