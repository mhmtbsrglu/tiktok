import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class VideoConcat {
    public static void main(String[] args) {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        try {
            System.out.print("Enter first video file name with extension (must be mp4): ");
            String input = reader.readLine().trim();

            System.out.print("Enter second video file name with extension (must be mp4): ");
            String input2 = reader.readLine().trim();

            System.out.print("Enter output file name: ");
            String output = reader.readLine().trim();

            String command = "ffmpeg -i " + input + ".mp4 -i " + input2 + ".mp4 -filter_complex \"[0:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v0];[1:v]scale=480:854:force_original_aspect_ratio=decrease,pad=480:854:(ow-iw)/2:(oh-ih)/2,setsar=1[v1];[v0][0:a][v1][1:a]concat=n=2:v=1:a=1[v][a]\" -map \"[v]\" -map \"[a]\" " + output + ".mp4 -vsync 2";

            Process process = Runtime.getRuntime().exec(new String[] {"sh", "-c", command});

            BufferedReader processOutputReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = processOutputReader.readLine()) != null) {
                System.out.println(line);
            }

            System.out.println("Thank you for taking time out of your busy schedule. Follow me on LinkedIn: https://www.linkedin.com/in/mehmetbasrioglu/");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
