@echo off
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
@echo on

EthDcrMiner64.exe -epool vic.pool.sexy:10062 -ewal 0x05c6957d4b39cc617f723f2c4d84612bf74f787b -eworker rig1 -epsw x -esm 0 -allcoins 1 -allpools 1 -mode 1 -r 1 -dbg -1 -mport 0 -etha 0 -retrydelay 3 -ftime 45 -tt 70 -ttli 79 -tstop 82 -fanmin 30

pause

