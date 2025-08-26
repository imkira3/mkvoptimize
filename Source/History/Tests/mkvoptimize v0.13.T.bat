@echo off
setlocal enabledelayedexpansion

:: Step 0: Debug Settings
set INPUT=Input.mkv

:: Step 1: Create the output folder
mkdir C

:: Step 2: Extract and optimize the video and audio tracks
ffmpeg -i "%INPUT%" -filter:v fps=23.976 -threads 0 -an -sn -c:v libx264 -preset veryfast -tune film -b:v 1200k -maxrate 1500k -bufsize 2000k -x264-params "pass=1:stats=\\.\stats.log.temp" -f null NUL && ffmpeg -y -i "%INPUT%" -filter:v fps=23.976 -threads 0 -map 0:v:0 -map 0:a? -sn -c:v libx264 -preset veryfast -tune film -b:v 1200k -maxrate 1500k -bufsize 2000k -x264-params "pass=2:stats=\\.\stats.log.temp" -c:a aac C\VAC.mkv

:: Step 3: Detect the video track IDs from the output and store the data in a file
ffprobe -v error -select_streams v -show_entries stream=index -of "compact=p=0:nk=1" C\VAC.mkv > C\V

:: Step 4: Detect the audio track IDs from the output and store the data in a file
ffprobe -v error -select_streams a -show_entries stream=index -of "compact=p=0:nk=1" C\VAC.mkv > C\A

:: Step 5: Detect the subtitle track IDs from the input and store the data in a file
ffprobe -v error -select_streams s -show_entries stream=index -of "compact=p=0:nk=1" "%INPUT%" > C\S

:: Step 6: Detect all track IDs from the output and store the data in a file
ffprobe -v error -select_streams u -show_entries stream=index -of "compact=p=0:nk=1" C\VAC.mkv > C\U

:: Step 7: Detect the number of video tracks in the output and store that value in a variable
for /f "usebackq tokens=*" %%A in (C\V) do set /a V_COUNT+=1

:: Step 8: Detect the number of audio tracks in the output and store that value in a variable
for /f "usebackq tokens=*" %%A in (C\A) do set /a A_COUNT+=1

:: Step 9: Detect the number of subtitle tracks in the input and store that value in a variable
for /f "usebackq tokens=*" %%A in (C\S) do set /a S_COUNT+=1

:: Step 10: Detect the total number of tracks in the output and store that value in a variable
for /f "usebackq tokens=*" %%A in (C\U) do set /a U_COUNT+=1

:: Step 11: Extract and isolate the video and audio tracks
set "CMD=mkvmerge -o C\VA.mkv --no-chapters --no-global-tags --no-track-tags --no-attachments --no-buttons" && set "TRACK_LIST=" && for /f %%A in (C\U) do ( if defined TRACK_LIST ( set "TRACK_LIST=!TRACK_LIST!,1:%%A" ) else ( set "TRACK_LIST=1:%%A" ) ) && set "CMD=!CMD! --track-order !TRACK_LIST!" && set "CMD=!CMD! C\VAC.mkv" && call !CMD!

:: Step 12: Extract and isolate the subtitle tracks
set "CMD=mkvmerge -o C\S.mks --no-chapters --no-global-tags --no-track-tags --no-attachments --no-buttons --no-video --no-audio" && set "CMD=!CMD! --track-order !TRACK_LIST!" && set "CMD=!CMD! "%INPUT%"" && call !CMD!

:: Step 13: Detect the imagebased subtitle track IDs from the third output and store the data in a file
ffprobe -v error -select_streams s -show_entries stream=index,codec_name -of csv=p=0 C\S.mks | findstr /R /C:"bd_subtitle" /C:"dvb_subtitle" /C:"dvb_teletext" /C:"dvd_subtitle" /C:"dvdsub" /C:"hdmv_pgs_subtitle" /C:"pgs" /C:"pgs_subtitle" /C:"vobsub" /C:"xsub" > C\ISC && sed -n "s/^\([0-9]\+\),.*$/\1/p" C\ISC > C\IS && del C\ISC

:: Step 14: Detect the textbased subtitle track IDs from the third output and store the data in a file
ffprobe -v error -select_streams s -show_entries stream=index,codec_name -of csv=p=0 C\S.mks | findstr /R /C:"arib_caption" /C:"ass" /C:"eia_608" /C:"hdmv_pgs" /C:"hdmv_text_subtitle" /C:"jacosub" /C:"microdvd" /C:"mov_text" /C:"mpl2" /C:"pjs" /C:"realtext" /C:"sami" /C:"srt" /C:"ssa" /C:"stl" /C:"subrip" /C:"subviewer" /C:"subviewer1" /C:"text" /C:"ttml" /C:"vplayer" /C:"vtt" /C:"webvtt" > C\TSC && sed -n "s/^\([0-9]\+\),.*$/\1/p" C\TSC > C\TS && del C\TSC

:: Step 15: Separate the imagebased and textbased subtitle tracks
for /f %%i in (C\TS) do ( if defined TS_indices ( set "TS_indices=!TS_indices!,%%i" ) else ( set "TS_indices=%%i" ) ) && for /f %%i in (C\IS) do ( if defined IS_indices ( set "IS_indices=!IS_indices!,%%i" ) else ( set "IS_indices=%%i" ) ) && set "TS_cmd=--subtitle-tracks !TS_indices!" && set "IS_cmd=--subtitle-tracks !IS_indices!" && mkvmerge -o C\TS.mks !TS_cmd! C\S.mks && mkvmerge -o C\IS.mks !IS_cmd! C\S.mks

