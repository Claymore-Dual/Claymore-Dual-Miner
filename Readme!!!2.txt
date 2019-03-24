Claymore's Dual Ethereum + Decred/Siacoin/Lbry/Pascal/Blake2s/Keccak AMD+NVIDIA GPU Miner.
=========================



LINKS:

MEGA: https://mega.nz/#F!O4YA2JgD!n2b4iSHQDruEsYUvTQP5_w
GOOGLE: https://drive.google.com/open?id=0B69wv2iqszefdFZUV2toUG5HdlU



FEATURES:

- Supports new "dual mining" mode: mining both Ethereum and Decred/Siacoin/Lbry/Pascal/Blake2s/Keccak at the same time, with no impact on Ethereum mining speed. Ethereum-only mining mode is supported as well.
- Effective Ethereum mining speed is higher by 3-5% because of a completely different miner code - much less invalid and outdated shares, higher GPU load, optimized OpenCL code, optimized assembler kernels.
- Supports both AMD and nVidia cards, even mixed.
- No DAG files.
- Supports all Stratum versions for Ethereum: can be used directly without any proxies with all pools that support eth-proxy, qtminer or miner-proxy.
- Supports Ethereum and Siacoin solo mining.
- Supports both HTTP and Stratum for Decred.
- Supports both HTTP and Stratum for Siacoin.
- Supports Stratum for Lbry, Pascal, Blake2s, Keccak.
- Supports failover.
- Displays detailed mining information and hashrate for every card.
- Supports remote monitoring and management.
- Supports GPU selection, built-in GPU overclocking features and temperature management.
- Supports Ethereum forks (Expanse, etc).
- Windows and Linux versions.



This version is POOL/SOLO for Ethereum, POOL for Decred, POOL/SOLO for Siacoin, POOL for Lbry, POOL for Pascal, POOL for Blake2s, POOL for Keccak.

For old AMD cards, Catalyst (Crimson) 15.12 is required for best performance and compatibility.
For AMD 4xx/5xx cards (Polaris) you can use any recent drivers.
For AMD cards, set the following environment variables, especially if you have 2...4GB cards:

GPU_FORCE_64BIT_PTR 0
GPU_MAX_HEAP_SIZE 100
GPU_USE_SYNC_OBJECTS 1
GPU_MAX_ALLOC_PERCENT 100
GPU_SINGLE_ALLOC_PERCENT 100

For multi-GPU systems, set Virtual Memory size in Windows at least 16 GB (better more):
"Computer Properties / Advanced System Settings / Performance / Advanced / Virtual Memory".

This miner is free-to-use, however, current developer fee is 1%, every hour the miner mines for 36 seconds for developer. 
For all 2GB cards and 3GB cards devfee is 0%, so on these cards you can mine all ETH forks without devfee, this miner is completely free in this case.
If some cards are 2...3GB and some >3GB, 2...3GB cards still mine for you during devfee time, only cards that have more than 3GB memory will be used for devfee mining. Miner displays appropriate messages during startup.
Second coin (Decred/Siacoin/Lbry/Pascal/Blake2s/Keccak) is mined without developer fee.
So the developer fee is 0...1%, if you don't agree with the dev fee - don't use this miner, or use "-nofee" option.
Attempts to cheat and remove dev fee will cause a bit slower mining speed (same as "-nofee 1") though miner will show same hashrate. 
Miner cannot just stop if cheat is detected because creators of cheats would know that the cheat does not work and they would find new tricks. If miner does not show any errors or slowdowns, they are happy.

This version is for recent AMD videocards only: 7xxx, 2xx and 3xx, 2GB or more. Recent nVidia videocards are supported as well.

There are builds for Windows x64 and for Linux x64 (tested on Ubuntu 14.04). No 32-bit support. 



COMMAND LINE OPTIONS:

-epool 	Ethereum pool address. Only Stratum protocol is supported for pools. Miner supports all pools that are compatible with Dwarfpool proxy and accept Ethereum wallet address directly.
	For solo mining, specify "http://" before address, note that this mode is not intended for proxy or HTTP pools, also "-allpools 1" will be set automatically in this mode.
	Note: The miner supports all Stratum versions for Ethereum, HTTP mode is necessary for solo mining only. 
	Using any proxies will reduce effective hashrate by at least 1%, so connect miner to Stratum pools directly. Using HTTP pools will reduce effective hashrate by at least 5%.
	Miner also supports SSL/TLS encryption for all data between miner and pool (if pool supports encryption over stratum), it significantly improves security.
	To enable encryption, use "ssl://" or "stratum+ssl://" prefix (or "tls" instead of "ssl"), for example: "-epool ssl://eu1.ethermine.org:5555"

-ewal 	Your Ethereum wallet address. Also worker name and other options if pool supports it. 
	Pools that require "Login.Worker" instead of wallet address are not supported directly currently, but you can use "-allpools 1" option to mine there.

-epsw 	Password for Ethereum pool, use "x" as password.

-eworker Worker name, it is required for some pools.

