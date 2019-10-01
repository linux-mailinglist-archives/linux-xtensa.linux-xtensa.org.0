Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id 2E317C2E7D
	for <lists+linux-xtensa@lfdr.de>; Tue,  1 Oct 2019 09:58:26 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id 40B445871;
	Tue,  1 Oct 2019 07:51:30 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by linux-xtensa.org (Postfix) with ESMTPS id 2BDB025D3
 for <linux-xtensa@linux-xtensa.org>; Tue,  1 Oct 2019 07:51:28 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 72so9088559lfh.6
 for <linux-xtensa@linux-xtensa.org>; Tue, 01 Oct 2019 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HL7S6GyFVqA7bP0mzKk923Nzto2wrYAra5WcT7YZYmc=;
 b=MfBQ2aZ2qnGfYnxNvOHM7Mw64Sp5twfXzNyZpcGdXPRse7AJw8FtQX+qbp1tkBxchV
 eq5OyZhvOTww6rzwqcV8rDKnAcCzWZEX+SqsqelK8qR+US1+78c/t38q3urhsQ+fnuT8
 g7GkG/W1KR/qTnox9I5OdeElsGEgI5z39uvWFQNVAw1Di2UNIOoQuDP8vRMzlws5bhqE
 OIuP7eFAIRaYHxZ1gpd+JMwBOQa91qK88SwpfW3BPNqqOq8Z3zTNpkADdkNbn0UCqvob
 z4U56IpBFiDda0T0UliTholmn/pIk8Rx1PAQ7eC1F1osMgxpTxLMSyLAT9e6zgFP42/P
 +9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HL7S6GyFVqA7bP0mzKk923Nzto2wrYAra5WcT7YZYmc=;
 b=oBE/Km6W22mJLNSqFUlKZQuI9rYqDtl35CxwtwqJ9CLejslgsQFlGRasRpxEK5hXv/
 cCAkRcuhal903rPr8uGVu+BQV9aAcP4iRMqZ545Jyp/9nmMEpwjs4tp6KcTdtavnIUrh
 Hw4P+/BZqaW7SId4NXKl5XYecbzpfY3WrG5AkBzoIg41MP6fRsyfXDYUcM8NCZBgXSyO
 Gs6hLwgCk1I1bbhjhq/7X528Kv1l5sh244YYOsDMMUnNxwKJBtrL1XVxJzyCpdESm0qq
 05viV1PvyDu2SJv1pO5KzCzsTjxYaRTlszZePJm2L30MeHJbL7QBNMHPEUNDvkYbF4nD
 kRJg==
X-Gm-Message-State: APjAAAWS0UFEhYsioiB5BfeebGRFL8AC3+UlFIDd1aW9mwsYLEOccdIK
 nCPnXzlm5aTRFfHU0J+8lG1fdXfnWjY=
