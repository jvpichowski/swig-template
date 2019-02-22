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
    ./gradlew :project-native:base:publishBinaryOsx64
    ./gradlew :project-native:base:publishBinaryOsx32
    ./gradlew :project-native:swig:publishBinaryOsx64
    ./gradlew :project-native:swig:publishBinaryOsx32
else 
    echo "target system is not supported: ${TRAVIS_OS_NAME}"
fi