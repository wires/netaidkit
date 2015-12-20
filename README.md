NetAidKit
====

Standalone VPN/Tor router for journalists and activists.


Using docker for development
----

When you are on Mac OS you can use docker to simplify the image build
process. First install docker, then

	docker-machine create -d virtualbox dev
	eval (docker-machine env dev)
	docker build -t netaidkit:latest .
	docker build -t netaidkit-build:latest -f Dockerfile2

	docker run -v (pwd):/dist -w /netaidkit/openwrt/ netaidkit-build cp bin/ar71xx/openwrt-ar71xx-generic-gl-inet-6416A-v1-squashfs-factory.bin /dist/netaidkit_firmware.bin
	docker run -v (pwd):/dist -w /netaidkit/openwrt/ netaidkit-build cp bin/ar71xx/openwrt-ar71xx-generic-gl-inet-6416A-v1-squashfs-sysupdate.bin /dist/netaidkit_firmware_sysupgrade.bin


Manually building the firmware image
----

Install dependencies

```bash
sudo apt-get update
sudo apt-get install git-core build-essential libssl-dev libncurses5-dev unzip subversion gawk
```


Create a working directory somewhere and execute the following commands:

```bash
git clone https://github.com/radicallyopensecurity/netaidkit
cd netaidkit && ./build.sh
```

The compiled images will be in the netaidkit/bin folder.

Flashing the GL-iNet:
----

<ol>
    <li>While pressing the reset button on the side of the GL-iNet,
        power on the device. You will see the green LED flashing.
        Hold the reset button until the green LED flashes 5 times.
        When the red light flashes once, release your finger.
        The device is now booting into failsafe mode.</li>
    <li>Connect to the device using an ethernet cable and manually 
        set your IP address to 192.168.1.2.</li>
    <li>Visit 192.168.1.1 in your browser and upload the image called
        openwrt-ar71xx-generic-gl-inet-6416A-v1-squashfs-factory.bin
        to the page and click 'Update firmware'. Wait for the device to
        reboot into the new firmware and do not turn it off.</li>
</ol>

Set-up
----
Connect to the NETAIDKIT access point using password 'netaidkit'. Browse to 192.168.101.1 and follow the steps to set-up your own AP and change the passwords.

Disconnect from wifi
----
To disconnect from a wifi network, press the reset button on the side of the device once (do not hold, simply press)
