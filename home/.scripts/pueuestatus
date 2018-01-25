#!/bin/env python3
import os
import sys
import subprocess
from pueue.daemon.queue import Queue
from pueue.client.factories import command_factory


def main():
    try:
        subprocess.run("rsync root@jarvis:~/.config/pueue/queue /tmp", shell=True, check=True)
        queue = Queue('/tmp')
        queue.read()
        data = queue.queue
        if len(data) == 0:
            print('Queue is empty')
        else:
            # get last 4 keys from status list
            keys = sorted(data.keys())
            keys.reverse()
            status_list = []
            for key in keys[:4]:
                entry_status = data[key]['status']
                status_list.append(("{}: {}".format(key, entry_status)))
            print(', '.join(status_list))
    except KeyboardInterrupt:
        sys.exit(0)


if __name__ == "__main__":
    main()
