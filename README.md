<p align="center">
<a href="https://github.com/Claymore-Dual/Miner/releases/download/v12.0/WINDOWS.-.Claymore.s.Dual.Ethereum+Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD+NVIDIA.GPU.Miner.v12.0.zip" alt="claymore ethereum miner">
<img src="https://github.com/Claymore-Dual/Miner/blob/master/files/5eth.jpg" /></a>
</p>

<p align="center">
<a href="https://github.com/Claymore-Dual/Miner/releases" alt="Activity">
<img src="https://img.shields.io/github/downloads/xmrig/xmrig/total.svg" /></a>

<a href="https://github.com/Claymore-Dual/Miner/blob/master/License.txt" alt="Activity">
<img src="https://img.shields.io/github/license/xmrig/xmrig-amd.svg" /></a>
<a href="#" alt="Activity">
<img src="https://img.shields.io/github/release-date-pre/xmrig/xmrig-amd.svg" /></a>
<a href="https://github.com/Claymore-Dual/Miner/pulse" alt="Activity">
<img src="https://img.shields.io/github/commit-activity/m/badges/shields.svg" /></a>
<a href="#">
<img src="https://img.shields.io/circleci/project/github/badges/shields/master.svg" alt="build status"></a>
</p>

# Claymore's Dual Ethereum AMD+NVIDIA GPU Miner v12.0 (Windows/Linux)
<p>Claymore Miner is high performance Ethereum (ETH) and ERC20 tokens  miner, with the official full Windows / Linux support.
</p>
<p align="center">
<a href="https://github.com/Claymore-Dual/Miner/releases/download/v12.0/WINDOWS.-.Claymore.s.Dual.Ethereum+Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD+NVIDIA.GPU.Miner.v12.0.zip" alt="claymore ethereum miner">
<img src="https://github.com/Claymore-Dual/Miner/blob/master/files/ethereum-hashrate.png" /></a>
</p>

<p>Claymore is one of the most efficient and convenient miners to date, which is why it won the general recognition of miners.
</p>

## Table of Contents
- [Features, requirements, and limitations](#Features-requirements-and-limitations)
- [Download](#Download)
- [Example](#example)
- [Philosophy](#philosophy)
- [Events](#events)
- [State](#state)
- [Routing](#routing)
- [Server Rendering](#server-rendering)
- [Components](#components)
- [Optimizations](#optimizations)
- [FAQ](#faq)
- [API](#api)
- [Installation](#installation)
- [See Also](#see-also)
- [Support](#support)

## Features, requirements, and limitations

* Highly optimized OpenCL and CUDA cores for maximum ethash mining speed
* Official Windows / Linux support.
* Nicehash support.
* Automatic GPU configuration.
* Supports AMD Vega, 580/570/480/470, 460/560, Fury, 390/290 and older AMD GPUs with enough VRAM
* Supports Nvidia 10x0 and 9x0 series as well as older cards with enough VRAM
* Optional "green" kernels for RX580/570/560/480/470/460 to lower the power consumption by 2-3% with small, or no drop in hashrate
* Lowest developer fee of 1% (35 seconds defvee mining per each 90 minutes)
* Dual mining
* Advanced statistics: actual difficulty of each share, effective hashrate at the pool, and optional showing of estimated income in USD
* DAG file generation in the GPU for faster start-up and DAG epoch switches
* Supports all ethash mining pools and stratum protocols
* Watchdog that monitors your GPU threads, if they stop hashing for a few minutes, miner restarts itself
* Startup monitor, if miner can't init GPU's and start mining in a defined time, restarts itself or runs a user defined script
* Monitoring of GPU temperature, and if a critical temperature is reached, that particular GPU is turned off until it cools down
* Set system shutdown temperature, to protect your GPU's from overheating
* API for rig monitoring

<p align="center">
<img src="https://github.com/Claymore-Dual/Miner/blob/master/files/ethereum-mining.jpg" />
</p>

## Download

* Direct download link
* Binary releases: https://github.com/Claymore-Dual/Miner/releases
* Git tree: https://github.com/Claymore-Dual/Miner.git
  * Clone with `git clone https://github.com/Claymore-Dual/Miner.git`  :hammer: