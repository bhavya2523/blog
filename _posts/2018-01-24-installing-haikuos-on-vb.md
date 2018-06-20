---
layout: post
comments: true
title: Installing HaikuOS using VirtualBox
categories: Tutorial
tags: Haiku VirtualBox GSoC17
image: /public/img/haiku-on-vb0.jpg
---
Hello People,

So, basically I started contributing to Open Source but this time, I selected HaikuOS as the organization and started doing my work. I started with two bugs in [HaikuArchives/Weather App](https://github.com/HaikuArchives/Weather). Before doing some work, I need to build it right! So, I installed Haiku in a virtual machine (VirtualBox). In this blog post, I will showing how to do that (step-wise) and discuss the errors I have faced while installing and how I fixed them.

The Haiku OS is available in a stable version (R1/Alpha 4.1) and nightly images. The nightlies are always updated and should be used for development of new applications. So, it is advisable to install the nightly image [haiku-nightly-anyboot](https://download.haiku-os.org/). You can get Virtual Box from [here](https://www.virtualbox.org/wiki/Downloads). Download the VirtualBox for your suitable platform and install it.

### Commands to install Virtual Box in Ubuntu 16.04

> NOTE : You can try the below commmand using `$ sudo -s`, as it requires permission.

```console
$ deb http://download.virtualbox.org/virtualbox/debian xenial contrib
$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
$ wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get install virtualbox-5.2
$ virtualbox
```

So, currently I experimented all these stuff in my machine which is a dual-boot Ubuntu 16.04 (main) and Windows 10.

### Installing Haiku OS in a virtual machine

Once you start open your virtual box, follow the below steps

1.
  Create a **New** virtual machine and we need to  specify what kind of guest operating system we are going to install. This is helpful in the pre-configuration of virtual machines – it applies default settings for supported OS’s.
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb1.png" alt="" style="border: 1px solid">
  </p>
  For Haiku, we are going to choose *Other* for operating system type and *Other/Unknown* for version. Click on **Next**
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb2.png" alt="" style="border: 1px solid">
  </p>

2.
  The next step is to define how much of the host’s physical memory we want to allocate for our virtual machine. This decision should be based on the amount of RAM the host has, but it is recommended to spend a minimum of 256MB of RAM to make it run smoothly. Click on **Next**
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb3.png" alt="" style="border: 1px solid">
  </p>
3.
  After we have done that, we need to create a hard disk image, which is going to be stored on the physical drive, at the specified location. We choose *Create a virtual harddrive now* (if it is not selected already) and click **Create**
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb4.png" alt="" style="border: 1px solid">
  </p>
  Choose *VDI* and **Next**
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb5.png" alt="" style="border: 1px solid">
  </p>
  Here we can define how big the virtual hard disk should be. In most cases it is sufficient to use the default option, which is *Dynamically allocated*. Click on **Next**
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb6.png" alt="" style="border: 1px solid">
  </p>
  The next slide will ask us for the location of the hard disk image file and the maximum size of the dynamically expanding file. Input the values and click **Create**
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb7.png" alt="" style="border: 1px solid">
  </p>

4.
  Now the virtual box window opens again (similar to the image below). The next step is to configure our virtual machine.For that go to **Settings > Storage >**
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb8.png" alt="" style="border: 1px solid">
  </p>
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb9.png" alt="" style="border: 1px solid">
  </p>
  Now you can see that the *Storage Devices* contains *Empty* disc loaded. Click on the 💿 icon present near the top right of the window. Choose the iso file of the Haiku Os which you have downloaded earlier and click on **Open**
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb10.png" alt="" style="border: 1px solid">
  </p>
  Now you can see window like this (the iso file is loaded into the virtual machine). Click on **Ok**
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb11.png" alt="" style="border: 1px solid">
  </p>
5.
  Now you have installed Haiku in your Virtual machine. Now, you are ready to use a great OS. All you need is to select the OS which you want to load and clink on **Start** (green color arrow)
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb12.png" alt="" style="border: 1px solid">
  </p>
  The Haiku OS then loads in the VirtualBox and looks somewhat like the below image and that’s it. Now you can start using Haiku.  🙂
  <p align="center">
    <img src="/blog/public/img/haiku-on-vb13.png" alt="" style="border: 1px solid">
  </p>

### Errors

Now coming to the errors, I faced an error which continously bugged me for around two days.

<p align="center">
  <img src="/blog/public/img/haiku-on-vb14.png" alt="" style="border: 1px solid">
</p>

The error is **Kernel driver not installed (rc=-1908)**. I resolved this error by turning off the secure boot and running this code in the terminal.

```console
$ sudo modprobe vboxdrv
```

### Resources

https://askubuntu.com/questions/995804/ubuntu-16-04-virtualbox-5-0-host-crashes

https://askubuntu.com/questions/900794/virtualbox-rtr3initex-failed-with-rc-1912-rc-1912

https://www.haiku-os.org/guides/virtualizing/virtualbox/

https://www.haiku-os.org/get-haiku/installation-guide

That’s it for now. I will return soon with another blog post.

Cheers!!