X-Google-Smtp-Source: APXvYqyURozm56YrJxLZAEOXGCSQKN9P3DqaymK3cpa0+HwTa/ElM5cJJbalYHD3RRe3DRJaVzCZdw==
X-Received: by 2002:ac2:5ec1:: with SMTP id d1mr13674882lfq.83.1569916702163; 
 Tue, 01 Oct 2019 00:58:22 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net.
 (jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
 by smtp.gmail.com with ESMTPSA id r8sm3775562lfm.71.2019.10.01.00.58.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 00:58:21 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-xtensa@linux-xtensa.org
Date: Tue,  1 Oct 2019 00:57:38 -0700
Message-Id: <20191001075739.32447-6-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191001075739.32447-1-jcmvbkbc@gmail.com>
References: <20191001075739.32447-1-jcmvbkbc@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [Linux-Xtensa] [PATCH v2 5/6] xtensa: move kernel memory layout to
	platform options
X-BeenThere: linux-xtensa@linux-xtensa.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Generic discussions about Linux on Xtensa
 <linux-xtensa.linux-xtensa.org>
List-Unsubscribe: <http://lists.linux-xtensa.org/mailman/options/linux-xtensa>, 
 <mailto:linux-xtensa-request@linux-xtensa.org?subject=unsubscribe>
List-Archive: <http://lists.linux-xtensa.org/pipermail/linux-xtensa>
List-Post: <mailto:linux-xtensa@linux-xtensa.org>
List-Help: <mailto:linux-xtensa-request@linux-xtensa.org?subject=help>
List-Subscribe: <http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa>, 
 <mailto:linux-xtensa-request@linux-xtensa.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-xtensa-bounces@linux-xtensa.org
Sender: linux-xtensa-bounces@linux-xtensa.org

Currently kernel memory layout settings are split between "Processor
type and features" and "Platform options" menus. Consolidate them under
"Platform options".

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- rearrange xtensa Kconfig kernel address space layout settings placement

 arch/xtensa/Kconfig | 348 ++++++++++++++++++++++++++--------------------------
 1 file changed, 175 insertions(+), 173 deletions(-)

diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index ebc135bda921..d47c0fc7e03b 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -214,151 +214,6 @@ config HOTPLUG_CPU
 
 	  Say N if you want to disable CPU hotplug.
 
-config INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
-	bool "Initialize Xtensa MMU inside the Linux kernel code"
-	depends on !XTENSA_VARIANT_FSF && !XTENSA_VARIANT_DC232B
-	default y if XTENSA_VARIANT_DC233C || XTENSA_VARIANT_CUSTOM
-	help
-	  Earlier version initialized the MMU in the exception vector
-	  before jumping to _startup in head.S and had an advantage that
-	  it was possible to place a software breakpoint at 'reset' and
-	  then enter your normal kernel breakpoints once the MMU was mapped
-	  to the kernel mappings (0XC0000000).
-
-	  This unfortunately won't work for U-Boot and likely also wont
-	  work for using KEXEC to have a hot kernel ready for doing a
-	  KDUMP.
-
-	  So now the MMU is initialized in head.S but it's necessary to
-	  use hardware breakpoints (gdb 'hbreak' cmd) to break at _startup.
-	  xt-gdb can't place a Software Breakpoint in the  0XD region prior
-	  to mapping the MMU and after mapping even if the area of low memory
-	  was mapped gdb wouldn't remove the breakpoint on hitting it as the
-	  PC wouldn't match. Since Hardware Breakpoints are recommended for
-	  Linux configurations it seems reasonable to just assume they exist
-	  and leave this older mechanism for unfortunate souls that choose
-	  not to follow Tensilica's recommendation.
-
-	  Selecting this will cause U-Boot to set the KERNEL Load and Entry
-	  address at 0x00003000 instead of the mapped std of 0xD0003000.
-
-	  If in doubt, say Y.
-
-config MEMMAP_CACHEATTR
-	hex "Cache attributes for the memory address space"
-	depends on !MMU
-	default 0x22222222
-	help
-	  These cache attributes are set up for noMMU systems. Each hex digit
-	  specifies cache attributes for the corresponding 512MB memory
-	  region: bits 0..3 -- for addresses 0x00000000..0x1fffffff,
-	  bits 4..7 -- for addresses 0x20000000..0x3fffffff, and so on.
-
-	  Cache attribute values are specific for the MMU type.
-	  For region protection MMUs:
-	    1: WT cached,
-	    2: cache bypass,
-	    4: WB cached,
-	    f: illegal.
-	  For ful MMU:
-	    bit 0: executable,
-	    bit 1: writable,
-	    bits 2..3:
-	      0: cache bypass,
-	      1: WB cache,
-	      2: WT cache,
-	      3: special (c and e are illegal, f is reserved).
-	  For MPU:
-	    0: illegal,
-	    1: WB cache,
-	    2: WB, no-write-allocate cache,
-	    3: WT cache,
-	    4: cache bypass.
-
-config KSEG_PADDR
-	hex "Physical address of the KSEG mapping"
-	depends on INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX && MMU
-	default 0x00000000
-	help
-	  This is the physical address where KSEG is mapped. Please refer to
-	  the chosen KSEG layout help for the required address alignment.
-	  Unpacked kernel image (including vectors) must be located completely
-	  within KSEG.
-	  Physical memory below this address is not available to linux.
-
-	  If unsure, leave the default value here.
-
-config KERNEL_LOAD_ADDRESS
-	hex "Kernel load address"
-	default 0x60003000 if !MMU
-	default 0x00003000 if MMU && INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
-	default 0xd0003000 if MMU && !INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
-	help
-	  This is the address where the kernel is loaded.
-	  It is virtual address for MMUv2 configurations and physical address
-	  for all other configurations.
-
-	  If unsure, leave the default value here.
-
-config VECTORS_OFFSET
-	hex "Kernel vectors offset"
-	default 0x00003000
-	help
-	  This is the offset of the kernel image from the relocatable vectors
-	  base.
-
-	  If unsure, leave the default value here.
-
-choice
-	prompt "KSEG layout"
-	depends on MMU
-	default XTENSA_KSEG_MMU_V2
-
-config XTENSA_KSEG_MMU_V2
-	bool "MMUv2: 128MB cached + 128MB uncached"
-	help
-	  MMUv2 compatible kernel memory map: TLB way 5 maps 128MB starting
-	  at KSEG_PADDR to 0xd0000000 with cache and to 0xd8000000
-	  without cache.
-	  KSEG_PADDR must be aligned to 128MB.
-
-config XTENSA_KSEG_256M
-	bool "256MB cached + 256MB uncached"
-	depends on INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
-	help
-	  TLB way 6 maps 256MB starting at KSEG_PADDR to 0xb0000000
-	  with cache and to 0xc0000000 without cache.
-	  KSEG_PADDR must be aligned to 256MB.
-
-config XTENSA_KSEG_512M
-	bool "512MB cached + 512MB uncached"
-	depends on INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
-	help
-	  TLB way 6 maps 512MB starting at KSEG_PADDR to 0xa0000000
-	  with cache and to 0xc0000000 without cache.
-	  KSEG_PADDR must be aligned to 256MB.
-
-endchoice
-
-config HIGHMEM
-	bool "High Memory Support"
-	depends on MMU
-	help
-	  Linux can use the full amount of RAM in the system by
-	  default. However, the default MMUv2 setup only maps the
-	  lowermost 128 MB of memory linearly to the areas starting
-	  at 0xd0000000 (cached) and 0xd8000000 (uncached).
-	  When there are more than 128 MB memory in the system not
-	  all of it can be "permanently mapped" by the kernel.
-	  The physical memory that's not permanently mapped is called
-	  "high memory".
-
-	  If you are compiling a kernel which will never run on a
-	  machine with more than 128 MB total physical RAM, answer
-	  N here.
-
-	  If unsure, say Y.
-
 config FAST_SYSCALL_XTENSA
 	bool "Enable fast atomic syscalls"
 	default n
@@ -514,34 +369,6 @@ config SIMDISK1_FILENAME
 	  Another simulated disk in a host file for a buildroot-independent
 	  storage.
 
-config FORCE_MAX_ZONEORDER
-	int "Maximum zone order"
-	default "11"
-	help
-	  The kernel memory allocator divides physically contiguous memory
-	  blocks into "zones", where each zone is a power of two number of
-	  pages.  This option selects the largest power of two that the kernel
-	  keeps in the memory allocator.  If you need to allocate very large
-	  blocks of physically contiguous memory, then you may need to
-	  increase this value.
-
-	  This config option is actually maximum order plus one. For example,
-	  a value of 11 means that the largest free memory block is 2^10 pages.
-
-config PLATFORM_WANT_DEFAULT_MEM
-	def_bool n
-
-config DEFAULT_MEM_START
-	hex
-	prompt "PAGE_OFFSET/PHYS_OFFSET" if !MMU && PLATFORM_WANT_DEFAULT_MEM
-	default 0x60000000 if PLATFORM_WANT_DEFAULT_MEM
-	default 0x00000000
-	help
-	  This is the base address used for both PAGE_OFFSET and PHYS_OFFSET
-	  in noMMU configurations.
-
-	  If unsure, leave the default value here.
-
 config XTFPGA_LCD
 	bool "Enable XTFPGA LCD driver"
 	depends on XTENSA_PLATFORM_XTFPGA
@@ -572,6 +399,181 @@ config XTFPGA_LCD_8BIT_ACCESS
 	  only be used with 8-bit interface. Please consult prototyping user
 	  guide for your board for the correct interface width.
 
+comment "Kernel memory layout"
+
+config INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
+	bool "Initialize Xtensa MMU inside the Linux kernel code"
+	depends on !XTENSA_VARIANT_FSF && !XTENSA_VARIANT_DC232B
+	default y if XTENSA_VARIANT_DC233C || XTENSA_VARIANT_CUSTOM
+	help
+	  Earlier version initialized the MMU in the exception vector
+	  before jumping to _startup in head.S and had an advantage that
+	  it was possible to place a software breakpoint at 'reset' and
+	  then enter your normal kernel breakpoints once the MMU was mapped
+	  to the kernel mappings (0XC0000000).
+
+	  This unfortunately won't work for U-Boot and likely also wont
+	  work for using KEXEC to have a hot kernel ready for doing a
+	  KDUMP.
+
+	  So now the MMU is initialized in head.S but it's necessary to
+	  use hardware breakpoints (gdb 'hbreak' cmd) to break at _startup.
+	  xt-gdb can't place a Software Breakpoint in the  0XD region prior
+	  to mapping the MMU and after mapping even if the area of low memory
+	  was mapped gdb wouldn't remove the breakpoint on hitting it as the
+	  PC wouldn't match. Since Hardware Breakpoints are recommended for
+	  Linux configurations it seems reasonable to just assume they exist
+	  and leave this older mechanism for unfortunate souls that choose
+	  not to follow Tensilica's recommendation.
+
+	  Selecting this will cause U-Boot to set the KERNEL Load and Entry
+	  address at 0x00003000 instead of the mapped std of 0xD0003000.
+
+	  If in doubt, say Y.
+
+config MEMMAP_CACHEATTR
+	hex "Cache attributes for the memory address space"
+	depends on !MMU
+	default 0x22222222
+	help
+	  These cache attributes are set up for noMMU systems. Each hex digit
+	  specifies cache attributes for the corresponding 512MB memory
+	  region: bits 0..3 -- for addresses 0x00000000..0x1fffffff,
+	  bits 4..7 -- for addresses 0x20000000..0x3fffffff, and so on.
+
+	  Cache attribute values are specific for the MMU type.
+	  For region protection MMUs:
+	    1: WT cached,
+	    2: cache bypass,
+	    4: WB cached,
+	    f: illegal.
+	  For ful MMU:
+	    bit 0: executable,
+	    bit 1: writable,
+	    bits 2..3:
+	      0: cache bypass,
+	      1: WB cache,
+	      2: WT cache,
+	      3: special (c and e are illegal, f is reserved).
+	  For MPU:
+	    0: illegal,
+	    1: WB cache,
+	    2: WB, no-write-allocate cache,
+	    3: WT cache,
+	    4: cache bypass.
+
+config KSEG_PADDR
+	hex "Physical address of the KSEG mapping"
+	depends on INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX && MMU
+	default 0x00000000
+	help
+	  This is the physical address where KSEG is mapped. Please refer to
+	  the chosen KSEG layout help for the required address alignment.
+	  Unpacked kernel image (including vectors) must be located completely
+	  within KSEG.
+	  Physical memory below this address is not available to linux.
+
+	  If unsure, leave the default value here.
+
+config KERNEL_LOAD_ADDRESS
+	hex "Kernel load address"
+	default 0x60003000 if !MMU
+	default 0x00003000 if MMU && INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
+	default 0xd0003000 if MMU && !INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
+	help
+	  This is the address where the kernel is loaded.
+	  It is virtual address for MMUv2 configurations and physical address
+	  for all other configurations.
+
+	  If unsure, leave the default value here.
+
+config VECTORS_OFFSET
+	hex "Kernel vectors offset"
+	default 0x00003000
+	help
+	  This is the offset of the kernel image from the relocatable vectors
+	  base.
+
+	  If unsure, leave the default value here.
+
+config PLATFORM_WANT_DEFAULT_MEM
+	def_bool n
+
+config DEFAULT_MEM_START
+	hex
+	prompt "PAGE_OFFSET/PHYS_OFFSET" if !MMU && PLATFORM_WANT_DEFAULT_MEM
+	default 0x60000000 if PLATFORM_WANT_DEFAULT_MEM
+	default 0x00000000
+	help
+	  This is the base address used for both PAGE_OFFSET and PHYS_OFFSET
+	  in noMMU configurations.
+
+	  If unsure, leave the default value here.
+
+choice
+	prompt "KSEG layout"
+	depends on MMU
+	default XTENSA_KSEG_MMU_V2
+
+config XTENSA_KSEG_MMU_V2
+	bool "MMUv2: 128MB cached + 128MB uncached"
+	help
+	  MMUv2 compatible kernel memory map: TLB way 5 maps 128MB starting
+	  at KSEG_PADDR to 0xd0000000 with cache and to 0xd8000000
+	  without cache.
+	  KSEG_PADDR must be aligned to 128MB.
+
+config XTENSA_KSEG_256M
+	bool "256MB cached + 256MB uncached"
+	depends on INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
+	help
+	  TLB way 6 maps 256MB starting at KSEG_PADDR to 0xb0000000
+	  with cache and to 0xc0000000 without cache.
+	  KSEG_PADDR must be aligned to 256MB.
+
+config XTENSA_KSEG_512M
+	bool "512MB cached + 512MB uncached"
+	depends on INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX
+	help
+	  TLB way 6 maps 512MB starting at KSEG_PADDR to 0xa0000000
+	  with cache and to 0xc0000000 without cache.
+	  KSEG_PADDR must be aligned to 256MB.
+
+endchoice
+
+config HIGHMEM
+	bool "High Memory Support"
+	depends on MMU
+	help
+	  Linux can use the full amount of RAM in the system by
+	  default. However, the default MMUv2 setup only maps the
+	  lowermost 128 MB of memory linearly to the areas starting
+	  at 0xd0000000 (cached) and 0xd8000000 (uncached).
+	  When there are more than 128 MB memory in the system not
+	  all of it can be "permanently mapped" by the kernel.
+	  The physical memory that's not permanently mapped is called
+	  "high memory".
+
+	  If you are compiling a kernel which will never run on a
+	  machine with more than 128 MB total physical RAM, answer
+	  N here.
+
+	  If unsure, say Y.
+
+config FORCE_MAX_ZONEORDER
+	int "Maximum zone order"
+	default "11"
+	help
+	  The kernel memory allocator divides physically contiguous memory
+	  blocks into "zones", where each zone is a power of two number of
+	  pages.  This option selects the largest power of two that the kernel
+	  keeps in the memory allocator.  If you need to allocate very large
+	  blocks of physically contiguous memory, then you may need to
+	  increase this value.
+
+	  This config option is actually maximum order plus one. For example,
+	  a value of 11 means that the largest free memory block is 2^10 pages.
+
 endmenu
 
 menu "Power management options"
-- 
2.11.0

_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
