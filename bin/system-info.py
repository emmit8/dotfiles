#!/usr/bin/env python

"""
System information for Tmux status line

Author: Roman Belikin roman[dot]sstu[at]gmail.com

"""

import os
import sys
import psutil
import time


def up_down_rate(interface = 'en0'):

    def net():
       n = psutil.net_io_counters(pernic=True)[interface]
       return (n.bytes_sent, n.bytes_recv)

    nst = net()
    dst = time.time()

    time.sleep(1)

    ul, dl = [(now - last) / (time.time() - dst) / 1000.0
            for now, last in zip(net(), nst)]

    return (psutil.net_if_addrs()[interface][0].address, ul, dl) 

def info():

    mem = psutil.virtual_memory()
    hdd = psutil.disk_usage('/')
    cpu = psutil.cpu_percent(interval=0.1)

    return "inet >> %(net)s hdd >> %(hdd)sGB mem >> %(mem)s cpu >> %(cpu)s%% " % {
            'net' : 'ip: {0} ul: {1:.0f} kB/s / dl: {2:.0f} kB/s'.format(*up_down_rate()),
            'hdd' : str(int(hdd.free / 1024 / 1024 / 1024)),
            'mem' : '{0}/{1}MB'.format(str(int(mem.used / 1024 / 1024)), str(int(mem.total / 1024 / 1024))),
            'cpu' : str(cpu) 
    }

def main():
    try:
        print info()
    except (KeyboardInterrupt, SystemExit):
        pass

if __name__ == '__main__':
    main()
