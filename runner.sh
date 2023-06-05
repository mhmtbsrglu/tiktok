#!/bin/bash
read -p "Enter first video file name with extension (must be mp4): " Input
read -p "Enter second video file name with extension (must be mp4): " Input2
read -p "Enter output file name: " Output

/mnt/host/c/ffmpeg/ffmpeg-2023-05-31-git-baa9fccf8d-full_build/bin/ffmpeg.exe -i "$Input.mp4" -i "$Input2.mp4" -filter_complex "[0:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v0];[1:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v1];[v0][0:a][v1][1:a]concat=n=2:v=1:a=1[v][a]" -map "[v]" -map "[a]" "$Output.mp4" -vsync 2
echo thank you for taking time out of your busy schedule. Follow me on linkedin : https://www.linkedin.com/in/mehmetbasrioglu/