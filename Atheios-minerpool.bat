@echo off
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
@echo on

EthDcrMiner64.exe -epool eu.atheios.eu:8001 -ewal 0x424c6e4bbbd328e4b960a6c2eaa93bbdabeb5b6a -eworker rig1 -epsw x -esm 0 -allcoins 1 -allpools 1 -mode 1 -r 1 -dbg -1 -mport 0 -etha 0 -retrydelay 3 -ftime 45 -tt 70 -ttli 79 -tstop 82 -fanmin 30


pause
