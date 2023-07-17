mkdir -Force build/
Copy-Item -Path res/ -Destination build/res -Force -Recurse
rm -Force ./build/OpenGLTemplate.exe

if ((Get-Content -Path CMakeLists.md5) -eq (Get-FileHash -Path CMakeLists.txt -Algorithm MD5).hash) {
    echo 'CMakeLists.txt has not changed. Ignoring Rebuild...'
} else {
    echo 'CMakeLists.txt has changed. Rebuilding...'
    cmake -G "MinGW Makefiles" -B build .
}

(Get-FileHash -Path CMakeLists.txt -Algorithm MD5).hash > CMakeLists.md5

cd build
make
cd ..
./build/OpenGLTemplate.exe