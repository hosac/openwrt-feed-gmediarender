
<h3> Headless UPnP Renderer for OpenWrt </h3>

The package is based on the [gmrender-resurrect](https://github.com/hzeller/gmrender-resurrect) project, which provides a headless UPnP renderer with focus on the Raspberry Pi.
In this repo the software is adapted to OpenWrt. 

Basic sound functionality successfully tested with OpenWrt 19.07 on MIPS and ARM platform (2020-04-08).

</br>

<h4> Add feed </h4>

Edit your "feeds.conf" and add

	src-git gmediarender https://github.com/hosac/openwrt-feed-gmediarender.git

Update and install

	./scripts/feeds update gmediarender
	./scripts/feeds install -a -p gmediarender
	
</br>

<h4> Packages for build system</h4>


	make menuconfig

Choose the basic package in "Multimedia" section. This will automatically enable some packages of the gst1-libav and gmediastreamer1, but this is not enough!
	
	> Multimedia
		> [*] gmediarender

To work properly some packages have to be enabled manually.

	> Multimedia
		> [*] gstreamer1-plugins-base
			> Select GStreamer base modules and libraries  --->
				> [*] Include all GStreamer base plugins
		> [*] gstreamer1-plugins-good
			> Select GStreamer good modules  --->
				> [*] Include all GStreamer good plugins

Recommended by the original project (see [INSTALL Instruction](https://github.com/hzeller/gmrender-resurrect/blob/master/INSTALL.md)) is to enable also all packages from <b>gstreamer1-plugins-bad</b> and <b>gstreamer1-plugins-ugly</b>, but for me it worked without activating.

</br>

<h4>Functionality</h4>

- The package will be enabled automatically in init.d at first boot after flashing
- It is using the hostname of your device as advertising name.
- Find the renderer now in the network with a player (e.g BubbleUPnP or natively with Windows10)

</br>

<h4> Notes</h4>

- Prerequisite is of course a well defined and enabled sound device

