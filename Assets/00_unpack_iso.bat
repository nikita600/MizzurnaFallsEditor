psximager\psxrip.exe -l "Mizzurna Falls (English).cue" FileSystem
pause
xcopy "FileSystem\CD.BIN" "Resources\CD.BIN" /y
xcopy "FileSystem\SLPS017.83" "Resources\SLPS017.83" /y
xcopy "FileSystem\CD.BIN" "Resources\src_CD.BIN" /y
xcopy "FileSystem\SLPS017.83" "Resources\src_SLPS017.83" /y
pause