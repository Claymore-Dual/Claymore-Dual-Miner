Claymore's Dual Ethereum + Decred/Siacoin/Lbry/Pascal AMD+NVIDIA GPU Miner.
=========================



LINKS:

GOOGLE: https://drive.google.com/open?id=0B69wv2iqszefdFZUV2toUG5HdlU
MEGA: https://mega.nz/#F!O4YA2JgD!n2b4iSHQDruEsYUvTQP5_w



FEATURES:

- Supports new "dual mining" mode: mining both Ethereum and Decred/Siacoin/Lbry/Pascal at the same time, with no impact on Ethereum mining speed. Ethereum-only mining mode is supported as well.
- Effective Ethereum mining speed is higher by 3-5% because of a completely different miner code - much less invalid and outdated shares, higher GPU load, optimized OpenCL code.
- Supports both AMD and nVidia cards, even mixed.
- No DAG files.
- Supports all Stratum versions for Ethereum: can be used directly without any proxies with all pools that support eth-proxy, qtminer or miner-proxy.
- Supports Ethereum and Siacoin solo mining.
- Supports both HTTP and Stratum for Decred.
- Supports both HTTP and Stratum for Siacoin. Note: not all Stratum versions are supported currently for Siacoin.
- Supports Stratum for Lbry and Pascal.
- Supports failover.
- Displays detailed mining information and hashrate for every card.
- Supports remote monitoring and management.
- Supports GPU selection, built-in GPU overclocking features and temperature management.
- Supports Ethereum forks (Expanse, etc).
- Windows and Linux versions.



This version is POOL/SOLO for Ethereum, POOL for Decred, POOL/SOLO for Siacoin, POOL for Lbry, POOL for Pascal.
NOTE: Currently Pascal is not supported for NVidia cards.

For AMD cards, Catalyst (Crimson) 15.12 is required for best performance and compatibility. You can get very bad results for different drivers version, or miner can fail on startup.
For nVidia cards, 368.81 driver is recommended for best performance and compatibility.

For AMD cards, set the following environment variables, especially if you have 2GB cards:

GPU_FORCE_64BIT_PTR 0
GPU_MAX_HEAP_SIZE 100
GPU_USE_SYNC_OBJECTS 1
GPU_MAX_ALLOC_PERCENT 100
GPU_SINGLE_ALLOC_PERCENT 100

For multi-GPU systems, set Virtual Memory size in Windows at least 16 GB:
"Computer Properties / Advanced System Settings / Performance / Advanced / Virtual Memory".

This miner is free-to-use, however, current developer fee is 1% for Ethereum-only mining mode (-mode 1) and 2% for dual mining mode (-mode 0), every hour the miner mines for 36 or 72 seconds for developer. 
Decred/Siacoin/Lbry/Pascal is mined without developer fee.
If you don't agree with the dev fee - don't use this miner, or use "-nofee" option.
Attempts to cheat and remove dev fee will cause a bit slower mining speed (same as "-nofee 1") though miner will show same hashrate.

This version is for recent AMD videocards only: 7xxx, 2xx and 3xx, 2GB or more. Recent nVidia videocards are supported as well.

There are builds for Windows x64 and for Linux x64 (tested on Ubuntu 12.04). No 32-bit support. 



COMMAND LINE OPTIONS:

-epool 	Ethereum pool address. Only Stratum protocol is supported for pools. Miner supports all pools that are compatible with Dwarfpool proxy and accept Ethereum wallet address directly.
	For solo mining, specify "http://" before address, note that this mode is not intended for proxy or HTTP pools, also "-allpools 1" will be set automatically in this mode.
	Note: The miner supports all Stratum versions for Ethereum, HTTP mode is necessary for solo mining only. 
	Using any proxies will reduce effective hashrate by at least 1%, so connect miner to Stratum pools directly. Using HTTP pools will reduce effective hashrate by at least 5%.