:: Step 16: Conditionally activate the IS_FINAL variable
if exist C\IS.mks set IS_FINAL=C\IS.mks

:: Step 17: Detect the number of imagebased subtitle tracks in the fourth output and store that value in a variable
for /f "usebackq tokens=*" %%A in (C\IS) do set /a IS_COUNT+=1

:: Step 18: Detect the number of textbased subtitle tracks in the fifth output and store that value in a variable
for /f "usebackq tokens=*" %%A in (C\TS) do set /a TS_COUNT+=1 && set /a RTS_COUNT=!TS_COUNT! -1

:: Step 19: Extract and optimize the textbased subtitle tracks
for /l %%i in (0,1,!RTS_COUNT!) do (if !RTS_COUNT! geq %%i (set "num=00%%i" && set "num=!num:~-3!" && ffmpeg -y -i C\TS.mks -map 0:s:!num! -f srt C\TS.srt && ffmpeg -y -i C\TS.srt -map 0:s:0 -f ass C\TS.ass && del C\TS.srt && sed -n "/\[Events\]/,$p" C\TS.ass > C\TS.txt && del C\TS.ass && (echo [Script Info] & echo [Styles] & type C\TS.txt) > C\TS!num!.ass && del C\TS.txt ) )

:: Step 20: Extract the chapter track
mkvextract chapters C\VAC.mkv > C\C && mkvmerge -o C\C.mkc %NULL% --chapters C\C && set C_FINAL=C\C.mkc

:: Step 21: Detect the name and language flags and store them in file form
copy NUL C\TI > nul && for /l %%i in (0,1,!RTS_COUNT!) do ( if !RTS_COUNT! geq %%i ( set "num=00%%i" && set "num=!num:~-3!" && ffprobe -v error -select_streams s:!num! -show_entries stream_tags=title -of default=nw=1:nk=1 C\TS.mks > C\N!num! && ffprobe -v error -select_streams s:!num! -show_entries stream_tags=language -of default=nw=1:nk=1 C\TS.mks > C\L!num! && del C\TI & mkvinfo --verbose C\TS.mks > C\TI && if "!num!"=="000" ( set "numshort=0" ) else ( for /f "tokens=* delims=0" %%A in ("!num!") do set "numshort=%%A" )

:: Step 22: Detect the default and forced flags and store them in file form
set /a increased_numshort=!numshort! +1 && sed -n "/Track number: !increased_numshort!/,+4p" C\TI > C\TB!num! && sed -n "s/.*Default flag: \([0-9]\+\).*/\1/p" C\TB!num! > C\D!num! && sed -n "s/.*Forced flag: \([0-9]\+\).*/\1/p" C\TB!num! > C\F!num! & ( type C\D!num! | findstr . >nul & if errorlevel 1 ( echo 1 > C\D!num! ) ) & ( type C\F!num! | findstr . >nul & if errorlevel 1 ( echo 0 > C\F!num! ) ) ) )

:: Step 23: Store the flags in separate variables
for /l %%i in (0,1,!RTS_COUNT!) do (if !RTS_COUNT! geq %%i (set "num=00%%i" && set "num=!num:~-3!" && set /p D!num!=<C\D!num! && set /p F!num!=<C\F!num! && set /p L!num!=<C\L!num! && set /p N!num!=<C\N!num!))

:: Step 24: Generate and merge the TSF###.mks files while adding flags to the subtitle tracks and generating a variable
if %RTS_COUNT% geq 1 ( mkvmerge -o C\TSF000.mks --default-track 0:%D000% --forced-track 0:%F000% --language 0:"%L000%" --track-name 0:"%N000%" C\TS000.ass && set TS_FINAL=C\TSF000.mks ) && for /l %%i in (1,1,!RTS_COUNT!) do ( set "num=00%%i" && set "num=!num:~-3!" && set /a prev=%%i - 1 && set "prev_num=00!prev!" && set "prev_num=!prev_num:~-3!" && call set "D_value=%%%%%%D!num!%%" && call set "F_value=%%%%%%F!num!%%" && call set "L_value=%%%%%%L!num!%%" && call set "N_value=%%%%%%N!num!%%" && set "D_actual=!D_value:~1!" && set "F_actual=!F_value:~1!" && set "L_actual=!L_value:~1!" && set "N_actual=!N_value:~1!" && mkvmerge -o C\TSF!num!.mks C\TSF!prev_num!.mks --default-track 0:!D_actual! --forced-track 0:!F_actual! --language 0:"!L_actual!" --track-name 0:"!N_actual!" C\TS!num!.ass && set TS_FINAL=C\TSF!num!.mks )

:: Step 25: Filter the input name
if "%INPUT%"=="Input.mkv" ( set INPUT=Output.mkv )

:: Step 26: Combine the VAIS, TSF and C files
mkvmerge -o C\%INPUT% C\VA.mkv %IS_FINAL% %TS_FINAL% %C_FINAL%

:: Step 27: Cleanup
del C\A && del C\C.mkc && del C\C && del C\IS && del C\IS.mks && del C\S && del C\S.mks && del C\TI && del C\TS && del C\TS.mks && del C\TSF.mks && del C\U && del C\V && del C\VA.mkv && del C\VAC.mkv && for /l %%i in (0,1,!RTS_COUNT!) do (if !RTS_COUNT! geq %%i (set "num=00%%i" && set "num=!num:~-3!" && del "C\D!num!" && del "C\F!num!" && del "C\L!num!" && del "C\N!num!" && del "C\TB!num!" && del "C\TS!num!.ass" && del "C\TSF!num!.mks"))

endlocal