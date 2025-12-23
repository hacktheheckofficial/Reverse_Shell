# Reverse_Shell

Only for educational purposes only !

🛡️ Hack The Heck Lab: Persistent Reverse Shell Demo
This project demonstrates a professional-grade Reverse Shell attack chain, focusing on Stealth, Resource Bundling, and Reboot Persistence.

📁 Project Components
rev.py: The Python payload integrating stealth and persistence.
Financial_Report.pdf: The decoy document embedded inside the EXE.
icon.ico: A PDF icon used to mask the executable.
setup_lab.sh: Installs dependencies (Netcat, PyInstaller, Toilet).
listen.sh: A stylized UI for the Machine A controller.

🚀 Execution Steps
1. Environment Setup (Machine A)
Run the setup script on your Linux machine to prepare the environment:
chmod +x rev_main.sh && ./rev_main.sh
2. Compiling the Payload
Bundle the script and PDF into one stealthy executable using PyInstaller. Rename the output rev.exe to Financial_Report.pdf.exe. Windows typically hides the .exe extension, leaving only the PDF name and icon visible to the user.
3. Starting the Listener
Launch the management UI to wait for the incoming connection:
chmod +x listen.sh && ./listen.sh

🛠️ How It Works
Stealth & Decoy: Upon execution, the script uses Windows API calls to hide the console window. It then extracts and opens the embedded PDF instantly to distract the user.
Persistence: The script copies itself to the Windows Startup Folder as WindowsUpdater.exe. This ensures the shell reconnects automatically after every system reboot.
Connection: Following the logic in your lab notes, the script initiates an outbound TCP connection to Port 87, effectively bypassing standard inbound firewall blocks.

⚠️ Disclaimer
For educational and ethical security testing only. Unauthorized access to computer systems is strictly illegal.

Hack The Heck Lab - Stay Ethical, Stay Secure.
