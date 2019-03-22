@echo off
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
@echo on

EthDcrMiner64.exe -epool eu1-etc.ethermine.org:4444 -ewal 0xfcf2ba59016a4b2aff4097feba1d927deefcb5d4.rig1 -epsw x -allpools 1 -allcoins etc -mode 1 -r 1 -dbg -1 -mport 0 -etha 0 -retrydelay 3 -ftime 45 -tt 70 -ttli 79 -tstop 82 -fanmin 30

pause

