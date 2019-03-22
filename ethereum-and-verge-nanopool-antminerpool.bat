@echo off
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
@echo on

EthDcrMiner64.exe -epool eth-eu2.nanopool.org:9999 -ewal 0x1a0e2c4cd699cee12672adc223fdb30b93253eba -eworker rig1 -epsw x -etha 0 -allpools 1 -dpool stratum+tcp://s.antminepool.com:9009 -dwal DDxgi1akA5ewepRdyznzL3rS1ssmjTvVxr -dpsw c=XVGB -dcoin blake2s -r 1 -dbg -1 -mport 0 -retrydelay 3 -ftime 45 -tt 73 -ttli 79 -tstop 82 -fanmin 30 -dcri 50

pause