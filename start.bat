@echo off
setlocal
cd /d "%~dp0"


winget install -e --id Google.PlatformTools --accept-package-agreements --accept-source-agreements


set UAT_AUTORESTART=1

if exist venv\Scripts\activate.bat (
    call venv\Scripts\activate.bat
	pip install -r requirements.txt
    python bake_templates.py
    python main.py
) else (
    python bake_templates.py
    python main.py
)

pause
:end
