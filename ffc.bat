if [%1]==[] goto nofile
if [%2]==[] goto notime
if [%3]==[] goto noduration

ffmpeg -i "%~1" -c:v libx264 -pix_fmt yuv420p -q:v 1 -crf 18 -preset slow -filter:v lutyuv="y=gammaval(0.5)" -ss "%2" -t "%3" -async 1 "%~dpn1.mp4"
goto :eof

:nofile
@echo "use ffc [file] [start-time] [duration]"
goto :eof

:notime
ffmpeg -i "%~1" -c:v libx264 -pix_fmt yuv420p -q:v 1 -crf 18 -preset slow -filter:v lutyuv="y=gammaval(0.5)" "%~dpn1.mp4"
goto :eof

:noduration
ffmpeg -i "%~1" -c:v libx264 -pix_fmt yuv420p -q:v 1 -crf 18 -preset slow -filter:v lutyuv="y=gammaval(0.5)" -ss "%2" -async 1 "%~dpn1.mp4" 
goto :eof

