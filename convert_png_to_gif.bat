@echo off
setlocal enabledelayedexpansion

set "input_base=.\png"
set "output_base=.\gif"

for /d %%D in ("%input_base%\*") do (
    set "folder_name=%%~nxD"
    ffmpeg -y -i "%%D\%%04d.png" -r 12 -filter_complex "[0:v]split[a][b]; [a]palettegen=transparency_color=ffffff[p]; [b][p]paletteuse" "%output_base%\!folder_name!.gif"
)

endlocal
