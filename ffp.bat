if [%1]==[] goto nofile
if [%2]==[] goto notime
if [%3]==[] goto noduration

ffplay -i "%~1" -ss "%2" -t "%3"
goto :eof

:nofile
@echo "use ffp [file] [start-time] [duration]"
goto :eof

:notime
ffplay -i "%~1"
goto :eof

:noduration
ffplay -i "%~1" -ss "%2"
goto :eof

