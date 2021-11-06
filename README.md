# CPU Memory Disk Benchmark

An all-in-one Alpine-based Docker container image for CPU (Linpack), memory (STREAM) and disk (Fio) benchmarking.

## Usage

```bash
docker run -it mavridis/benchmarks
```
_Below is an output example ->_

```bash
*************************-----| linpack |-----*************************
Array size 200 X 200.
Average rolled and unrolled performance:

    Reps Time(s) DGEFA   DGESL  OVERHEAD    KFLOPS
----------------------------------------------------
     512   0.52  83.02%   3.52%  13.45%  1556991.419
    1024   1.04  82.99%   3.55%  13.45%  1556140.308
    2048   2.09  83.05%   3.49%  13.46%  1557438.883
    4096   4.17  83.04%   3.50%  13.47%  1558014.326
    8192   8.66  82.98%   3.54%  13.48%  1502032.711
   16384  16.88  83.01%   3.51%  13.49%  1540928.282



*************************-----| stream |-----*************************
This system uses 8 bytes per array element.
-------------------------------------------------------------
Array size = 100000000 (elements), Offset = 0 (elements)
Memory per array = 762.9 MiB (= 0.7 GiB).
Total memory required = 2288.8 MiB (= 2.2 GiB).
--
Function    Best Rate MB/s  Avg time     Min time     Max time
Copy:            3281.7     0.503496     0.487559     0.543233
Scale:           3265.5     0.505964     0.489964     0.535160
Add:             3397.4     0.729047     0.706423     0.754257
Triad:           3265.6     0.791491     0.734940     0.941542


*************************-----| fio |-----*************************

Seq-Read: (groupid=0, jobs=1): err= 0: pid=18: Fri Nov  5 17:15:03 2021
  read: IOPS=203, BW=203MiB/s (213MB/s)(256MiB/1258msec)
--
Seq-Write: (groupid=1, jobs=1): err= 0: pid=19: Fri Nov  5 17:15:03 2021
  write: IOPS=585, BW=586MiB/s (614MB/s)(256MiB/437msec); 0 zone resets
--
Rand-Read-128K: (groupid=2, jobs=1): err= 0: pid=20: Fri Nov  5 17:15:03 2021
  read: IOPS=168, BW=21.1MiB/s (22.1MB/s)(211MiB/10009msec)
--
Rand-Write-128K: (groupid=3, jobs=1): err= 0: pid=21: Fri Nov  5 17:15:03 2021
  write: IOPS=4213, BW=527MiB/s (552MB/s)(256MiB/486msec); 0 zone resets
--
Rand-Read-4K: (groupid=4, jobs=1): err= 0: pid=22: Fri Nov  5 17:15:03 2021
  read: IOPS=387, BW=1552KiB/s (1589kB/s)(15.2MiB/10001msec)
--
Rand-Write-4K: (groupid=5, jobs=1): err= 0: pid=23: Fri Nov  5 17:15:03 2021
  write: IOPS=64.5k, BW=252MiB/s (264MB/s)(256MiB/1016msec); 0 zone resets
--
Rand-Read-4K-QD32: (groupid=6, jobs=1): err= 0: pid=24: Fri Nov  5 17:15:03 2021
  read: IOPS=96, BW=386KiB/s (395kB/s)(3864KiB/10005msec)
--
Rand-Write-4K-QD32: (groupid=7, jobs=1): err= 0: pid=25: Fri Nov  5 17:15:03 2021
  write: IOPS=66.5k, BW=260MiB/s (272MB/s)(256MiB/986msec); 0 zone resets

```
.

.




## Run the benchmarks for different parameters

- Change Linpack's array size, e.g 600
     
     ```bash
         docker run -it -e LINPACK_ARRAY_SIZE=600 mavridis/benchmarks
     ```

  .

- Change Stream's array size, the docker image has to be rebuilded
  1. Clone this repository
     ```bash 
     git clone "benchmarks-container"
     cd bench 
     ```
  2. Set the NewArraySize variable, e.g. 200000, and replace the default value
     The default array size is 100000000
     ```bash
     NewArraySize=200000
     sed -i -e "s/=100000000/\=$NewArraySize/g" stream/Makefile
     ```
  3. Build and run the new container image
     ```bash
     docker build -t mavridis/benchmarks .
     docker run -it mavridis/benchmarks
     ```

     .

- Change Fio's workload, the docker image has to be rebuilded
  1. Clone this repository
     ```bash 
     git clone "benchmarks-container" 
     cd bench 
     ```
  2. Edit Fio's workload file
     ```bash
     vi fio/set.fio
     ```
  3. Build and run the new container image
     ```bash
     docker build -t mavridis/benchmarks .
     docker run mavridis/benchmarks
     ```
     .



## License
[Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0)