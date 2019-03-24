@echo off
set GPU_FORCE_64BIT_PTR=0
set GPU_MAX_HEAP_SIZE=100
set GPU_USE_SYNC_OBJECTS=1
set GPU_MAX_ALLOC_PERCENT=100
set GPU_SINGLE_ALLOC_PERCENT=100
@echo on


EthDcrMiner64.exe -epool etc-eu2.nanopool.org:19999 -ewal 0xfcf2ba59016a4b2aff4097feba1d927deefcb5d4 -eworker rig1 -epsw x -allcoins etc -allpools 1 -gser 2 -dpool xvg.eu1.unimining.net:5770 -dwal DPNSdySRg8zFmU6Zcqyo9XKJKDhMm87Xn7.rig1 -dpsw c=XVG -dcoin blake2s -r 1 -dbg -1 -mport 0 -etha 0 -retrydelay 3 -ftime 45 -tt 73 -ttli 79 -tstop 82 -fanmin 30 -dcri 45

pause
