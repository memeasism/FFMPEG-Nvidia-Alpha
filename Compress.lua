io.write("Make sure to run in the directory of the files\n")
io.write("What is your input file?\n")
local input = io.read()
io.write("What do you want your output file name to be?(don't include extention)\n")
local output = io.read()

os.execute(
	'ffmpeg -i "'
		.. input
		.. '" -vcodec h264_nvenc -pix_fmt:v yuv420p -crf:v 15 -acodec flac "'
		.. output
		.. '_rgb.mkv"'
)
os.execute(
	'ffmpeg -i "'
		.. input
		.. '" -map 0:v:0 -vf "extractplanes=a" -vcodec h264_nvenc -pix_fmt yuv420p -crf:v 15 -an -y "'
		.. output
		.. '_alpha.mkv"'
)

io.write("\nPress any key to exit")
io.read()
