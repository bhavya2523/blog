---
layout: post
comments: true
title: Building WebPositive and WebKit in Haiku
categories: Tutorial
tags: Haiku GSoC17 WebPositive WebKit
---
Hello Folks,

So, as you know I am planning to take part in Google Summer of Code with Haiku. I chose the project, **Updating and Extending WebPositive** to work on.

WebPositive is the native browser of Haiku which uses WebKit, an open source HTML rendering library which is also used by many other web browsers like Safari and Mozilla.

<p align="center">
  <img title="WebPositive and WebKit" src="/blog/public/img/building-web+-1.jpg" alt="">
</p>

Recently while I was making some changes in the virtualbox, my whole system crashed including Ubuntu, Haiku in VB and also the build environment of the project. I have to reinstall everything from the starting. I thought of writing a blog post on this for any emergency cases in the future.

In my previous post, I posted how to setup Haiku in Virtual Box. In this post, I would like to show you How to build the WebPositive and WebKit.

### Step by step procedure for building WebPositive

1.
  Make sure you setup your git before downloading the source code 💯
  ```console
  $ git config --global user.name “vchrombie”
  $ git config --global user.email “vchrombie@gmail.com”
  ```
2.
  Clone the source code of Haiku.
  Usually, the build tools are already installed in the nightly versions (mine is x86) of the haiku. If you choose cross-compiling, then you need to clone the build tools also. (see the resources for reference)
  ```console
  $ git clone http://github.com/haiku/haiku.git
  ```
3.
  Building WebPositive
  ```console
  $ cd haiku/
  $ ./configure
  $ cd src/apps/
  $ jam -q webpositive
  ```
  You’ll find the binary somewhere in your “generated” folder, watch the last lines of the jam output where it “chmod” the binary for the path; you can ALT+right-click it in Terminal to launch directly.

### Step by step procedure for building WebKit

1.
  Download the source code of webkit.
  The repository is huge (about 5 gigabytes). For building the latest version of WebKit, use the –depth option to git clone. This can be used to download only a limited part of the history and will reduce the checkout to about 600MB.
  ```console
  $ git clone --depth 1 https://github.com/haiku/webkit
  ```
2.
  Install the dependencies (for an x86, gcc2hybrid version)
  ```console
  $ pkgman install cmake_x86 gcc_x86 gperf haiku_x86_devel jpeg_x86_devel sqlite_x86_devel libpng16_x86_devel libxml2_x86_devel libxslt_x86_devel icu_x86_devel icu_devel perl python ruby_x86 libexecinfo_x86_devel libwebp_x86_devel lighttpd_x86 php pkgconfig_x86 pywebsocket gnutls36_x86 gnutls36_x86_devel
  ```

  > *NOTE* : skip these errors
  > *** Failed to find a match for "php" : Name not found
  > Could NOT find Ruby (missing: RUBY_INCLUDE_DIR RUBY_LIBRARY RUBY_CONFIG_INCLUDE_DIR) (found suitable version "2.2.0", minimum required is "1.9")

3.
  Configuring your build for the first time
  On an x86, gcc2hybrid Haiku:
  ```console
  $ PKG_CONFIG_LIBDIR=/boot/system/develop/lib/x86/pkgconfig CC=gcc-x86 CXX=g++-x86 Tools/Scripts/build-webkit --cmakeargs="-DCMAKE_AR=/bin/ar-x86 -DCMAKE_RANLIB=/bin/ranlib-x86" --haiku
  ```
4.
  Regular build, once configured
  ```console
  $ cd WebKitBuild/Release
  $ make -j4
  ```

This will build a release version of WebKit libraries on a quad core cpu.

On a successful build, executables and libraries are generated in the WebKitBuild/Release directory.

#### Working Scenes while building

![img](/blog/public/img/building-web+-2.png)
![img](/blog/public/img/building-web+-3.png)

That’s it for today’s post. I will be back with one more post on WebPositive (may be on the topic, “How did I fix my bugs?” )

### Resources

https://www.haiku-os.org/guides/building/get-source-git
https://github.com/haiku/webkit/blob/rebased/README.markdown

See you all later. Bye!! 👋
