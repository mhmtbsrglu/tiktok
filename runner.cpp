#include <iostream>
#include <string>
#include <cstdlib>

int main() {
    std::string input, input2, output;
    
    std::cout << "Enter first video file name with extension (must be mp4): ";
    std::cin >> input;
    
    std::cout << "Enter second video file name with extension (must be mp4): ";
    std::cin >> input2;
    
    std::cout << "Enter output file name: ";
    std::cin >> output;

    std::string command = "ffmpeg -i " + input + ".mp4 -i " + input2 + ".mp4 -filter_complex \"[0:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v0];[1:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v1];[v0][0:a][v1][1:a]concat=n=2:v=1:a=1[v][a]\" -map \"[v]\" -map \"[a]\" " + output + ".mp4 -vsync 2";

    system(command.c_str());
    
    std::cout << "Thank you for taking time out of your busy schedule. Follow me on LinkedIn: https://www.linkedin.com/in/mehmetbasrioglu/" << std::endl;
    
    return 0;
}