-esm	Ethereum Stratum mode. 0 - eth-proxy mode (for example, dwarpool.com), 1 - qtminer mode (for example, ethpool.org), 
	2 - miner-proxy mode (for example, coinotron.com), 3 - nicehash mode. 0 is default. 

-etha	Ethereum algorithm mode for AMD cards. 0 - optimized for fast cards, 1 - optimized for slow cards, 2 - for gpu-pro Linux drivers. -1 - autodetect (default, automatically selects between 0 and 1). 
	You can also set this option for every card individually, for example "-etha 0,1,0".

-asm	(AMD cards only) enables assembler GPU kernels. In this mode some tuning is required even in ETH-only mode, use "-dcri" option or or "+/-" keys in runtime to set best speed.
	Specify "-asm 0" to disable this option. You can also specify values for every card, for example "-asm 0,1,0". Default value is "1".
	If ASM mode is enabled, miner must show "GPU #x: algorithm ASM" at startup.
	Check "FINE-TUNING" section below for additional notes.
	NEW: added alternative assembler kernels for Tahiti, Tonga, Ellesmere, Baffin cards for ETH-only mode. Use them if you get best speed at "-dcri 1" (i.e. you cannot find speed peak), use "-asm 2" option to enable this mode.

-oldkernels (AMD cards only) specify "-oldkernels 1" to use old-style GPU kernels from v10, they can be more stable for hard OC and custom BIOSes.

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
	If you mine ETC on some pool that does not accept wallet address but requires Username.Worker instead, the best way is to specify "-allcoins etc", in this mode devfee mining will be on ETC pools and DAG won't be recreated at all.

-etht	Time period between Ethereum HTTP requests for new job in solo mode, in milliseconds. Default value is 200ms.

-erate	send Ethereum hashrate to pool. Default value is "1", set "-erate 0" if you don't want to send hashrate.

-estale	send Ethereum stale shares to pool, it can increase effective hashrate a bit. Default value is "1", set "-estale 0" if you don't want to send stale shares.

-dpool 	Decred/Siacoin/Lbry/Pascal pool address. Use "http://" prefix for HTTP pools, "stratum+tcp://" for Stratum pools. If prefix is missed, Stratum is assumed.
	Decred: both Stratum and HTTP are supported. Siacoin: both Stratum and HTTP are supported, though note that not all Stratum versions are supported currently. Lbry: only Stratum is supported.

-dwal	Your Decred/Siacoin/Lbry/Pascal wallet address or worker name, it depends on pool.

-dpsw 	Password for Decred/Siacoin/Lbry/Pascal pool.

