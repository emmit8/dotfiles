#!/usr/bin/env python

"""
System information for Tmux status line

Author: Roman Belikin roman[dot]sstu[at]gmail.com

"""

import os
import sys
import psutil
import time

def sizeof_fmt(num, suffix='B'):
    for unit in ['','Ki','Mi','Gi','Ti','Pi','Ei','Zi']:
        if abs(num) < 1024.0:
            return "%3.1f%s%s" % (num, unit, suffix)
        num /= 1024.0
    return "%.1f%s%s" % (num, 'Yi', suffix)

def up_down_rate(interface = 'en0'):

    def net():
       n = psutil.net_io_counters(pernic=True)[interface]
       return (n.bytes_sent, n.bytes_recv)

    nst = net()
    dst = time.time()

    time.sleep(1)

    ul, dl = [(now - last) / (time.time() - dst) / 1000.0
            for now, last in zip(net(), nst)]

    return (psutil.net_if_addrs()[interface][0].address, sizeof_fmt(ul, 'kB/s'), sizeof_fmt(dl, 'kB/s')) 

def info():

    mem = psutil.virtual_memory()
    hdd = psutil.disk_usage('/')
    cpu = psutil.cpu_percent(interval=0.1)

    # return "inet >> %(net)s hdd >> %(hdd)s mem >> %(mem)s cpu >> %(cpu)s%% " % {
    return "hdd >> %(hdd)s mem >> %(mem)s cpu >> %(cpu)s%% " % {
            # 'net' : 'ip: {0} ul: {1} / dl: {2}'.format(*up_down_rate()),
            'hdd' : sizeof_fmt(hdd.free),
            'mem' : '{0}/{1}'.format(sizeof_fmt(mem.used), sizeof_fmt(mem.total)),
            'cpu' : str(cpu) 
    }

def main():
    try:
        print info()
    except (KeyboardInterrupt, SystemExit):
        pass

if __name__ == '__main__':
    main()