-ewal 	Your Ethereum wallet address. Also worker name and other options if pool supports it. 
	Pools that require "Login.Worker" instead of wallet address are not supported directly currently, but you can use "-allpools 1" option to mine there.

-epsw 	Password for Ethereum pool, use "x" as password.

-eworker Worker name, it is required for some pools.

-esm	Ethereum Stratum mode. 0 - eth-proxy mode (for example, dwarpool.com), 1 - qtminer mode (for example, ethpool.org), 
	2 - miner-proxy mode (for example, coinotron.com), 3 - nicehash mode. 0 is default. 

-etha	Ethereum algorithm mode for AMD cards. 0 - optimized for fast cards, 1 - optimized for slow cards, 2 - for gpu-pro Linux drivers. -1 - autodetect (default, automatically selects between 0 and 1). 
	You can also set this option for every card individually, for example "-etha 0,1,0".

-ethi	Ethereum intensity. Default value is 8, you can decrease this value if you don't want Windows to freeze or if you have problems with stability. The most low GPU load is "-ethi 0".
	Also "-ethi" now can set intensity for every card individually, for example "-ethi 1,8,6".
	You can also specify negative values, for example, "-ethi -8192", it exactly means "global work size" parameter which is used in official miner.

-eres	this setting is related to Ethereum mining stability. Every next Ethereum epoch requires a bit more GPU memory, miner can crash during reallocating GPU buffer for new DAG. 
	To avoid it, miner reserves a bit larger GPU buffer at startup, so it can process several epochs without buffer reallocation.
	This setting defines how many epochs miner must foresee when it reserves GPU buffer, i.e. how many epochs will be processed without buffer reallocation. Default value is 2.

-allpools Specify "-allpools 1" if miner does not want to mine on specified pool (because it cannot mine devfee on that pool), but you agree to use some default pools for devfee mining. 
	Note that if devfee mining pools will stop, entire mining will be stopped too.

-allcoins Specify "-allcoins 1" to be able to mine Ethereum forks, in this mode miner will use some default pools for devfee Ethereum mining. 
	Note that if devfee mining pools will stop, entire mining will be stopped too. 
	Miner has to use two DAGs in this mode - one for Ethereum and one for Ethereum fork, it can cause crashes because DAGs have different sizes. 
	Therefore for this mode it is recommended to specify current Ethereum epoch (or a bit larger value), 
	for example, "-allcoins 47" means that miner will expect DAG size for epoch #47 and will allocate appropriate GPU buffer at starting, instead of reallocating bigger GPU buffer (may crash) when it starts devfee mining.
	Another option is to specify "-allcoins -1", in this mode miner will start devfee round immediately after start and therefore will get current epoch for Ethereum, after that it will be able to mine Ethereum fork.
	If you mine Expanse, the best way is to specify "-allcoins exp", in this mode devfee mining will be on Expanse too and DAG won't be recreated at all.

-etht	Time period between Ethereum HTTP requests for new job in solo mode, in milliseconds. Default value is 200ms.

-erate	send Ethereum hashrate to pool. Default value is "1", set "-erate 0" if you don't want to send hashrate.

-estale	send Ethereum stale shares to pool, it can increase effective hashrate a bit. Default value is "1", set "-estale 0" if you don't want to send stale shares.

-dpool 	Decred/Siacoin/Lbry/Pascal pool address. Use "http://" prefix for HTTP pools, "stratum+tcp://" for Stratum pools. If prefix is missed, Stratum is assumed.
	Decred: both Stratum and HTTP are supported. Siacoin: both Stratum and HTTP are supported, though note that not all Stratum versions are supported currently. Lbry: only Stratum is supported.

-dwal	Your Decred/Siacoin/Lbry/Pascal wallet address or worker name, it depends on pool.

-dpsw 	Password for Decred/Siacoin/Lbry/Pascal pool.

