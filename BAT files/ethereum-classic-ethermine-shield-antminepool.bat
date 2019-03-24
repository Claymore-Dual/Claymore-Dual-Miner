@echo off
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
@echo on

EthDcrMiner64.exe -epool eu1-etc.ethermine.org:4444 -ewal 0xfcf2ba59016a4b2aff4097feba1d927deefcb5d4.rig1 -epsw x -allcoins etc -allpools 1 -gser 2 -dpool s.antminepool.com:5766 -dwal SX66Mvuy5dLQo2rdTxHueyAJFXTwHDQzpj.rig1 -dpsw c=XSH -dcoin blake2s -r 1 -dbg -1 -mport 0 -etha 0 -retrydelay 3 -ftime 45 -tt 73 -ttli 79 -tstop 86 -fanmin 30 -dcri 45


pause
