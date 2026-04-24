import subprocess
import os
from colorama import init, Fore, Style


init(autoreset=True)



ascii_art = r"""

                             ^
                _______     ^^^
               |xxxxxxx|  _^^^^^_
               |xxxxxxx| | [][]  |
            ______xxxxx| |[][][] |
           |++++++|xxxx| | [][][]|      PaTaRY0T
           |++++++|xxxx| |[][][] |      2006/2025
           |++++++|_________ [][]| 
           |++++++|=|=|=|=|=| [] |                    
           |++++++|=|=|=|=|=|[][]|
___________|++HH++|  _HHHH__|   _________   _________  _________
         _______________   ______________      ______________
__________________  ___________    __________________    ____________

 _______           ________                   __      __  ______    __     
|       \         |        \                 |  \    /  \/      \  |  \    
| ▓▓▓▓▓▓▓\ ______  \▓▓▓▓▓▓▓▓ ______   ______  \▓▓\  /  ▓▓  ▓▓▓▓▓▓\_| ▓▓_   
| ▓▓__/ ▓▓|      \   | ▓▓   |      \ /      \  \▓▓\/  ▓▓| ▓▓▓\| ▓▓   ▓▓ \  
| ▓▓    ▓▓ \▓▓▓▓▓▓\  | ▓▓    \▓▓▓▓▓▓\  ▓▓▓▓▓▓\  \▓▓  ▓▓ | ▓▓▓▓\ ▓▓\▓▓▓▓▓▓  
| ▓▓▓▓▓▓▓ /      ▓▓  | ▓▓   /      ▓▓ ▓▓   \▓▓   \▓▓▓▓  | ▓▓\▓▓\▓▓ | ▓▓ __ 
| ▓▓     |  ▓▓▓▓▓▓▓  | ▓▓  |  ▓▓▓▓▓▓▓ ▓▓         | ▓▓   | ▓▓_\▓▓▓▓ | ▓▓|  \
| ▓▓      \▓▓    ▓▓  | ▓▓   \▓▓    ▓▓ ▓▓         | ▓▓    \▓▓  \▓▓▓  \▓▓  ▓▓
 \▓▓
"""

print(Fore.YELLOW + ascii_art)


def run_program(path, needs_admin):
    if path.lower().endswith(".msc"):
        cmd = f'mmc "{path}"'
    else:
        cmd = f'"{path}"'
    
    if needs_admin:
        subprocess.run(f'powershell Start-Process {cmd} -Verb RunAs', shell=True)
    else:
        subprocess.Popen(cmd, shell=True)


programs = {
    "1": ("Component Services", r"C:\Windows\System32\comexp.msc", True),
    "2": ("Computer Management", r"C:\Windows\System32\compmgmt.msc", True),
    "3": ("Defragment and Optimize Drives", r"C:\Windows\System32\dfrgui.exe", False),
    "4": ("Disk Cleanup", r"C:\Windows\System32\cleanmgr.exe", False),
    "5": ("Event Viewer", r"C:\Windows\System32\eventvwr.msc", False),
    "6": ("iSCSI Initiator", r"C:\Windows\System32\iscsicpl.exe", False),
    "7": ("Local Security Policy", r"C:\Windows\System32\secpol.msc", True),
    "8": ("ODBC Data Sources (32-bit)", r"C:\Windows\System32\odbcad32.exe", False),
    "9": ("ODBC Data Sources (64-bit)", r"C:\Windows\SysWOW64\odbcad32.exe", False),
    "10": ("Performance Monitor", r"C:\Windows\System32\perfmon.msc", False),
    "11": ("Print Management", r"C:\Windows\System32\printmanagement.msc", False),
    "12": ("Recovery Drive", r"C:\Windows\System32\recdisc.exe", False),
    "13": ("Registry Editor", r"C:\Windows\regedit.exe", True),
    "14": ("Resource Monitor", r"C:\Windows\System32\resmon.exe", False),
    "15": ("Services", r"C:\Windows\System32\services.msc", True),
    "16": ("System Configuration", r"C:\Windows\System32\msconfig.exe", True),
    "17": ("System Information", r"C:\Windows\System32\msinfo32.exe", False),
    "18": ("Task Scheduler", r"C:\Windows\System32\taskschd.msc", False),
    "19": ("Windows Defender Firewall", r"C:\Windows\System32\wf.msc", True),
    "20": ("Windows Memory Diagnostic", r"C:\Windows\System32\mdsched.exe", False)
}


print("Select a program to open:")
for key, (name, _, _) in programs.items():
    print(f"{key}. {name}")

PaTaRY0T = input("Enter The Number:")
if PaTaRY0T in programs:
    program_name, program_path, needs_admin = programs[PaTaRY0T]
    try:
        run_program(program_path, needs_admin)
        print(f"{program_name} command executed.")
    except Exception as e:
        print(f"Error opening {program_name}: {e}")
else:
    print("Invalid choice.")
