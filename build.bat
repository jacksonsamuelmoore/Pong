cd D:\miniweb\C_C++\Pong\Repo
windres icon.rc -O coff -o icon.res
g++ -c pong.cpp -ID:\SFML-2.4.2\include -iquote Headers
g++ pong.o -o ..\Build_Latest\Full\pong.exe icon.res -LD:\SFML-2.4.2\lib -lsfml-graphics -lsfml-window -lsfml-system -lsfml-main -mwindows -static-libgcc -static-libstdc++
cd ..\
7z a -r -tzip "D:\miniweb\C_C++\Pong\Builds\Zipped\Build %DATE:~7,2%.%DATE:~4,2%.%DATE:~-4%.zip" ./Build_Latest/Full/*
cd Build_Latest\Full
start pong.exe
iscc ..\..\Repo\installerscript.iss
cd ..\..\
copy Build_Latest\Executable\pong_installer.exe "Builds\Executable\pong_installer_%DATE:~7,2%.%DATE:~4,2%.%DATE:~-4%.exe"
git commit -m "Build %DATE% %TIME%" --all
git pull
git push
