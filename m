Return-Path: <linux-xtensa-bounces@linux-xtensa.org>
X-Original-To: lists+linux-xtensa@lfdr.de
Delivered-To: lists+linux-xtensa@lfdr.de
Received: from linux-xtensa.org (linux-xtensa.org [54.208.7.158])
	by mail.lfdr.de (Postfix) with ESMTP id A830026A138
	for <lists+linux-xtensa@lfdr.de>; Tue, 15 Sep 2020 10:45:46 +0200 (CEST)
Received: from linux-xtensa.org (localhost [127.0.0.1])
	by linux-xtensa.org (Postfix) with ESMTP id C72B764C3;
	Tue, 15 Sep 2020 08:27:21 +0000 (UTC)
X-Original-To: linux-xtensa@linux-xtensa.org
Delivered-To: linux-xtensa@linux-xtensa.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by linux-xtensa.org (Postfix) with ESMTPS id 9A8C664C1
 for <linux-xtensa@linux-xtensa.org>; Tue, 15 Sep 2020 08:27:18 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id z22so3841604ejl.7
 for <linux-xtensa@linux-xtensa.org>; Tue, 15 Sep 2020 01:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V3eC1eCYe5T3GPH8jjvGIL65MP0qJgY9qagVEB5NEUM=;
 b=rgTEeTmT5hPjvm2bKmEqGkP22ayUWAL9Ee1i/i512DcFR0MZ8WN+RCXai6SzpNAEzI
 fTlHaW50Y0ogod04Q+3yhm0XDKYFT9iOOdDsUL6v/LANOFbQxqJrArLSSLzUPBLGO2HE
 mu5+jq8mhEZvIr/locCDVmGRP3nIn06yeoYjkxf4OH6hnkVpllY/3QepRr8NH1hmpVto
 J1L+Xxf036iirk/JJDaAaMhw9XVvBU+PtFsQ57mlqxVpZkqOd55edJnupny/jO5RmGT/
 WyYYWLC58L5zmZgchnvINiSMiXNETagz6npJFsiisXKXZfj7QykxoX6r0FA393jzTU+l
 x/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V3eC1eCYe5T3GPH8jjvGIL65MP0qJgY9qagVEB5NEUM=;
 b=FX9ai++lpmStXYcw7j0n5+r16GxHknS55R6jY7J7MnPfbvy+pqESMbGZ6aTc38NN91
 a29qQuI/Xme+0j35/uNA8eRxCqJGgWDEAZ5bcGsGvOd2mcsTURJSqdEQEonxASHGsYfa
 6RYnlM7i0PlJVhpxyYH2swidd/xxnjwDa31okmKRJ1m/kDrK0g2CA9/+INElmYDNWp+5
 A+n8Riqq+5RO8OWvdYWSd3c/RlFRMY/w4nuvj7znXLThm7TNjLGqsC23rYX2x0iDAg2x
 AUngHkzjZ/lMfKR26ZLGfH9aPkokxFLzaaVCaJbhWFHTiWAkN4HDSevThn+klQY8sMdl
 2YYA==
X-Gm-Message-State: AOAM533BAqRvZiYi9vEBsnDfgoOYAFG1e2/knLPhz22wKHjuLgOdBM2P
 4sBiYaMubO0Or/EQndriEDcYz4isiQA8UFQA8oY=
X-Google-Smtp-Source: ABdhPJw2kLy7Aha/hSiLEl/7aoJex5orYrjIN0pmqmUZ+0OUd948tWCv81SyuEdvlEktTSSsGKd3RzKOTQRTWZCEAFY=
X-Received: by 2002:a17:906:b784:: with SMTP id
 dt4mr19883626ejb.376.1600159541482; 
 Tue, 15 Sep 2020 01:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200912110820.597135-1-keescook@chromium.org>
In-Reply-To: <20200912110820.597135-1-keescook@chromium.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 15 Sep 2020 01:45:30 -0700
Message-ID: <CAMo8BfLsKgnRutWAMX0O8yK7nZbBJJLeJXVSQRR0NQin9PfuPg@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Michael Ellerman <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Subject: Re: [Linux-Xtensa] [PATCH 00/15] selftests/seccomp: Refactor
	change_syscall()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-xtensa-bounces@linux-xtensa.org
Sender: linux-xtensa-bounces@linux-xtensa.org

Hello,

On Sat, Sep 12, 2020 at 4:08 AM Kees Cook <keescook@chromium.org> wrote:
> This refactors the seccomp selftest macros used in change_syscall(),
> in an effort to remove special cases for mips, arm, arm64, and xtensa,
> which paves the way for powerpc fixes.
>
> I'm not entirely done testing, but all-arch build tests and x86_64
> selftests pass. I'll be doing arm, arm64, and i386 selftests shortly,
> but I currently don't have an easy way to check xtensa, mips, nor
> powerpc. Any help there would be appreciated!

