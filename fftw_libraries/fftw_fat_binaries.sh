
if [ -d "universal" ]; then
  rm -rf "universal"
fi

mkdir universal

echo "creating macOS-ARM and macOS-x86 frameworks/libraries \n"

lipo -create binaries/macOS_arm/libfftw3_threads.a binaries/macOS_x86/libfftw3_threads.a -output universal/libfftw3_threads_universal.a

lipo -create binaries/macOS_arm/libfftw3.a binaries/macOS_x86/libfftw3.a -output universal/libfftw3_universal.a

lipo -create binaries/macOS_arm/libfftw3f_threads.a binaries/macOS_x86/libfftw3f_threads.a -output universal/libfftw3f_threads_universal.a

lipo -create binaries/macOS_arm/libfftw3f.a binaries/macOS_x86/libfftw3f.a -output universal/libfftw3f_universal.a


lipo -create binaries/macOS_arm/libfftw3_threads.3.dylib binaries/macOS_x86/libfftw3_threads.3.dylib -output universal/libfftw3_threads.3_universal.dylib

lipo -create binaries/macOS_arm/libfftw3.3.dylib binaries/macOS_x86/libfftw3.3.dylib -output universal/libfftw3.3_universal.dylib

lipo -create binaries/macOS_arm/libfftw3f_threads.3.dylib binaries/macOS_x86/libfftw3f_threads.3.dylib -output universal/libfftw3f_threads.3_universal.dylib

lipo -create binaries/macOS_arm/libfftw3f.3.dylib binaries/macOS_x86/libfftw3f.3.dylib -output universal/libfftw3f.3_universal.dylib

echo "verifying the new macOS-ARM and macOS-x86 frameworks/libraries \n"

lipo -info universal/libfftw3_threads_universal.a

echo "\n"

lipo -info universal/libfftw3_universal.a

echo "\n"

lipo -info universal/libfftw3f_threads_universal.a

echo "\n"

lipo -info universal/libfftw3f_universal.a

echo "\n"

lipo -info universal/libfftw3_threads.3_universal.dylib

echo "\n"

lipo -info universal/libfftw3.3_universal.dylib

echo "\n"

lipo -info universal/libfftw3f_threads.3_universal.dylib

echo "\n"

lipo -info universal/libfftw3f.3_universal.dylib

echo "\n"

echo "the new macOS-ARM and macOS-x86 are verified"

echo "\n"