import os
import platform
import subprocess
import sys
import time

def sync_system_time():
    try:
        if platform.system() == "Linux":
            # Enable NTP (network time protocol)
            subprocess.run(["sudo", "timedatectl", "set-ntp", "true"], check=True)
        elif platform.system() == "Windows":
            subprocess.run(["w32tm", "/resync"], check=True)
        # Give some time to sync
        time.sleep(2)
        print("[INFO] System time synchronized")
    except Exception as e:
        print(f"[WARNING] Could not sync system time: {e}")

if __name__ == "__main__":
    sync_system_time()
