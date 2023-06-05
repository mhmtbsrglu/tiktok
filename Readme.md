<h2 align="center" style="color:#005fbc">Reverse Engineering - Let's build and understand.</h2>


https://github.com/mhmtbsrglu/tiktok/assets/99546413/6ea6028c-fdf9-461c-8ac9-965835a912a4



<br/>
<br/>

# What is FFMPEG?

FFMPEG is a free and open-source software project that provides many tools for video and audio processing. It is designed to work in a command-line interface and has multiple libraries and programs to handle and manipulate video files.

# Which companies are using?

![alt text](youtube-google-canada.jpg "YouTube")

## YouTube

- Processing of video-related metadata.
- Printing metadata information that many of us not realize is being tracked, such as fingerprint tracking.
- Providing HLS
- Exporting cover frames of a video in PNG format at specific intervals for use as cover photos.
- Offering the service to change the cover photo of a video.
- Parsing videos into format such as 480p,720p, 1080p

![alt text](tiktok.jpg "YouTube")

## TikTok

- Processing of video-related metadata.
- Printing metadata information that many of us not realize is being tracked, such as fingerprint tracking.
- Providing HLS
- Concatenating intros representing the company at the end of the video.
- Exporting cover frames of a video in PNG format at specific intervals for use as cover photos.
- Processing of ai face filters

## List of other companies/startups:

- Tango App
- Instagram Reels
- Discord
- Azar
- Twitter
- Ford Oto Sanayi
- Evrim Ağacı Tech

# Which command sequence does TikTok use for merging the intro and video?

```cmd
ffmpeg -i %Input%.mp4 -i %Input2%.mp4 -filter_complex "[0:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v0];[1:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v1];[v0][0:a][v1][1:a]concat=n=2:v=1:a=1[v][a]" -map "[v]" -map "[a]" %Input3%.mp4 -vsync 2

```

## What does each step do, in order?

1. -i %Input%.mp4 and -i %Input2%.mp4: In the first step, the command takes %Input%.mp4 and %Input2%.mp4 files as input. %Input% and %Input2% are placeholder variables that should be replaced with actual file names.

2. -filter_complex: This parameter is used to define a complex filter chain.

3. [0:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v0] and [1:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v1]: These steps perform the same operations for both input video files. First, the size of the videos is scaled to 480x854 pixels (scale=480:854). Then, a frame of size 480x854 is created while preserving the original aspect ratio of the videos (force_original_aspect_ratio=decrease, pad=480:854:(ow-iw)/2:(oh-ih)/2). Finally, the aspect ratio of the image is set to 1 (setsar=1). These steps result in two new video streams ([v0] and [v1]) with the same size and aspect ratio for both videos.

4. [v0][0:a][v1][1:a]concat=n=2:v=1:a=1[v][a]: In this step, the concat filter is used to concatenate [v0], [0:a], [v1], and [1:a] streams. The parameter n=2 indicates that two video files are being concatenated. The parameters v=1 and a=1 specify that the concatenated output video stream ([v]) will include video and audio ([a]).

5. -map "[v]" -map "[a]": In this step, the concatenated video stream ([v]) and audio stream ([a]) are assigned to the specified output file.

6. %Input3%.mp4: This parameter specifies the name of the output file. %Input3% is a placeholder variable that should be replaced with the actual file name.

7. -vsync 2: This parameter controls video synchronization. -vsync 2 sets the required sample rate to maintain synchronization between the input video files.

As a result, this command merges two input video files into a single output video file named %Input3%.mp4, ensuring they have the same size and aspect ratio.

# Syntax

## Runner.bat

```cmd
start runner.bat
```

## Runner.sh

```bash
bash runner.sh
```

## Runner.sh

```cmd
elixir runner.exs
```

## Runner.java

```cmd
java runner.java
```

### You cannot believe this magic by the result after running the command.

<br/>

![alt text](os.gif "Tepki")
<br/>
<br/>
<br/>

## Congratulations! You have now taken your first step into the infrastructure of your own TikTok application.

![alt text](tebrikler.gif "Tebrikler")
