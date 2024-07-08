cls
echo arg1 - %1
echo arg2 - %2

"%AsepriteRoot%\Aseprite.exe"^
 -b^
 %1^
 --filename-format "{title}_{tagframe}.{extension}"^
 --save-as %2

pause