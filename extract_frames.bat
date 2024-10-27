@echo off
setlocal enabledelayedexpansion

rem 定义webm文件夹路径
set "input_folder=.\webm"
rem 定义输出文件夹路径
set "output_folder=png"

rem 创建输出文件夹
if not exist "%output_folder%" (
    mkdir "%output_folder%"
)

rem 遍历所有webm文件
for %%F in ("%input_folder%\*.webm") do (
    rem 获取文件名（不带路径和扩展名）
    set "filename=%%~nF"
    rem 创建以文件名命名的文件夹
    mkdir "%output_folder%\!filename!"
    rem 使用ffmpeg提取帧
    ffmpeg -vcodec libvpx-vp9 -i "%%F" "%output_folder%\!filename!\%%04d.png"
)

endlocal