-di 	GPU indexes, default is all available GPUs. For example, if you have four GPUs "-di 02" will enable only first and third GPUs (#0 and #2).
	You can also turn on/off cards in runtime with "0"..."9" keys and check current statistics with "s" key.
	For systems with more than 10 GPUs: use letters to specify indexes more than 9, for example, "a" means index 10, "b" means index 11, etc; also "a", "b", and "c" keys allow you to turn on/off GPU #10, #11 and #12 in runtime.

-gser	this setting can improve stability on multi-GPU systems if miner hangs during startup. It serializes GPUs initalization routines. Use "-gser 1" to serailize some of routines and "-gser 2" to serialize all routines. 
	Using values higher than 2 allows you also to set custom delay between DAG generation on GPUs, for example, "-gser 5" means same as "-gser 2" and also adds 3sec delay between DAG generation (can be useful for buggy drivers and/or weak PSU).
	Default value is "0" (no serialization, fast initialization).

-mode	Select mining mode:
	"-mode 0" (default) means dual Ethereum + Decred/Siacoin/Lbry mining mode.
	"-mode 1" means Ethereum-only mining mode. You can set this mode for every card individually, for example, "-mode 1-02" will set mode "1" for first and third GPUs (#0 and #2).
	For systems with more than 10 GPUs: use letters to specify indexes more than 9, for example, "a" means index 10, "b" means index 11, etc.

-dcoin	select second coin to mine in dual mode. Possible options are "-dcoin dcr", "-dcoin sc", "-dcoin lbc", "-dcoin pasc", "-dcoin blake2s", "-dcoin keccak". Default value is "dcr".

-dcri	Decred/Siacoin/Lbry/Pascal intensity, or Ethereum fine-tuning value in ETH-only ASM mode. Default value is 30, you can adjust this value to get the best Decred/Siacoin/Lbry mining speed without reducing Ethereum mining speed. 
	You can also specify values for every card, for example "-dcri 30,100,50".
	You can change the intensity in runtime with "+" and "-" keys and also use "x" key to select single GPU for intensity adjustment.
	For example, by default (-dcri 30) 390 card shows 29MH/s for Ethereum and 440MH/s for Decred. Setting -dcri 70 causes 24MH/s for Ethereum and 850MH/s for Decred.
	Use this option in ETH-only ASM mode for fine tuning, read "FINE-TUNING" section below.
	If you did not specify "-dcri" option in ETH-only ASM mode, miner will detect best -dcri values automatically, you can also press "z" key to do it.

-dcrt	Time period between Decred/Siacoin HTTP requests for new job, in seconds. Default value is 5 seconds.

-ftime	failover main pool switch time, in minutes, see "Failover" section below. Default value is 30 minutes, set zero if there is no main pool.

-wd 	watchdog option. Default value is "-wd 1", it enables watchdog, miner will be closed (or restarted, see "-r" option) if any thread is not responding for 1 minute or OpenCL call failed.
	Specify "-wd 0" to disable watchdog.

-r	Restart miner mode. "-r 0" (default) - restart miner if something wrong with GPU. "-r -1" - disable automatic restarting. -r >20 - restart miner if something 
	wrong with GPU or by timer. For example, "-r 60" - restart miner every hour or when some GPU failed.
	"-r 1" closes miner and execute "reboot.bat" file ("reboot.bash" or "reboot.sh" for Linux version) in the miner directory (if exists) if some GPU failed. 
	So you can create "reboot.bat" file and perform some actions, for example, reboot system if you put this line there: "shutdown /r /t 5 /f".

-minspeed	minimal speed for ETH, in MH/s. If miner cannot reach this speed for 5 minutes for any reason, miner will be restarted (or "reboot.bat" will be executed if "-r 1" is set). Default value is 0 (feature disabled).
	You can also specify negative values if you don't want to restart miner due to pool connection issues; for example, "-minspeed -50" will restart miner only if it cannot reach 50Mh/s at good pool connection.

-retrydelay	delay, in seconds, between connection attempts. Default values is "20". Specify "-retrydelay -1" if you don't need reconnection, in this mode miner will exit if connection is lost.

-dbg	debug log and messages. "-dbg 0" - (default) create log file but don't show debug messages. 
	"-dbg 1" - create log file and show debug messages. "-dbg -1" - no log file and no debug messages.

-logfile	debug log file name. After restart, miner will append new log data to the same file. If you want to clear old log data, file name must contain "noappend" string.
	If missed, default file name will be used. You can also use this option to specify folder for log files, use slash at the end to do it, for example, "-logfile logs\".

-logsmaxsize	maximal size of debug log files, in MB. At every start the miner checks all files in its folder, selects all files that contain "_log.txt" string and removes oldest files if summary files size is larger than specified value. 
	Specify "-logsmaxsize 0" to cancel old logs removal. Default value is 1000 (i.e. about 1GB of log files are allowed).

-nofee	set "1" to cancel my developer fee at all. In this mode some optimizations are disabled so mining speed will be slower by about 3%. 
	By enabling this mode, I will lose 100% of my earnings, you will lose only about 2% of your earnings.
	So you have a choice: "fastest miner" or "completely free miner but a bit slower".
	If you want both "fastest" and "completely free" you should find some other miner that meets your requirements, just don't use this miner instead of claiming that I need 
	to cancel/reduce developer fee, saying that 1% developer fee is too much for this miner and so on.

-benchmark	benchmark mode, specify "-benchmark 1" to see hashrate for your hardware. You can also specify epoch number for benchmark, for example, "-benchmark 110".

-li	low intensity mode. Reduces mining intensity, useful if your cards are overheated. Note that mining speed is reduced too. 
	More value means less heat and mining speed, for example, "-li 10" is less heat and mining speed than "-li 1". You can also specify values for every card, for example "-li 3,10,50".
	Default value is "0" - no low intensity mode.

-lidag	low intensity mode for DAG generation, it can help with OC or weak PSU. Supported values are 0, 1, 2, 3, more value means lower intensity. Example: "-lidag 1".
	You can also specify values for every card, for example "-lidag 1,0,3". Default value is "0" (no low intensity for DAG generation).

-ejobtimeout	job timeout for ETH, in minutes. If miner does not get new jobs for this time, it will disconnect from pool. Default value is 10.

-djobtimeout	job timeout for second coin in dual mode, in minutes. If miner does not get new jobs for this time, it will disconnect from pool. Default value is 30.

-tt	set target GPU temperature. For example, "-tt 80" means 80C temperature. You can also specify values for every card, for example "-tt 70,80,75".
	You can also set static fan speed if you specify negative values, for example "-tt -50" sets 50% fan speed. Specify zero to disable control and hide GPU statistics.
	"-tt 1" (default) does not manage fans but shows GPU temperature and fan status every 30 seconds. Specify values 2..5 if it is too often.
	Note: for NVIDIA cards in Linux OS temperature management is not supported, only temperature monitoring is supported.
	Note: for Linux gpu-pro drivers, miner must have root access to manage fans, otherwise only monitoring will be available.

-ttdcr	reduce Decred/Siacoin/Lbry/Pascal intensity automatically if GPU temperature is above specified value. For example, "-ttdcr 80" reduces Decred intensity if GPU temperature is above 80C. 
	You can see current Decred intensity coefficients in detailed statistics ("s" key). So if you set "-dcri 50" but Decred/Siacoin intensity coefficient is 20% it means that GPU currently mines Decred/Siacoin at "-dcri 10".
	You can also specify values for every card, for example "-ttdcr 80,85,80". You also should specify non-zero value for "-tt" option to enable this option.
	It is a good idea to set "-ttdcr" value higher than "-tt" value by 3-5C.

-ttli	reduce entire mining intensity (for all coins) automatically if GPU temperature is above specified value. For example, "-ttli 80" reduces mining intensity if GPU temperature is above 80C.
	You can see if intensity was reduced in detailed statistics ("s" key).
	You can also specify values for every card, for example "-ttli 80,85,80". You also should specify non-zero value for "-tt" option to enable this option.
	It is a good idea to set "-ttli" value higher than "-tt" value by 3-5C.

-tstop	set stop GPU temperature, miner will stop mining if GPU reaches specified temperature. For example, "-tstop 95" means 95C temperature. You can also specify values for every card, for example "-tstop 95,85,90".
	This feature is disabled by default ("-tstop 0"). You also should specify non-zero value for "-tt" option to enable this option.
	If it turned off wrong card, it will close miner in 30 seconds.
	You can also specify negative value to close miner immediately instead of stopping GPU, for example, "-tstop -95" will close miner as soon as any GPU reach 95C temperature.

-tstart	set start temperature for overheated GPU that was previously stopped with "-tstop" option. For example, "-tstop 95 -tstart 50" disables GPU when it reaches 95C and re-enables it when it reaches 50C.
	You can also specify values for every card, for example "-tstart 50,55,50". Note that "-tstart" option value must be less than "-tstop" option value.
	This feature is disabled by default ("-tstart 0"). You also should specify non-zero value for "-tt" option to enable this option.

-fanmax	set maximal fan speed, in percents, for example, "-fanmax 80" will set maximal fans speed to 80%. You can also specify values for every card, for example "-fanmax 50,60,70".
	This option works only if miner manages cooling, i.e. when "-tt" option is used to specify target temperature. Default value is "100".
	Note: for NVIDIA cards this option is supported in Windows only.

-fanmin	set minimal fan speed, in percents, for example, "-fanmin 50" will set minimal fans speed to 50%. You can also specify values for every card, for example "-fanmin 50,60,70".
	This option works only if miner manages cooling, i.e. when "-tt" option is used to specify target temperature. Default value is "0".
	Note: for NVIDIA cards this option is supported in Windows only.

-cclock	set target GPU core clock speed, in MHz. If not specified or zero, miner will not change current clock speed. You can also specify values for every card, for example "-cclock 1000,1050,1100,0".
	For NVIDIA you can also specify delta clock by using "+" and "-" prefix, for example, "-cclock +300,-400,+0".
	Note: for some drivers versions AMD blocked underclocking for some reason, you can overclock only.
	Note: this option changes clocks for all power states, so check voltage for all power states in WattMan or use -cvddc option.  
	By default, low power states have low voltage, setting high GPU clock for low power states without increasing voltage can cause driver crash.
	Note: for NVIDIA cards this option is supported in Windows only. 

-mclock	set target GPU memory clock speed, in MHz. If not specified or zero, miner will not change current clock speed. You can also specify values for every card, for example "-mclock 1200,1250,1200,0".
	For NVIDIA you can also specify delta clock by using "+" and "-" prefix, for example, "-cclock +300,-400,+0".
	Note: for some drivers versions AMD blocked underclocking for some reason, you can overclock only.
	Note: for NVIDIA cards this option is supported in Windows only.

-powlim set power limit, usually from -50 to 50. For example, "-powlim -20" means 80% power limit. If not specified, miner will not change power limit. You can also specify values for every card, for example "-powlim 20,-20,0,10".
	Note: for NVIDIA cards this option is supported in Windows only.

-cvddc	set target GPU core voltage, multiplied by 1000. For example, "-cvddc 1050" means 1.05V. You can also specify values for every card, for example "-cvddc 900,950,1000,970". Supports latest AMD 4xx cards only in Windows.
	Note: for NVIDIA cards this option is not supported.

-mvddc	set target GPU memory voltage, multiplied by 1000. For example, "-mvddc 1050" means 1.05V. You can also specify values for every card, for example "-mvddc 900,950,1000,970". Supports latest AMD 4xx cards only in Windows.
	Note: for NVIDIA cards this option is not supported.

-mport	remote monitoring/management port. Default value is -3333 (read-only mode), specify "-mport 0" to disable remote monitoring/management feature. 
	Specify negative value to enable monitoring (get statistics) but disable management (restart, uploading files), for example, "-mport -3333" enables port 3333 for remote monitoring, but remote management will be blocked.
	You can also use your web browser to see current miner state, for example, type "localhost:3333" in web browser. 
	Warning: use negative option value or disable remote management entirely if you think that you can be attacked via this port!
	By default, miner will accept connections on specified port on all network adapters, but you can select desired network interface directly, for example, "-mport 127.0.0.1:3333" opens port on localhost only.

-mpsw	remote monitoring/management password. By default it is empty, so everyone can ask statistics or manage miner remotely if "-mport" option is set. You can set password for remote access (at least EthMan v3.0 is required to support passwords).

-colors enables or disables colored text in console. Default value is "1", use "-colors 0" to disable coloring. Use 2...4 values to remove some of colors.

-v	displays miner version, sample usage: "-v 1".

-altnum	alternative GPU indexing. This option does not change GPU order, but just changes GPU indexes that miner displays, it can be useful in some cases. Possible values are:
	0: default GPU indexing. For example, if you specify "-di 05" to select first and last GPUs of six GPUs installed, miner will display these two selected cards as "GPU0" and "GPU1".
	1: same as "0", but start indexes from one instead of zero. For example, if you specify "-di 05" to select first and last GPUs of six GPUs installed, miner will display these two selected cards as "GPU1" and "GPU2".
	2: alternative GPU indexing. For example, if you specify "-di 05" to select first and last GPUs of six GPUs installed, miner will display these two selected cards as "GPU0" and "GPU5".
	3: same as "2", but start indexes from one instead of zero. For example, if you specify "-di 05" to select first and last GPUs of six GPUs installed, miner will display these two selected cards as "GPU1" and "GPU6".
	Default value is "0".

-platform	selects GPUs manufacturer. 1 - use AMD GPUs only. 2 - use NVIDIA GPUs only. 3 - use both AMD and NVIDIA GPUs. Default value is "3".

-checkcert	only for SSL connection: verify pool certificate. Default value is "1" (verify), use "-checkcert 0" to skip certificate verification.

-epoolsfile	failover filename for ETH, default value is "epools.txt".

-dpoolsfile	failover filename for seconds coin, default value is "dpools.txt".

-y	enables Compute Mode and disables CrossFire for AMD cards. "-y 1" works as pressing "y" key when miner starts. This option works in Windows only.

-showdiff	use "-showdiff 1" to show difficulty for every ETH share and to display maximal found share difficulty when you press "s" key. Default value is "0".



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
	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool stratum+tcp://yiimp.ccminer.org:3252 -dwal DsUt9QagrYLvSkJHXCvhfiZHKafVtzd7Sq4 -dpsw x
	you can also specify "-esm 1" option to enable "qtminer" mode, in this mode pool will display additional information about shares (accepted/rejected), for example:
	EthDcrMiner64.exe -epool us1.ethermine.org:4444 -esm 1 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool stratum+tcp://yiimp.ccminer.org:3252 -dwal DsUt9QagrYLvSkJHXCvhfiZHKafVtzd7Sq4 -dpsw x

 ethpool, ethermine  (and Siacoin solo):
	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool http://localhost:9980/miner/header -dcoin sia

 ethpool, ethermine  (and Siacoin pool):
	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool http://sia-eu1.nanopool.org:9980/miner/header?address=3be0304dee313515cf401b8593a0c1df905ed13f0adaee89a8d7337d2ba8209e5ca9f297bbc2 -dcoin sia

 ethpool, ethermine  (and Siacoin pool with worker name):
   	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool http://sia-eu1.nanopool.org:9980/miner/header?"address=YourSiaAddress&worker=YourWorkerName" -dcoin sia

 same for siamining pool:
	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool "http://siamining.com:9980/miner/header?address=3be0304dee313515cf401b8593a0c1df905ed13f0adaee89a8d7337d2ba8209e5ca9f297bbc2&worker=YourWorkerName" -dcoin sia

 dwarfpool (and Stratum for Decred):
	EthDcrMiner64.exe -epool eth-eu.dwarfpool.com:8008 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F/YourWorkerName -epsw x -dpool stratum+tcp://dcr.suprnova.cc:3252 -dwal Redhex.my -dpsw x
	Read dwarfpool FAQ for additional options, for example, you can setup email notifications if you specify your email as password.

 dwarfpool (and Stratum for Lbry):
	EthDcrMiner64.exe -epool eth-eu.dwarfpool.com:8008 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F/YourWorkerName -epsw x -dpool stratum+tcp://lbry.suprnova.cc:6256 -dwal Redhex.my -dpsw x -dcoin lbc
	Read dwarfpool FAQ for additional options, for example, you can setup email notifications if you specify your email as password.

 nanopool Ethereum+Siacoin:
EthDcrMiner64.exe -epool eth-eu1.nanopool.org:9999 -ewal YOUR_ETH_WALLET/YOUR_WORKER/YOUR_EMAIL -epsw x -dpool "http://sia-eu1.nanopool.org:9980/miner/header?address=YOUR_SIA_WALLET&worker=YOUR_WORKER_NAME&email=YOUR_EMAIL" -dcoin sia

 nanopool Ethereum+Siacoin(Stratum):
EthDcrMiner64.exe -epool eth-eu1.nanopool.org:9999 -ewal YOUR_ETH_WALLET/YOUR_WORKER/YOUR_EMAIL -epsw x -dpool stratum+tcp://sia-eu1.nanopool.org:7777 -dwal YOUR_SIA_WALLET/YOUR_WORKER/YOUR_EMAIL -dcoin sia

 nicehash Ethereum+Decred:
EthDcrMiner64.exe -epool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353 -ewal 1LmMNkiEvjapn5PRY8A9wypcWJveRrRGWr -epsw x -esm 3 -allpools 1 -estale 0 -dpool stratum+tcp://decred.eu.nicehash.com:3354 -dwal 1LmMNkiEvjapn5PRY8A9wypcWJveRrRGWr

 miningpoolhub Ethereum+Siacoin:
	EthDcrMiner64.exe -epool us-east1.ethereum.miningpoolhub.com:20536 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F -eworker YourLogin.YourWorkerName -epsw x -dpool stratum+tcp://hub.miningpoolhub.com:20550 -dwal username.workername -dpsw x -dcoin sia
	you must also create worker "YourWorkerName" on pool and specify your wallet address there.

 suprnova Ethereum_Classic(ETC)+Siacoin:
	ethdcrminer64.exe -epool etc-eu.suprnova.cc:3333 -ewal YourLogin.YourWorkerName -epsw x -esm 3 -dpool sia.suprnova.cc:7777 -dwal YourLogin.YourWorkerName -dpsw x -dcoin sia -allpools 1 -allcoins -1

 coinotron:
	EthDcrMiner64.exe -epool coinotron.com:3344 -ewal Redhex.rig1 -esm 2 -epsw x -dpool http://dcr.suprnova.cc:9111 -dwal Redhex.my -dpsw x -allpools 1

 coinmine:
	EthDcrMiner64.exe -epool eth.coinmine.pl:4000 -ewal USERNAME.WORKER -esm 2 -epsw WORKER_PASS -allpools 1 -dpool stratum+tcp://dcr.coinmine.pl:2222 -dwal USERNAME.WORKER -dpsw WORKER_PASS

 ethpool+suprnova Ethereum+Pascal:
	ethdcrminer64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool stratum+tcp://pasc.suprnova.cc:5279 -dwal YourLogin.YourWorkerName -dpsw x -dcoin pasc -allpools 1

 nicehash Ethereum+Blake2s:
EthDcrMiner64.exe -epool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353 -ewal 1LmMNkiEvjapn5PRY8A9wypcWJveRrRGWr -epsw x -esm 3 -allpools 1 -estale 0 -dpool stratum+tcp://blake2s.eu.nicehash.com:3361 -dwal 1LmMNkiEvjapn5PRY8A9wypcWJveRrRGWr -dcoin blake2s

 nicehash Ethereum+Keccak:
EthDcrMiner64.exe -epool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353 -ewal 1LmMNkiEvjapn5PRY8A9wypcWJveRrRGWr -epsw x -esm 3 -allpools 1 -estale 0 -dpool stratum+tcp://keccak.eu.nicehash.com:3338 -dwal 1LmMNkiEvjapn5PRY8A9wypcWJveRrRGWr -dcoin keccak



Ethereum-only mining:

 ethpool:
	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F -epsw x

 sparkpool:
	EthDcrMiner64.exe -epool eu.sparkpool.com:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F -epsw x

 f2pool:
	EthDcrMiner64.exe -epool eth.f2pool.com:8008 -ewal 0xd69af2a796a737a103f12d2f0bcc563a13900e6f -epsw x -eworker rig1

 nanopool:
	EthDcrMiner64.exe -epool eth-eu1.nanopool.org:9999 -ewal 0xd69af2a796a737a103f12d2f0bcc563a13900e6f -epsw x -eworker rig1

 nicehash:
	EthDcrMiner64.exe -epool stratum+tcp://daggerhashimoto.eu.nicehash.com:3353 -ewal 1LmMNkiEvjapn5PRY8A9wypcWJveRrRGWr -epsw x -esm 3 -allpools 1 -estale 0

Ethereum forks mining:

	EthDcrMiner64.exe -epool exp-us.dwarfpool.com:8018 -ewal 0xd69af2a796a737a103f12d2f0bcc563a13900e6f -epsw x -allcoins -1

Ethereum SOLO mining (assume geth is on 192.168.0.1:8545):

	EthDcrMiner64.exe -epool http://192.168.0.1:8545



FINE-TUNING

Dual mode: change "-dcri" option value with "+/-" keys in runtime to find best speeds.
ETH-only mode when ASM algorithm is used (enabled by default): change "-dcri" option value with "+/-" keys in runtime to find best speeds. If you get best speed at "-dcri 1" (i.e. you cannot find speed peak), use "-asm 2" option to enable alternative ASM kernel (available for Tonga and Polaris cards only).
NOTE 1: if GPU throttles (overheated) or if you overclocked GPU, best "-dcri" value will be different.
NOTE 2: speed peak can be rather short, so change "-dcri" value slowly, one-by-one.
NOTE 3: best -dcri values for ETH-only mode and dual mode can be different.
NOTE 4: you can use "x" key to select single GPU for -dcri value adjustment.
NOTE 5: if you did not specify "-dcri" option in ETH-only ASM mode, miner will detect best -dcri values automatically, you can also press "z" key to do it.



FAILOVER

Use "epools.txt" and "dpools.txt" files to specify additional pools (you can use "-epoolsfile" and "-dpoolsfile" options to use different filenames). 
These files have text format, one pool per line. Every pool has 3 connection attempts. 
Miner disconnects automatically if pool does not send new jobs for a long time or if pool rejects too many shares.
If the first character of a line is ";" or "#", this line will be ignored. 
Do not change spacing, spaces between parameters and values are required for parsing.
If you need to specify "," character in parameter value, use two commas - ,, will be treated as one comma.
You can reload "epools.txt" and "dpools.txt" files in runtime by pressing "r" key.
Pool specified in the command line is "main" pool, miner will try to return to it every 30 minutes if it has to use some different pool from the list. 
If no pool was specified in the command line then first pool in the failover pools list is main pool.
You can change 30 minutes time period to some different value with "-ftime" option, or use "-ftime 0" to disable switching to main pool.
You can also use environment variables in "epools.txt", "dpools.txt" and "config.txt" files. For example, define "WORKER" environment variable and use it as "%WORKER%" in config.txt or in epools.txt.
You can also select current pool in runtime by pressing "e" or "d" key.



REMOTE MONITORING/MANAGEMENT

Miner supports remote monitoring/management via JSON protocol over raw TCP/IP sockets. You can also get recent console text lines via HTTP.
Start "EthMan.exe" from "Remote management" subfolder (Windows version only).
Check built-in help for more information. "API.txt" file contains more details about protocol.



KNOWN ISSUES

- AMD cards: on some cards you can notice non-constant mining speed in dual mode, sometimes speed becomes a bit slower. This issue was mostly fixed in recent versions, but not completely.
- AMD cards: in Linux with gpu-pro drivers, the list of GPUs may differ from the list of temperatures. You can use -di to change order of GPUs to match both lists.
- nVidia cards: dual mode is not so effective as for AMD cards.
- Windows 10 Defender recognizes miner as a virus, some antiviruses do the same. Miner is not a virus, add it to Defender exceptions. 
  I write miners since 2014. Most of them are recognized as viruses by some paranoid antiviruses, perhaps because I pack my miners to protect them from disassembling, perhaps because some people include them into their botnets, or perhaps these antiviruses are not good, I don't know. For these years, a lot of people used my miners and nobody confirmed that my miner stole anything or did something bad. 
  Note that I can guarantee clean binaries only for official links in my posts on this forum (bitcointalk). If you downloaded miner from some other link - it really can be a virus.
  However, my miners are closed-source so I cannot prove that they are not viruses. If you think that I write viruses instead of good miners - do not use this miner, or at least use it on systems without any valuable data.



TROUBLESHOOTING

1. Install Catalyst v15.12 for old AMD cards; for Fury, Polaris and Vega cards use latest blockchain drivers.
2. Disable overclocking.
3. Set environment variables as described above.
4. Set Virtual Memory 16 GB or more.
5. Reboot computer.
6. Check hardware, risers.
7. Set some timeout in .bat file before starting miner at system startup (30sec or even a minute), and try "-ethi 4" to check if it is more stable. It can help if miner is not stable on some system.
 


FAQ

- Miner works too slowly when I mine ETH/ETC but works fine when I mine some ETH fork.
  Check if you enabled "Compute Mode" in AMD drivers, also you can press "y" key to turn on "Compute Mode" in AMD drivers for all cards (Windows only).

- I cannot mine ETH/ETC with Nvidia 3GB card in Windows 10.
  Windows 10 internally allocates about 20% of GPU memory so applications can use only 80% of GPU memory. Use Windows 7 or Linux. 

- I see 0% devfee for all 2GB and 3GB cards, my rig has some 3GB cards and some 6GB cards, how is the fee calculated in this case?
  During devfee mining 3GB cards still mine for you. How does it work? Miner creates second connection for devfee mining, main connection still works and 3GB cards still find shares for it. 
  You can see these shares in the log file, all devfee shares contain "Devfee:" string, normal shares don't contain this string and 3GB cards can find them during devfee mining as well.
  Note that devfee mining takes only 36 seconds per hour so it can take many hours to find normal shares during devfee mining.

- What is dwarfpool proxy (eth-proxy)?
Official Ethereum miner does not support Stratum protocol, it supports HTTP protocol only. It causes less profit because of delays.
A proxy was created to fix it, so official Ethereum miner is locally connected to the proxy by HTTP protocol, for local network delays due to HTTP protocol are small. Proxy is connected to the pool via Stratum protocol so it has small delays too. Currently most pools support Stratum and you have to use HTTP-to-Stratum proxy to make official miner work with pools properly. Of course you can try to connect official miner to a pool directly via HTTP but you will lose 10-20% shares because of a short block time in Ethereum.
This miner does not use HTTP protocol, it uses Stratum directly. So you should connect it directly to the pool at Stratum port and it will work a bit faster than official miner via proxy because there is no proxy between miner and pool.

- What command option X means?
  Read "Readme!!!.txt", "COMMAND LINE OPTIONS" section.

- How to mine using pool X?
  Read "Readme!!!.txt", "SAMPLE USAGE" section.

- Windows 10 marks miner as a virus.
  Read "Readme!!!.txt", "KNOWN ISSUES" section.

- Can miner stop overheated GPU?
  Yes, see "-tstop" option.

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

- Why miner on Linux with stock card settings gives a bit lower hashrate than on Windows?
  This probably is the difference in time calculations on both platforms. In reality the accepted hashrate is usually the same.

- Why -cclock/-mclock options do not work?
  Sometimes they do not work. Use Afterburner or Trixx on Windows, atitweak and other tools on Linux instead.

- Why my GPU is 10C hotter in Dual mode?
  This is a price for the extra work done. It also consumes more power, so make sure your PSU has sufficient power.

- Can the temperature be lowered?
  Yes, see "-tt", "-dcri", "-ttdcr", "-li", "-ttli" options.

- How can I undervolt my cards on Linux?
  Usually only by flashing modified GPU BIOS. Unfortunately, no standard way of doing so.

- Why pool shows less hashrate than miner?
  On my test rigs I use miner with default settings and on pool I see about 4-5% less than miner shows (my hashrate is about 800MH/s if I turn on all rigs). 
  Miner shows "raw" hashrate, 1% is devfee, other 2-3% can be related to the connection quality, current pool status/luck or/and may be something else. 
  Also, from my calculations miner loses about 0.5-1% because it cannot drop current GPU round when it gets new job, it is related to "-ethi" value, so I made it 8 by default instead of 16.
  But if on pool you see 10% less than miner shows all the time - something is wrong with your pool, your connection to internet or your hashrate is low and you did not wait enough time to see average hashrate for 24 hours. 
  Usually I use "ethpool" pool for tests.

- I see only one card via Remote Desktop Connection.
  It's a problem of RDC, use TeamViewer or some other remote access software. Or try to use latest version of the miner.

- I see only one card instead of two in temperature management info.
  Disable CrossFire, don't use Remote Desktop Connection. Or try to use latest version of the miner.

- Miner works in ETH-only mode but crashes in dual mode.
  Dual mode requires more power, so make sure PSU power is enough and check GPU clocks if you OC'ed them.

- Error "server: bind failed with error".
  Specify "-mport 0" option.

- How can I get stats from miner as EthMan does?
  Check API.txt file for json protocol details.

- I cannot mine Ethereum with 2GB card.
  Yes, you cannot mine Ethereum or Ethereum Classic with 2GB cards anymore. But you can mine other Ethereum forks.

- I mine ETH fork on my 2GB cards. For devfee miner tries to mine ETH and it fails because ETH cannot be mined on 2GB cards.
- Use "-allcoins exp -allpools 1" options.

- Miner freezes if I put cursor to its window in Windows 10 until any key is pressed. Sometimes miner freezes randomly until any key is pressed.
  You should make some changes in Windows:
  https://superuser.com/questions/555160/windows-command-prompt-freezing-on-focus
  https://superuser.com/questions/419717/windows-command-prompt-freezing-randomly?rq=1
  https://superuser.com/questions/1051821/command-prompt-random-pause?rq=1

- Sometimes miner cannot connect to devfee mining server at first attempt, does it cause longer devfee mining?
  No, during these connection attempts miner still mines for you. 

- I upgraded from v8.x (or earlier) to v9.x, I mine ETH-only and I see v9.x is slower than v8.x, why?
  In v9.x you should find best -dcri value even in ETH-only mode, check "FINE-TUNING" section. If you don't want to do it, use "-asm 0" option to use old GPU kernels.

- How many cards are supported?
  Miner supports up to 32 GPUs.

- Miner crashed and I cannot restart it until reboot.
  Often when OpenCL fails, you have to reboot the system, not just restart miner. Sometimes even soft reboot won't work and you have to press Reset button. It is because the fail is at drivers level, Windows does not like such things and drivers too.



FAQ #2:

1. If you think that the miner will mine even if you turn off the router, wait a couple of minutes more, it will stop.
2. Place all command line arguments in .BAT file in a single line. Arguments from the second line will be ignored.
3. Use latest version if you have problems with DCR or SIA.
4. I don't have any private versions with +50% speed.
5. I'm a software developer, so I think I cannot help you to build your mining rig properly or provide you with the list of necessary parts, please ask this question here on forum or search here, there are many threads related to hardware.
6. Please read Readme.txt or original post of this thread for command line samples, options description and FAQ.
7. I don't have miners for Tesla, IBM CPUs, Phi or for very old GPUs.
8. Mining on laptops is a bad idea.
9. You will not see full hashrate on pool immediately, you have to wait for 24 hours at least.
10. If miner cannot generate DAG file, check environment variables (see Readme), check if your GPU has 3GB memory at least, and check if you have enough virtual memory (pagefile). If all this does not help, try to install more physical RAM.
