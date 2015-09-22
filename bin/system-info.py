#!/usr/bin/env python

"""
System information for Tmux status line

Author: Roman Belikin roman[dot]sstu[at]gmail.com

"""

import os
import sys
import psutil

def info():
    mem = psutil.virtual_memory()
    return "mem >> %s/%sMB cpu >> %s%%" % (
        str(int(mem.used / 1024 / 1024)),
        str(int(mem.total / 1024 / 1024)),
        psutil.cpu_percent(interval=0.1),
    )

def main():
    try:
        print info()
    except (KeyboardInterrupt, SystemExit):
        pass

if __name__ == '__main__':
    main()
