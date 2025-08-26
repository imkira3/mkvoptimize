@echo off
setlocal enabledelayedexpansion

:: Step 0: Settings
set INPUT="I.mkv"
set OUTPUT="C\I1.mkv"

:: Step 1: Create the Output Folder
mkdir C

:: Step 2: Optimize video and audio
ffmpeg -i "%INPUT%" -filter:v fps=23.976 -threads 0 -an -sn -c:v libx264 -preset veryfast -tune film -b:v 1200k -maxrate 1500k -bufsize 2000k -x264-params "pass=1:stats=\\.\stats.log.temp" -f null NUL
ffmpeg -i "%INPUT%" -filter:v fps=23.976 -threads 0 -map 0:v:0 -map 0:a? -sn -c:v libx264 -preset veryfast -tune film -b:v 1200k -maxrate 1500k -bufsize 2000k -x264-params "pass=2:stats=\\.\stats.log.temp" -c:a aac "%OUTPUT%"

:: Step 3: Optimize subtitles
ffmpeg -y -i "%INPUT%" -map 0:s:0 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S00.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:1 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S01.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:2 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S02.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:3 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S03.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:4 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S04.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:5 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S05.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:6 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S06.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:7 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S07.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:8 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S08.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:9 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S09.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:10 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S10.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:11 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S11.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:12 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S12.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:13 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S13.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:14 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S14.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:15 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S15.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:16 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S16.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:17 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S17.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:18 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S18.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:19 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S19.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:20 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S20.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:21 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S21.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:22 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S22.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:23 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S23.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:24 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S24.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:25 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S25.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:26 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S26.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:27 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S27.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:28 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S28.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:29 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S29.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:30 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S30.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:31 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S31.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:32 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S32.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:33 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S33.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:34 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S34.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:35 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S35.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:36 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S36.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:37 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S37.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:38 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S38.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:39 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S39.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:40 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S40.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:41 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S41.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:42 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S42.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:43 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S43.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:44 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S44.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:45 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S45.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:46 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S46.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:47 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S47.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:48 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S48.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:49 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S49.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:50 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S50.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:51 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S51.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:52 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S52.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:53 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S53.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:54 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S54.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:55 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S55.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:56 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S56.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:57 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S57.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:58 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S58.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:59 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S59.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:60 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S60.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:61 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S61.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:62 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S62.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:63 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S63.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:64 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S64.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:65 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S65.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:66 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S66.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:67 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S67.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:68 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S68.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:69 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S69.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:70 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S70.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:71 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S71.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:72 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S72.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:73 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S73.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:74 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S74.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:75 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S75.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:76 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S76.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:77 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S77.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:78 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S78.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:79 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S79.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:80 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S80.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:81 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S81.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:82 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S82.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:83 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S83.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:84 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S84.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:85 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S85.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:86 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S86.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:87 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S87.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:88 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S88.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:89 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S89.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:90 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S90.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:91 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S91.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:92 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S92.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:93 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S93.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:94 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S94.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:95 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S95.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:96 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S96.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:97 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S97.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:98 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S98.ass && del C\S.ass
ffmpeg -y -i "%INPUT%" -map 0:s:99 -f srt C\S.srt && ffmpeg -y -i C\S.srt -map 0:s:0 -f ass C\S.ass && del C\S.srt && "C:\Windows\System32\sed.exe" -n "/\[Events\]/,$p" C\S.ass > C\S99.ass && del C\S.ass

endlocal