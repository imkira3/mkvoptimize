# mkvoptimize Toolkit
The mkvoptimize Toolkit is a set of video optimization scripts that aims at optimizing all video, audio and subtitle streams in a video file to save space with a minimum of quality loss in the video stream, to convert audio to stereo (optional), and to convert text subtitles to a stripped form of SSA that gives your video player full font control. The kit consists of 3 tools:

## mkvoptimize (BETA)

mkvoptimize doesn't do much to the audio, that's mkaoptimize's job. All this will do to the audio is convert your audio to AAC without specifying a bitrate, unless it's already AAC in which case the stream will simply be copied. If you made a stereo track beforehand with mkaoptimize then you have the option of either replacing your surround sound track, or adding a stereo track too. Going stereo-only will DRASTICALLY reduce the size of the final output.

Video and subtitles are where mkvoptimize truly shines. I spent years messing around with methods of video conversion, trying to find a good balance between video quality and filesize, but not just that, I was also interested in keeping the resources required to run the video file, mainly CPU and GPU, but also memory and disk, to a minimum. After a while I figured out a few things, like how more highly compressed formats require more processing power to extract, and how ffmpegs h264 2-pass system is superior to QP or CRF. After a while I built the perfectly engineered command I wanted, a command that can turn a 1080p movie into roughly 1.5-2 gigs whatever the original size was and without sacrificing much quality, while also making it playable on a stock dual-core with no video card! This command became the mkvoptimize core command. mkvoptimize works on other resolutions too, but as far as my 1080p tests go thats about the average. Now I mentioned how my 2-pass command is superior to CRF or QP, now I'll explain why. First we scan the file first (pass 1) and generate a stats file that tells ffmpeg details about the file such as bitrate and/or filesize, but not in a general manner, it's more specific to a given area in the timeline. In other words, it scans the entire video and tells ffmpeg what parts of the video are intensive (action-oriented scenes with epic special effects) and which parts are non-intensive (just people sitting, talking, not moving much, no special effects) and this lets us target those specific areas in a video that take the most CPU and GPU to process. To summarize, mkvoptimize doesn't just reduce filesize, it acts like a RESOURCE EQUALIZER, specifically by lowering quality more or less depending on how intensive each individual scene in a video is. So pass 1 scans, pass 2 converts, and 2-pass also gives us a lot more settings to configure than CRF or QP, which means a lot more control over the conversion process.

Subtitles are something else mkvoptimize will alter, at least your text-based subtitles anyway. In order to give your video player full control over font size, colour, position, etc. and to convert your subtitles to a smaller, easier to edit format that doesn't rely in index numbers, mkvoptimize will first divide your text-based and image-based subtitles into 2 files, then it will convert to text-based SRT to remove formatting, then to SSA, and then, finally I edit every subtitle with sed, removing the topmost formatting information too. Now we have a stripped substation alpha (SSSA) file for every sub. The script then recombines everthing and does so in a manner that preserves default track, forced track, name and language flags. Preserving and then reassigning those flags dynamically was not easy.

Font files are included in the final output, but the script doesn't alter them in any way.

Please use and edit the tool as much as you like, everything in here is covered under the GNU Public License including the assets. Installation is simple, just extract the assets zip file and put everything in there in the system32 and SysWow64 directories. The zip file inclides:

ffmpeg
ffprobe
mkvmerge
mkvextract
mkvinfo
sed
plus 3 dll files that sed requires to run

After that you can use either mkvoptimize.bat or mkvoptimize.exe, they are the same, just in different formats. Operation is simple, either double click the file to convert every video file in the current directory, or, drag and drop a SINGLE video file onto the mkvoptimize file to convert just one file. Either way the files you work on will need to be in the same folder as mkvoptimize, good thing all its assets are external. (It's only 500kbs!) Files will output to a subfolder named C which will be automatically created, many temporary files will also be generated in C during the conversion process but they will be deleted when the script ends.

## mkaoptimize (COMING SOON)

As I said above, this script will aim to convert any type of audio track to stereo in order to save space.

## mksoptimize (COMING SOON)

You can use this tool to convert and extract subs without having to convert the entire mkv file.