-di 	GPU indexes, default is all available GPUs. For example, if you have four GPUs "-di 02" will enable only first and third GPUs (#0 and #2).
	Use "-di detect" value to detect correct GPU order for temperatures management (requires non-zero "-tt" option); note that it will not work properly if you do not want to assign all GPUs to miner.
	You can also turn on/off cards in runtime with "0"..."9" keys and check current statistics with "s" key.

-gser	this setting can improve stability on multi-GPU systems if miner hangs during startup. It serializes GPUs initalization routines. Use "-gser 1" to serailize some of routines and "-gser 2" to serialize all routines.
	Default value is "0" (no serialization, fast initialization).

-mode	Select mining mode:
	"-mode 0" (default) means dual Ethereum + Decred/Siacoin/Lbry mining mode.
	"-mode 1" means Ethereum-only mining mode. You can set this mode for every card individually, for example, "-mode 1-02" will set mode "1" for first and third GPUs (#0 and #2).

-dcoin	select second coin to mine in dual mode. Possible options are "-dcoin dcr", "-dcoin sc", "-dcoin lbc", "-dcoin pasc". Default value is "dcr".

-dcri	Decred/Siacoin/Lbry/Pascal intensity. Default value is 30, you can adjust this value to get the best Decred/Siacoin/Lbry mining speed without reducing Ethereum mining speed. 
	You can also specify values for every card, for example "-dcri 30,100,50".
	You can change the intensity in runtime with "+" and "-" keys and check current statistics with "s" key.
	For example, by default (-dcri 30) 390 card shows 29MH/s for Ethereum and 440MH/s for Decred. Setting -dcri 70 causes 24MH/s for Ethereum and 850MH/s for Decred.

-dcrt	Time period between Decred/Siacoin HTTP requests for new job, in seconds. Default value is 5 seconds.

-ftime	failover main pool switch time, in minutes, see "Failover" section below. Default value is 30 minutes, set zero if there is no main pool.

-wd 	watchdog option. Default value is "-wd 1", it enables watchdog, miner will be closed (or restarted, see "-r" option) if any thread is not responding for 1 minute or OpenCL call failed.
	Specify "-wd 0" to disable watchdog.

-r	Restart miner mode. "-r 0" (default) - restart miner if something wrong with GPU. "-r -1" - disable automatic restarting. -r >20 - restart miner if something 
	wrong with GPU or by timer. For example, "-r 60" - restart miner every hour or when some GPU failed.
	"-r 1" closes miner and execute "reboot.bat" file ("reboot.bash" or "reboot.sh" for Linux version) in the miner directory (if exists) if some GPU failed. 
	So you can create "reboot.bat" file and perform some actions, for example, reboot system if you put this line there: "shutdown /r /t 5 /f".

-retrydelay	delay, in seconds, between connection attempts. Default values is "20". Specify "-retrydelay -1" if you don't need reconnection, in this mode miner will exit if connection is lost.

-dbg	debug log and messages. "-dbg 0" - (default) create log file but don't show debug messages. 
	"-dbg 1" - create log file and show debug messages. "-dbg -1" - no log file and no debug messages.

-logfile debug log file name. After restart, miner will append new log data to the same file. If you want to clear old log data, file name must contain "noappend" string.
	If missed, default file name will be used.

-nofee	set "1" to cancel my developer fee at all. In this mode some optimizations are disabled so mining speed will be slower by about 4%. 
	By enabling this mode, I will lose 100% of my earnings, you will lose only 2-3% of your earnings.
	So you have a choice: "fastest miner" or "completely free miner but a bit slower".
	If you want both "fastest" and "completely free" you should find some other miner that meets your requirements, just don't use this miner instead of claiming that I need 
	to cancel/reduce developer fee, saying that 1-2% developer fee is too much for this miner and so on.

-li	low intensity mode. Reduces mining intensity, useful if your cards are overheated. Note that mining speed is reduced too. 
	More value means less heat and mining speed, for example, "-li 10" is less heat and mining speed than "-li 1". You can also specify values for every card, for example "-li 3,10,50".
	Default value is "0" - no low intensity mode.

-lidag	low intensity mode for DAG generation, it can help with OC or weak PSU. Supported values are 0, 1, 2, 3, more value means lower intensity. Example: "-lidag 1".
	You can also specify values for every card, for example "-lidag 1,0,3". Default value is "0" (no low intensity for DAG generation).

-tt	set target GPU temperature. For example, "-tt 80" means 80C temperature. You can also specify values for every card, for example "-tt 70,80,75".
	You can also set static fan speed if you specify negative values, for example "-tt -50" sets 50% fan speed. Specify zero to disable control and hide GPU statistics.
	"-tt 1" (default) does not manage fans but shows GPU temperature and fan status every 30 seconds. Specify values 2..5 if it is too often.
	Note: for NVIDIA cards only temperature monitoring is supported, temperature management is not supported.
	Note: for Linux gpu-pro drivers, miner must have root access to manage fans, otherwise only monitoring will be available.

-ttdcr	reduce Decred/Siacoin/Lbry/Pascal intensity automatically if GPU temperature is above specified value. For example, "-ttdcr 80" reduces Decred intensity if GPU temperature is above 80C. 
	You can see current Decred intensity coefficients in detailed statistics ("s" key). So if you set "-dcri 50" but Decred/Siacoin intensity coefficient is 20% it means that GPU currently mines Decred/Siacoin at "-dcri 10".
	You can also specify values for every card, for example "-ttdcr 80,85,80". You also should specify non-zero value for "-tt" option to enable this option.
	It is a good idea to set "-ttdcr" value higher than "-tt" value by 3-5C.
	NOTE: Check "KNOWN ISSUES" section. GPU indexes in temperature control sometimes don't match GPU indexes in mining!

-ttli	reduce entire mining intensity (for all coins) automatically if GPU temperature is above specified value. For example, "-ttli 80" reduces mining intensity if GPU temperature is above 80C.
	You can see if intensity was reduced in detailed statistics ("s" key).
	You can also specify values for every card, for example "-ttli 80,85,80". You also should specify non-zero value for "-tt" option to enable this option.
	It is a good idea to set "-ttli" value higher than "-tt" value by 3-5C.
	NOTE: Check "KNOWN ISSUES" section. GPU indexes in temperature control sometimes don't match GPU indexes in mining!

-tstop	set stop GPU temperature, miner will stop mining if GPU reaches specified temperature. For example, "-tstop 95" means 95C temperature. You can also specify values for every card, for example "-tstop 95,85,90".
	This feature is disabled by default ("-tstop 0"). You also should specify non-zero value for "-tt" option to enable this option.
	NOTE: Check "KNOWN ISSUES" section. GPU indexes in temperature control sometimes don't match GPU indexes in mining!
	If it turned off wrong card, it will close miner in 30 seconds.
	You can also specify negative value to close miner immediately instead of stopping GPU, for example, "-tstop -95" will close miner as soon as any GPU reach 95C temperature.

-fanmax	set maximal fan speed, in percents, for example, "-fanmax 80" will set maximal fans speed to 80%. You can also specify values for every card, for example "-fanmax 50,60,70".
	This option works only if miner manages cooling, i.e. when "-tt" option is used to specify target temperature. Default value is "100".
	Note: for NVIDIA cards this option is not supported.

-fanmin	set minimal fan speed, in percents, for example, "-fanmin 50" will set minimal fans speed to 50%. You can also specify values for every card, for example "-fanmin 50,60,70".
	This option works only if miner manages cooling, i.e. when "-tt" option is used to specify target temperature. Default value is "0".
	Note: for NVIDIA cards this option is not supported.

-cclock	set target GPU core clock speed, in MHz. If not specified or zero, miner will not change current clock speed. You can also specify values for every card, for example "-cclock 1000,1050,1100,0".
	Unfortunately, AMD blocked underclocking for some reason, you can overclock only.
	Note: for NVIDIA cards this option is not supported.

-mclock	set target GPU memory clock speed, in MHz. If not specified or zero, miner will not change current clock speed. You can also specify values for every card, for example "-mclock 1200,1250,1200,0".
	Unfortunately, AMD blocked underclocking for some reason, you can overclock only.
	Note: for NVIDIA cards this option is not supported.

-powlim set power limit, from -50 to 50. If not specified, miner will not change power limit. You can also specify values for every card, for example "-powlim 20,-20,0,10".
	Note: for NVIDIA cards this option is not supported.

-cvddc	set target GPU core voltage, multiplied by 1000. For example, "-cvddc 1050" means 1.05V. You can also specify values for every card, for example "-cvddc 900,950,1000,970". Supports latest AMD 4xx cards only in Windows.
	Note: for NVIDIA cards this option is not supported.

-mvddc	set target GPU memory voltage, multiplied by 1000. For example, "-mvddc 1050" means 1.05V. You can also specify values for every card, for example "-mvddc 900,950,1000,970". Supports latest AMD 4xx cards only in Windows.
	Note: for NVIDIA cards this option is not supported.

-mport	remote monitoring/management port. Default port is 3333, specify "-mport 0" to disable remote monitoring/management feature. 
	Specify negative value to enable monitoring (get statistics) but disable management (restart, uploading files), for example, "-mport -3333" enables port 3333 for remote monitoring, but remote management will be blocked.
	You can also use your web browser to see current miner state, for example, type "localhost:3333" in web browser.

-colors enables or disables colored text in console. Default value is "1", use "-colors 0" to disable coloring.



CONFIGURATION FILE

You can use "config.txt" file instead of specifying options in command line. 
If there are not any command line options, miner will check "config.txt" file for options.
If there is only one option in the command line, it must be configuration file name.
If there are two or more options in the command line, miner will take all options from the command line, not from configuration file.
Place one option per line, if first character of a line is ";" or "#", this line will be ignored. 
You can also use environment variables in "epools.txt" and "config.txt" files. For example, define "WORKER" environment variable and use it as "%WORKER%" in config.txt or in epools.txt.



SAMPLE USAGE

Dual mining:

 ethpool, ethermine  (and Stratum for Decred): 
	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool stratum+tcp://yiimp.ccminer.org:4252 -dwal DsUt9QagrYLvSkJHXCvhfiZHKafVtzd7Sq4 -dpsw x
	you can also specify "-esm 1" option to enable "qtminer" mode, in this mode pool will display additional information about shares (accepted/rejected), for example:
	EthDcrMiner64.exe -epool us1.ethermine.org:4444 -esm 1 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool stratum+tcp://yiimp.ccminer.org:4252 -dwal DsUt9QagrYLvSkJHXCvhfiZHKafVtzd7Sq4 -dpsw x

 ethpool, ethermine  (and Siacoin solo):
	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool http://localhost:9980/miner/header -dcoin sia

 ethpool, ethermine  (and Siacoin pool):
	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool http://sia-eu1.nanopool.org:9980/miner/header?address=3be0304dee313515cf401b8593a0c1df905ed13f0adaee89a8d7337d2ba8209e5ca9f297bbc2 -dcoin sia

 ethpool, ethermine  (and Siacoin pool with worker name):
   	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool http://sia-eu1.nanopool.org:9980/miner/header?"address=YourSiaAddress&worker=YourWorkerName" -dcoin sia

 same for siamining pool:
	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool "http://siamining.com:9980/miner/header?address=3be0304dee313515cf401b8593a0c1df905ed13f0adaee89a8d7337d2ba8209e5ca9f297bbc2&worker=YourWorkerName" -dcoin sia

 dwarfpool (and Stratum for Decred):
	EthDcrMiner64.exe -epool eth-eu.dwarfpool.com:8008 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F/YourWorkerName -epsw x -dpool stratum+tcp://dcr.suprnova.cc:2252 -dwal Redhex.my -dpsw x
	Read dwarfpool FAQ for additional options, for example, you can setup email notifications if you specify your email as password.

 dwarfpool (and Stratum for Lbry):
	EthDcrMiner64.exe -epool eth-eu.dwarfpool.com:8008 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F/YourWorkerName -epsw x -dpool stratum+tcp://lbry.suprnova.cc:6256 -dwal Redhex.my -dpsw x -dcoin lbc
	Read dwarfpool FAQ for additional options, for example, you can setup email notifications if you specify your email as password.

 nanopool Ethereum+Siacoin:
EthDcrMiner64.exe -epool eu1.nanopool.org:9999 -ewal YOUR_ETH_WALLET/YOUR_WORKER/YOUR_EMAIL -epsw x -dpool "http://sia-eu1.nanopool.org:9980/miner/header?address=YOUR_SIA_WALLET&worker=YOUR_WORKER_NAME&email=YOUR_EMAIL" -dcoin sia

 nanopool Ethereum+Siacoin(Stratum):
EthDcrMiner64.exe -epool eu1.nanopool.org:9999 -ewal YOUR_ETH_WALLET/YOUR_WORKER/YOUR_EMAIL -epsw x -dpool stratum+tcp://sia-eu1.nanopool.org:7777 -dwal YOUR_SIA_WALLET/YOUR_WORKER/YOUR_EMAIL -dcoin sia

 nicehash Ethereum+Decred:
EthDcrMiner64.exe -epool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353 -ewal 1LmMNkiEvjapn5PRY8A9wypcWJveRrRGWr -epsw x -esm 3 -allpools 1 -estale 0 -dpool stratum+tcp://decred.eu.nicehash.com:3354 -dwal 1LmMNkiEvjapn5PRY8A9wypcWJveRrRGWr

 miningpoolhub Ethereum+Siacoin:
	EthDcrMiner64.exe -epool us-east1.ethereum.miningpoolhub.com:20536 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F -eworker YourLogin.YourWorkerName -epsw x -allpools 1 -dpool stratum+tcp://hub.miningpoolhub.com:20550 -dwal username.workername -dpsw x -dcoin sia
	you must also create worker "YourWorkerName" on pool and specify your wallet address there.

 suprnova Ethereum_Classic(ETC)+Siacoin:
	ethdcrminer64.exe -epool etc-eu.suprnova.cc:3333 -ewal YourLogin.YourWorkerName -epsw x -esm 3 -dpool sia.suprnova.cc:7777 -dwal YourLogin.YourWorkerName -dpsw x -dcoin sia -allpools 1 -allcoins -1

 coinotron:
	EthDcrMiner64.exe -epool coinotron.com:3344 -ewal Redhex.rig1 -esm 2 -epsw x -dpool http://dcr.suprnova.cc:9111 -dwal Redhex.my -dpsw x -allpools 1

 coinmine:
	EthDcrMiner64.exe -epool eth.coinmine.pl:4000 -ewal USERNAME.WORKER -esm 2 -epsw WORKER_PASS -allpools 1 -dpool stratum+tcp://dcr.coinmine.pl:2222 -dwal USERNAME.WORKER -dpsw WORKER_PASS

 ethpool+suprnova Ethereum+Pascal:
	ethdcrminer64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool stratum+tcp://pasc.suprnova.cc:5279 -dwal YourLogin.YourWorkerName -dpsw x -dcoin pasc -allpools 1


Ethereum-only mining:

 ethpool:
	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F -epsw x

 f2pool:
	EthDcrMiner64.exe -epool eth.f2pool.com:8008 -ewal 0xd69af2a796a737a103f12d2f0bcc563a13900e6f -epsw x -eworker rig1

 nanopool:
	EthDcrMiner64.exe -epool eu1.nanopool.org:9999 -ewal 0xd69af2a796a737a103f12d2f0bcc563a13900e6f -epsw x -eworker rig1

 nicehash:
	EthDcrMiner64.exe -epool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353 -ewal 1LmMNkiEvjapn5PRY8A9wypcWJveRrRGWr -epsw x -esm 3 -allpools 1 -estale 0

Ethereum forks mining:

	EthDcrMiner64.exe -epool exp-us.dwarfpool.com:8018 -ewal 0xd69af2a796a737a103f12d2f0bcc563a13900e6f -epsw x -allcoins -1

Ethereum SOLO mining (assume geth is on 192.168.0.1:8545):

	EthDcrMiner64.exe -epool http://192.168.0.1:8545



FAILOVER

Use "epools.txt" and "dpools.txt" files to specify additional pools. These files have text format, one pool per line. Every pool has 3 connection attempts. 
Miner disconnects automatically if pool does not send new jobs for a long time or if pool rejects too many shares.
If the first character of a line is ";" or "#", this line will be ignored. 
Do not change spacing, spaces between parameters and values are required for parsing.
If you need to specify "," character in parameter value, use two commas - ,, will be treated as one comma.
You can reload "epools.txt" and "dpools.txt" files in runtime by pressing "r" key.
Pool specified in the command line is "main" pool, miner will try to return to it every 30 minutes if it has to use some different pool from the list. 
If no pool was specified in the command line then first pool in the failover pools list is main pool.
You can change 30 minutes time period to some different value with "-ftime" option, or use "-ftime 0" to disable switching to main pool.
You can also use environment variables in "epools.txt", "dpools.txt" and "config.txt" files. For example, define "WORKER" environment variable and use it as "%WORKER%" in config.txt or in epools.txt.



REMOTE MONITORING/MANAGEMENT

Miner supports remote monitoring/management via JSON protocol over TCP/IP sockets, HTTP is supported as well
Start "EthMan.exe" from "Remote management" subfolder (Windows version only).
Check "Help" tab for built-in help.



KNOWN ISSUES

- Weak/old cards like 7xxx/270/270X cannot handle dual mining properly, Ethereum mining is slower by about 5%.
- AMD cards: GPU indexes in temperature control sometimes don't match GPU indexes in mining. Miner has to enumerate GPUs via OpenCL API to execute OpenCL code, and also it has to enumerate GPUs via ADL API to manage temperature/clock. 
And order of GPUs in these lists can be different. There is no way to fix GPUs order automatically, thanks to AMD devs.
But you can do it manually. For example, if you have two cards, you can change their order by adding "-di 10". Another example, reverse order for six cards: "-di 543210".
Also you can do it automatically (experimental feature) with "-di detect" option.
- Windows 10 Defender recognizes miner as a virus, some antiviruses do the same. Miner is not a virus, add it to Defender exceptions. 
  I write miners since 2014. Most of them are recognized as viruses by some paranoid antiviruses, perhaps because I pack my miners to protect them from disassembling, perhaps because some people include them into their botnets, or perhaps these antiviruses are not good, I don't know. For these years, a lot of people used my miners and nobody confirmed that my miner stole anything or did something bad. 
  Note that I can guarantee clean binaries only for official links in my posts on this forum (bitcointalk). If you downloaded miner from some other link - it really can be a virus.
  However, my miners are closed-source so I cannot prove that they are not viruses. If you think that I write viruses instead of good miners - do not use this miner, or at least use it on systems without any valuable data.
- LBC PoW is not very good for dual mining, it causes a bit less Ethereum mining speed.



TROUBLESHOOTING

1. Install Catalyst v15.12 (for AMD cards).
2. Disable overclocking.
3. Set environment variables as described above.
4. Set Virtual Memory 16 GB.
5. Reboot computer.
6. Check hardware, risers.
7. Set some timeout in .bat file before starting miner at system startup (30sec or even a minute), and try "-ethi 4" to check if it is more stable. It can help if miner is not stable on some system.
 


FAQ

- What is dwarfpool proxy (eth-proxy)?
Official Ethereum miner does not support Stratum protocol, it supports HTTP protocol only. It causes less profit because of delays.
A proxy was created to fix it, so official Ethereum miner is locally connected to the proxy by HTTP protocol, for local network delays due to HTTP protocol are small. Proxy is connected to the pool via Stratum protocol so it has small delays too. Currently most pools support Stratum and you have to use HTTP-to-Stratum proxy to make official miner work with pools properly. Of course you can try to connect official miner to a pool directly via HTTP but you will lose 10-20% shares because of a short block time in Ethereum.
This miner does not use HTTP protocol, it uses Stratum directly. So you should connect it directly to the pool at Stratum port and it will work a bit faster than official miner via proxy because there is no proxy between miner and pool.

- What command option X means?
  Read "Readme!!!.txt", "COMMAND LINE OPTIONS" section.

- How to mine using pool X?
  Read "Readme!!!.txt", "SAMPLE USAGE" section.

- Why wrong temperature is displayed?
  Read "Readme!!!.txt", "KNOWN ISSUES" section. 

- Windows 10 marks miner as a virus.
  Read "Readme!!!.txt", "KNOWN ISSUES" section.

- Can miner stop overheated GPU?
  Yes, see "-tstop" option.

- Why miner does not stop overheated GPU immediately?
  See question above about wrong temperatures.

- Why this command line doesn't work (escaping '&')?
  Char '&' in command line means command separator, to use it in command line either quote string with "", or escape '&' (use ^& on Windows).
  No need to do this in *pools.txt or config.txt.
  Also all command line options must be in same line in .bat file, don't split them to several lines, it won't work.

- How to mine Decred or Sia ONLY with this Ethereum Dual miner?
  No way. It is Ethereum miner with extra bonus coins. To mine extra coins only use other miners.

- Why Ethereum hashrate in Dual mode is higher than in Single mode?
  Hardware feature, accept it as an extra bonus.

- Is 15.12 driver mandatory?
  Usually latest drivers work well. But there are some reports of people where they don't. So 15.12 is recommended.

- Will newer drivers have higher/lower hashrate?
  Usually no, but it depends... Check for yourself.

- Why miner does not show temperatures for RX 480 cards?
  They use newer overdrive API which is not yet published by AMD.

- Why miner on Linux with stock card settings gives a bit lower hashrate than on Windows?
  This probably is the difference in time calculations on both platforms. In reality the accepted hashrate is usually the same.

- Why -cclock/-mclock options do not work?
  Sometimes they do not work. Use Afterburner or Trixx on Windows, atitweak and other tools on Linux instead.

- Why my GPU is 10C hotter in Dual mode?
  This is a price for the extra work done. It also consumes more power, so make sure your PSU has sufficient power.

- Can the temperature be lowered?
  Yes, see "-tt", "-dcri", "-ttdcr", "-li" options.

- How can I undervolt my cards on Linux?
  Usually only by flashing modified GPU BIOS. Unfortunately, no standard way of doing so.

- Why pool shows less hashrate than miner?
  On my test rigs I use miner with default settings and on pool I see about 4-5% less than miner shows (my hashrate is about 800MH/s if I turn on all rigs). 
  Miner shows "raw" hashrate, 2% is devfee in dual mode, other 2-3% can be related to the connection quality, current pool status/luck or/and may be something else. 
  Also, from my calculations miner loses about 0.5-1% because it cannot drop current GPU round when it gets new job, it is related to "-ethi" value, so I made it 8 by default instead of 16.
  But if on pool you see 10% less than miner shows all the time - something is wrong with pool, your connection to internet or your hashrate is low and you did not wait enough time to see average hashrate for 24 hours. 
  Usually I use "ethpool" pool for tests.

- I see only one card via Remote Desktop Connection.
  It's a problem of RDC, use TeamViewer or some other remote access software.

- I see only one card instead of two in temperature management info.
  Disable CrossFire.

- Miner works in ETH-only mode but crashes in dual mode.
  Dual mode requires more power, so make sure PSU power is enough and check GPU clocks if you OC'ed them.

- Error "server: bind failed with error".
  Specify "-mport 0" option.

- How can I get stats from miner as EthMan does?
  Start EthMan and catch its tcp/ip data with WireShark, you will see json protocol details.