I've built and tested this series on xtensa. I had to disable two tests:
user_notification_addfd and user_notification_addfd_rlimit because
they use memfd_create and prlimit which are not available in uClibc.
With this change I've got all 86 tests passing with the following log:

./seccomp_bpf
TAP version 13
1..86
# Starting 86 tests from 7 test cases.
#  RUN           TRAP.dfl ...
#            OK  TRAP.dfl
ok 1 TRAP.dfl
#  RUN           TRAP.ign ...
#            OK  TRAP.ign
ok 2 TRAP.ign
#  RUN           TRAP.handler ...
#            OK  TRAP.handler
ok 3 TRAP.handler
#  RUN           precedence.allow_ok ...
#            OK  precedence.allow_ok
ok 4 precedence.allow_ok
#  RUN           precedence.kill_is_highest ...
#            OK  precedence.kill_is_highest
ok 5 precedence.kill_is_highest
#  RUN           precedence.kill_is_highest_in_any_order ...
#            OK  precedence.kill_is_highest_in_any_order
ok 6 precedence.kill_is_highest_in_any_order
#  RUN           precedence.trap_is_second ...
#            OK  precedence.trap_is_second
ok 7 precedence.trap_is_second
#  RUN           precedence.trap_is_second_in_any_order ...
#            OK  precedence.trap_is_second_in_any_order
ok 8 precedence.trap_is_second_in_any_order
#  RUN           precedence.errno_is_third ...
#            OK  precedence.errno_is_third
ok 9 precedence.errno_is_third
#  RUN           precedence.errno_is_third_in_any_order ...
#            OK  precedence.errno_is_third_in_any_order
ok 10 precedence.errno_is_third_in_any_order
#  RUN           precedence.trace_is_fourth ...
#            OK  precedence.trace_is_fourth
ok 11 precedence.trace_is_fourth
#  RUN           precedence.trace_is_fourth_in_any_order ...
#            OK  precedence.trace_is_fourth_in_any_order
ok 12 precedence.trace_is_fourth_in_any_order
#  RUN           precedence.log_is_fifth ...
#            OK  precedence.log_is_fifth
ok 13 precedence.log_is_fifth
#  RUN           precedence.log_is_fifth_in_any_order ...
#            OK  precedence.log_is_fifth_in_any_order
ok 14 precedence.log_is_fifth_in_any_order
#  RUN           TRACE_poke.read_has_side_effects ...
#            OK  TRACE_poke.read_has_side_effects
ok 15 TRACE_poke.read_has_side_effects
#  RUN           TRACE_poke.getpid_runs_normally ...
#            OK  TRACE_poke.getpid_runs_normally
ok 16 TRACE_poke.getpid_runs_normally
#  RUN           TRACE_syscall.ptrace.negative_ENOSYS ...
#            OK  TRACE_syscall.ptrace.negative_ENOSYS
ok 17 TRACE_syscall.ptrace.negative_ENOSYS
#  RUN           TRACE_syscall.ptrace.syscall_allowed ...
#            OK  TRACE_syscall.ptrace.syscall_allowed
ok 18 TRACE_syscall.ptrace.syscall_allowed
#  RUN           TRACE_syscall.ptrace.syscall_redirected ...
#            OK  TRACE_syscall.ptrace.syscall_redirected
ok 19 TRACE_syscall.ptrace.syscall_redirected
#  RUN           TRACE_syscall.ptrace.syscall_errno ...
#            OK  TRACE_syscall.ptrace.syscall_errno
ok 20 TRACE_syscall.ptrace.syscall_errno
#  RUN           TRACE_syscall.ptrace.syscall_faked ...
#            OK  TRACE_syscall.ptrace.syscall_faked
ok 21 TRACE_syscall.ptrace.syscall_faked
#  RUN           TRACE_syscall.ptrace.skip_after ...
#            OK  TRACE_syscall.ptrace.skip_after
ok 22 TRACE_syscall.ptrace.skip_after
#  RUN           TRACE_syscall.ptrace.kill_after ...
#            OK  TRACE_syscall.ptrace.kill_after
ok 23 TRACE_syscall.ptrace.kill_after
#  RUN           TRACE_syscall.seccomp.negative_ENOSYS ...
#            OK  TRACE_syscall.seccomp.negative_ENOSYS
ok 24 TRACE_syscall.seccomp.negative_ENOSYS
#  RUN           TRACE_syscall.seccomp.syscall_allowed ...
#            OK  TRACE_syscall.seccomp.syscall_allowed
ok 25 TRACE_syscall.seccomp.syscall_allowed
#  RUN           TRACE_syscall.seccomp.syscall_redirected ...
#            OK  TRACE_syscall.seccomp.syscall_redirected
ok 26 TRACE_syscall.seccomp.syscall_redirected
#  RUN           TRACE_syscall.seccomp.syscall_errno ...
#            OK  TRACE_syscall.seccomp.syscall_errno
ok 27 TRACE_syscall.seccomp.syscall_errno
#  RUN           TRACE_syscall.seccomp.syscall_faked ...
#            OK  TRACE_syscall.seccomp.syscall_faked
ok 28 TRACE_syscall.seccomp.syscall_faked
#  RUN           TRACE_syscall.seccomp.skip_after ...
#            OK  TRACE_syscall.seccomp.skip_after
ok 29 TRACE_syscall.seccomp.skip_after
#  RUN           TRACE_syscall.seccomp.kill_after ...
#            OK  TRACE_syscall.seccomp.kill_after
ok 30 TRACE_syscall.seccomp.kill_after
#  RUN           TSYNC.siblings_fail_prctl ...
#            OK  TSYNC.siblings_fail_prctl
ok 31 TSYNC.siblings_fail_prctl
#  RUN           TSYNC.two_siblings_with_ancestor ...
#            OK  TSYNC.two_siblings_with_ancestor
ok 32 TSYNC.two_siblings_with_ancestor
#  RUN           TSYNC.two_sibling_want_nnp ...
#            OK  TSYNC.two_sibling_want_nnp
ok 33 TSYNC.two_sibling_want_nnp
#  RUN           TSYNC.two_siblings_with_no_filter ...
#            OK  TSYNC.two_siblings_with_no_filter
ok 34 TSYNC.two_siblings_with_no_filter
#  RUN           TSYNC.two_siblings_with_one_divergence ...
#            OK  TSYNC.two_siblings_with_one_divergence
ok 35 TSYNC.two_siblings_with_one_divergence
#  RUN           TSYNC.two_siblings_with_one_divergence_no_tid_in_err ...
#            OK  TSYNC.two_siblings_with_one_divergence_no_tid_in_err
ok 36 TSYNC.two_siblings_with_one_divergence_no_tid_in_err
#  RUN           TSYNC.two_siblings_not_under_filter ...
#            OK  TSYNC.two_siblings_not_under_filter
ok 37 TSYNC.two_siblings_not_under_filter
#  RUN           global.kcmp ...
#            OK  global.kcmp
ok 38 global.kcmp
#  RUN           global.mode_strict_support ...
#            OK  global.mode_strict_support
ok 39 global.mode_strict_support
#  RUN           global.mode_strict_cannot_call_prctl ...
#            OK  global.mode_strict_cannot_call_prctl
ok 40 global.mode_strict_cannot_call_prctl
#  RUN           global.no_new_privs_support ...
#            OK  global.no_new_privs_support
ok 41 global.no_new_privs_support
#  RUN           global.mode_filter_support ...
#            OK  global.mode_filter_support
ok 42 global.mode_filter_support
#  RUN           global.mode_filter_without_nnp ...
#            OK  global.mode_filter_without_nnp
ok 43 global.mode_filter_without_nnp
#  RUN           global.filter_size_limits ...
#            OK  global.filter_size_limits
ok 44 global.filter_size_limits
#  RUN           global.filter_chain_limits ...
#            OK  global.filter_chain_limits
ok 45 global.filter_chain_limits
#  RUN           global.mode_filter_cannot_move_to_strict ...
#            OK  global.mode_filter_cannot_move_to_strict
ok 46 global.mode_filter_cannot_move_to_strict
#  RUN           global.mode_filter_get_seccomp ...
#            OK  global.mode_filter_get_seccomp
ok 47 global.mode_filter_get_seccomp
#  RUN           global.ALLOW_all ...
#            OK  global.ALLOW_all
ok 48 global.ALLOW_all
#  RUN           global.empty_prog ...
#            OK  global.empty_prog
ok 49 global.empty_prog
#  RUN           global.log_all ...
#            OK  global.log_all
ok 50 global.log_all
#  RUN           global.unknown_ret_is_kill_inside ...
#            OK  global.unknown_ret_is_kill_inside
ok 51 global.unknown_ret_is_kill_inside
#  RUN           global.unknown_ret_is_kill_above_allow ...
#            OK  global.unknown_ret_is_kill_above_allow
ok 52 global.unknown_ret_is_kill_above_allow
#  RUN           global.KILL_all ...
#            OK  global.KILL_all
ok 53 global.KILL_all
#  RUN           global.KILL_one ...
#            OK  global.KILL_one
ok 54 global.KILL_one
#  RUN           global.KILL_one_arg_one ...
#            OK  global.KILL_one_arg_one
ok 55 global.KILL_one_arg_one
#  RUN           global.KILL_one_arg_six ...
#            OK  global.KILL_one_arg_six
ok 56 global.KILL_one_arg_six
#  RUN           global.KILL_thread ...
#            OK  global.KILL_thread
ok 57 global.KILL_thread
#  RUN           global.KILL_process ...
#            OK  global.KILL_process
ok 58 global.KILL_process
#  RUN           global.arg_out_of_range ...
#            OK  global.arg_out_of_range
ok 59 global.arg_out_of_range
#  RUN           global.ERRNO_valid ...
#            OK  global.ERRNO_valid
ok 60 global.ERRNO_valid
#  RUN           global.ERRNO_zero ...
#            OK  global.ERRNO_zero
ok 61 global.ERRNO_zero
#  RUN           global.ERRNO_capped ...
#            OK  global.ERRNO_capped
ok 62 global.ERRNO_capped
#  RUN           global.ERRNO_order ...
#            OK  global.ERRNO_order
ok 63 global.ERRNO_order
#  RUN           global.negative_ENOSYS ...
#            OK  global.negative_ENOSYS
ok 64 global.negative_ENOSYS
#  RUN           global.seccomp_syscall ...
#            OK  global.seccomp_syscall
ok 65 global.seccomp_syscall
#  RUN           global.seccomp_syscall_mode_lock ...
#            OK  global.seccomp_syscall_mode_lock
ok 66 global.seccomp_syscall_mode_lock
#  RUN           global.detect_seccomp_filter_flags ...
#            OK  global.detect_seccomp_filter_flags
ok 67 global.detect_seccomp_filter_flags
#  RUN           global.TSYNC_first ...
#            OK  global.TSYNC_first
ok 68 global.TSYNC_first
#  RUN           global.syscall_restart ...
#            OK  global.syscall_restart
ok 69 global.syscall_restart
#  RUN           global.filter_flag_log ...
#            OK  global.filter_flag_log
ok 70 global.filter_flag_log
#  RUN           global.get_action_avail ...
#            OK  global.get_action_avail
ok 71 global.get_action_avail
#  RUN           global.get_metadata ...
#            OK  global.get_metadata
ok 72 global.get_metadata
#  RUN           global.user_notification_basic ...
#            OK  global.user_notification_basic
ok 73 global.user_notification_basic
#  RUN           global.user_notification_with_tsync ...
#            OK  global.user_notification_with_tsync
ok 74 global.user_notification_with_tsync
#  RUN           global.user_notification_kill_in_middle ...
#            OK  global.user_notification_kill_in_middle
ok 75 global.user_notification_kill_in_middle
#  RUN           global.user_notification_signal ...
#            OK  global.user_notification_signal
ok 76 global.user_notification_signal
#  RUN           global.user_notification_closed_listener ...
#            OK  global.user_notification_closed_listener
ok 77 global.user_notification_closed_listener
#  RUN           global.user_notification_child_pid_ns ...
#            OK  global.user_notification_child_pid_ns
ok 78 global.user_notification_child_pid_ns
#  RUN           global.user_notification_sibling_pid_ns ...
#            OK  global.user_notification_sibling_pid_ns
ok 79 global.user_notification_sibling_pid_ns
#  RUN           global.user_notification_fault_recv ...
#            OK  global.user_notification_fault_recv
ok 80 global.user_notification_fault_recv
#  RUN           global.seccomp_get_notif_sizes ...
#            OK  global.seccomp_get_notif_sizes
ok 81 global.seccomp_get_notif_sizes
#  RUN           global.user_notification_continue ...
#            OK  global.user_notification_continue
ok 82 global.user_notification_continue
#  RUN           global.user_notification_filter_empty ...
#            OK  global.user_notification_filter_empty
ok 83 global.user_notification_filter_empty
#  RUN           global.user_notification_filter_empty_threaded ...
#            OK  global.user_notification_filter_empty_threaded
ok 84 global.user_notification_filter_empty_threaded
#  RUN           global.user_notification_addfd ...
#            OK  global.user_notification_addfd
ok 85 global.user_notification_addfd
#  RUN           global.user_notification_addfd_rlimit ...
#            OK  global.user_notification_addfd_rlimit
ok 86 global.user_notification_addfd_rlimit
# PASSED: 86 / 86 tests passed.
# Totals: pass:86 fail:0 xfail:0 xpass:0 skip:0 error:0

-- 
Thanks.
-- Max
_______________________________________________
linux-xtensa mailing list
linux-xtensa@linux-xtensa.org
http://lists.linux-xtensa.org/mailman/listinfo/linux-xtensa
