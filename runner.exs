defmodule VideoConcat do
  def run do
    input = IO.gets("Enter first video file name with extension (must be mp4): ") |> String.trim
    input2 = IO.gets("Enter second video file name with extension (must be mp4): ") |> String.trim
    output = IO.gets("Enter output file name: ") |> String.trim

    command = "ffmpeg -i #{input}.mp4 -i #{input2}.mp4 -filter_complex \"[0:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v0];[1:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v1];[v0][0:a][v1][1:a]concat=n=2:v=1:a=1[v][a]\" -map \"[v]\" -map \"[a]\" #{output}.mp4 -vsync 2"

    System.cmd("sh", ["-c", command])

    IO.puts("Thank you for taking time out of your busy schedule. Follow me on LinkedIn: https://www.linkedin.com/in/mehmetbasrioglu/")
  end
end

VideoConcat.run()
