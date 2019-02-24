if [ "${TRAVIS_OS_NAME}" == "linux" ]; then
    echo "building binaries for linux and windows"
    ./gradlew :project-native:base:publishBinaryLinux64
    ./gradlew :project-native:base:publishBinaryLinux32
    ./gradlew :project-native:base:publishBinaryWindows64
    ./gradlew :project-native:base:publishBinaryWindows32
    ./gradlew :project-native:swig:publishBinaryLinux64
    ./gradlew :project-native:swig:publishBinaryLinux32
    ./gradlew :project-native:swig:publishBinaryWindows64
    ./gradlew :project-native:swig:publishBinaryWindows32
elif [ "${TRAVIS_OS_NAME}" == "osx" ]; then
    echo "building binaries for osx"
    ./gradlew :project-native:base:publishBinaryDarwin64
    ./gradlew :project-native:base:publishBinaryDarwin32
    ./gradlew :project-native:swig:publishBinaryDarwin64
    ./gradlew :project-native:swig:publishBinaryDarwin32
    otool -L project-native/src/binding/resources/native/darwin/x86_64/libproject.dylib
    otool -L project-native/src/binding/resources/native/darwin/x86_64/libproject_binding.dylib
    otool -L project-native/src/binding/resources/native/darwin/x86/libproject.dylib
    otool -L project-native/src/binding/resources/native/darwin/x86/libproject_binding.dylib
else 
    echo "target system is not supported: ${TRAVIS_OS_NAME}"
fi