# /bin/bash

mkdir build/ > /dev/null 2>&1
cp -rf res/ build/res > /dev/null 2>&1
rm -f ./build/OpenGLTemplate > /dev/null 2>&1

CACHE=$(cat CMakeLists.md5)
GENERATED=$(md5sum CMakeLists.txt | cut -d' ' -f1)

if [ $CACHE = $GENERATED ]
then
    echo 'CMakeLists.txt has not changed. Ignoring Rebuild...'
else
    echo 'CMakeLists.txt has changed. Rebuilding...'
    cmake -B build
fi

md5sum CMakeLists.txt | cut -d' ' -f1 > CMakeLists.md5

cd build
make
cd ..
./build/OpenGLTemplate