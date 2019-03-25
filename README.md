<p align="center">
<a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases/download/v12.0/WINDOWS.-.Claymore.s.Dual.Ethereum+Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD+NVIDIA.GPU.Miner.v12.0.zip" alt="claymore ethereum miner">
<img src="https://github.com/Claymore-Dual/Claymore-Dual-Miner/blob/master/files/git-files/5eth.jpg" /></a>
</p>

<p align="center">
<a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases" alt="Activity">
<img src="https://img.shields.io/github/downloads/xmrig/xmrig/total.svg" /></a>

<a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/blob/master/License.txt" alt="Activity">
<img src="https://img.shields.io/github/license/xmrig/xmrig-amd.svg" /></a>
<a href="#" alt="Activity">
<img src="https://img.shields.io/github/release-date-pre/xmrig/xmrig-amd.svg" /></a>
<a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/pulse" alt="Activity">
<img src="https://img.shields.io/github/commit-activity/m/badges/shields.svg" /></a>
<a href="#">
<img src="https://img.shields.io/circleci/project/github/badges/shields/master.svg" alt="build status"></a>
</p>

# Claymore's Dual Ethereum AMD+NVIDIA GPU Miner v12.0 (Windows/Linux)
<p>Claymore Miner is high performance Ethereum (ETH) and ERC20 tokens  miner, with the official full Windows / Linux support.
</p>
<p align="center">
<a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases/download/v12.0/WINDOWS.-.Claymore.s.Dual.Ethereum+Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD+NVIDIA.GPU.Miner.v12.0.zip" alt="claymore ethereum miner">
<img src="https://github.com/Claymore-Dual/Claymore-Dual-Miner/blob/master/files/git-files/ethereum-hashrate.png" /></a>
</p>

<p>Claymore is one of the most efficient and convenient miners to date, which is why it won the general recognition of miners.
</p>

## Table of Contents
- [Features, requirements, and limitations](#Features-requirements-and-limitations)
- [Download](#Download)
- [Usage](#Usage)
- [Example](#example)
- [Auto Restart](#restart)


## Features, requirements, and limitations

* Highly optimized OpenCL and CUDA cores for maximum ethash mining speed
* Official Windows / Linux support.
* Nicehash support.
* Automatic GPU configuration.
* Supports AMD Vega, 580/570/480/470, 460/560, Fury, 390/290 and older AMD GPUs with enough VRAM
* Supports Nvidia 10x0 and 9x0 series as well as older cards with enough VRAM
* Optional "green" kernels for RX580/570/560/480/470/460 to lower the power consumption by 2-3% with small, or no drop in hashrate
* Lowest developer fee of 1% (35 seconds defvee mining per each 90 minutes)
* Dual mining 💰
* Advanced statistics: actual difficulty of each share, effective hashrate at the pool, and optional showing of estimated income in USD
* DAG file generation in the GPU for faster start-up and DAG epoch switches
* Supports all ethash mining pools and stratum protocols
* Watchdog that monitors your GPU threads, if they stop hashing for a few minutes, miner restarts itself
* Startup monitor, if miner can't init GPU's and start mining in a defined time, restarts itself or runs a user defined script
* Monitoring of GPU temperature, and if a critical temperature is reached, that particular GPU is turned off until it cools down
* Set system shutdown temperature, to protect your GPU's from overheating
* API for rig monitoring


<img src="https://github.com/Claymore-Dual/Claymore-Dual-Miner/blob/master/files/git-files/ethereum-mining.jpg" width="795" >


## Download

<p>
<a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases/download/v12.0/WINDOWS.-.Claymore.s.Dual.Ethereum+Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD+NVIDIA.GPU.Miner.v12.0.zip" alt="claymore ethereum miner">
<img src="https://github.com/Claymore-Dual/Claymore-Dual-Miner/blob/master/files/git-files/download-btn.png" width="300" ></a></p>

* Binary releases: https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases
* Git tree: https://github.com/Claymore-Dual/Claymore-Dual-Miner.git
  * Clone with `git clone https://github.com/Claymore-Dual/Claymore-Dual-Miner.git`  :hammer:
  
## How to use

<li>Step 1 – Install your GPUs and set up your computer</li>
<li>Step 2 – <a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases/download/v12.0/WINDOWS.-.Claymore.s.Dual.Ethereum+Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD+NVIDIA.GPU.Miner.v12.0.zip">Download latest claymore miner</a></li>
<li>Step 3 – Get an Ethereum wallet (<a target="_blank" rel="noopener noreferrer" href="https://github.com/ethereum/mist/releases">Mist</a> or MyEtherWallet)</li>
<li>Step 4 – Join a <a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/wiki/ETH-Mining-Pools-List-(updated-2019)">mining pool</a></li>
<li>Step 5 – Start mining!</li>

## Example

## Claymore Miner�Auto Restart 

In Windows if you�ve  configured your miner through a batch file then you can easily make the script to loop with this simple command.
```batch
your miner configuration goes here
goto start`
```

Example:
```batch
:start
PhoenixMiner.exe -pool eth-eu2.nanopool.org:9999 -wal 0x1a0e2c4cd699cee12672adc223fdb30b93253eba -worker Rig1 -pass x -log 0 -tt 75 -tstop 85 -tstart 70 -fanmin 30 -Rmode 1 -fret 1 -rate 1 -coin eth
goto start
```
  