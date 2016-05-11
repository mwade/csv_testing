## Synopsis

Exploring the performance of CSV processing and unique record counting.  I made the following observations while
processing 100,000,000 records on an Intel Core i7 @ 2.2 ghz (MacBook Air):

* Ruby with the default CSV parser is slow (461 sec).
* Ruby with a simple CSV (non-compliant) parser is ~5x faster (92 sec).
* C with a simple CSV (non-compliant) parser is ~40x faster (11 sec).

I ran out of time before attempting to write a parallel processing version.  Assuming the input CSV is large enough
to overcome the overhead I would imagine some of the approaches listed below would yield a performance increase:

* Write a multi-threaded/multi-process version that parallel processes the data where each thread/process works on
"chunks" of the data (ie: worker 1 processes the first quarter of the file, worker 2 processes the second quarter, etc).
* Write a multi-server distributed worker version that uses a data store like Redis to store the results.
* Give in and use a MapReduce platform like Hadoop. :)

## Benchmarking Example w/ 100,000,000 Records

```
$ make all
Running benchmarks...

C Simple CSV Parser:

real	0m11.027s
user	0m10.581s
sys	0m0.360s

Ruby Simple CSV Parser:

real	1m32.175s
user	1m30.259s
sys	0m0.786s

Ruby Complete CSV Parser:

real	7m41.198s
user	7m27.173s
sys	0m4.175s
```

## Installation

Requires make, gcc, and ruby.
