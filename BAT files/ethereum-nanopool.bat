@echo off
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
@echo on


EthDcrMiner64.exe -epool eth-eu2.nanopool.org:9999 -ewal 0x1a0e2c4cd699cee12672adc223fdb30b93253eba -eworker rig1 -epsw x -mode 1 -r 1 -dbg -1 -mport 0 -etha 0 -retrydelay 3 -tt 73 -ttli 79 -tstop 82 -fanmin 30
pause






