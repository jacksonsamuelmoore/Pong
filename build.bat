windres icon.rc -O coff -o icon.res
g++ -c pong.cpp -ID:\SFML-2.4.2\include -iquote Headers
g++ pong.o -o Build\pong.exe icon.res -LD:\SFML-2.4.2\lib -lsfml-graphics -lsfml-window -lsfml-system -lsfml-main -mwindows -static-libgcc -static-libstdc++
cd Build
start pong.exe
iscc ..\installerscript.iss

 
