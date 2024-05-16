@echo off
setlocal

rem 获取当前脚本所在的目录
set "SCRIPT_DIR=%~dp0smartgit-agent"

rem 目标目录
set "DEST_DIR=%APPDATA%\syntevo\SmartGit"

rem 检查目标目录是否存在，如果不存在则创建
if not exist "%DEST_DIR%" (
    mkdir "%DEST_DIR%"
)

rem 复制 smartgit-agent 文件夹到目标目录
xcopy /E /I "%SCRIPT_DIR%" "%DEST_DIR%\smartgit-agent"

rem 定义 vmoptions 文件路径
set "VMOPTIONS_FILE=%DEST_DIR%\smartgit.vmoptions"

rem 定义要添加的行
set "AGENT_PATH=-javaagent:%APPDATA%\syntevo\SmartGit\smartgit-agent\smartgit-agent.jar"

rem 检查 vmoptions 文件是否存在
if not exist "%VMOPTIONS_FILE%" (
    echo %AGENT_PATH% > "%VMOPTIONS_FILE%"
) else (
    rem 检查文件中是否已经包含该行
    findstr /C:"%AGENT_PATH%" "%VMOPTIONS_FILE%" >nul
    if errorlevel 1 (
        echo %AGENT_PATH% >> "%VMOPTIONS_FILE%"
    )
)

echo Completed the setup successfully.

endlocal