package de.jvpichowski.wrapper;

import de.jvpichowski.utils.natives.NativeLibraryLoader;
import de.jvpichowski.utils.natives.Platform;

public class NativeProjectLibrary {

    private NativeProjectLibrary() { }

    private static boolean isLoaded = false;

    static {
        NativeLibraryLoader.registerNativeLibrary("project", Platform.Linux64, "native/linux/x86_64/libproject.so");
        NativeLibraryLoader.registerNativeLibrary("project", Platform.Linux32, "native/linux/x86/libproject.so");
        NativeLibraryLoader.registerNativeLibrary("project", Platform.Windows64, "native/windows/x86_64/libproject.dll");
        NativeLibraryLoader.registerNativeLibrary("project", Platform.Windows32, "native/windows/x86/libproject.dll");
        NativeLibraryLoader.registerNativeLibrary("project", Platform.MacOSX64, "native/darwin/x86_64/libproject.dylib");
        NativeLibraryLoader.registerNativeLibrary("project", Platform.MacOSX32, "native/darwin/x86/libproject.dylib");

        NativeLibraryLoader.registerNativeLibrary("project_binding", Platform.Linux64, "native/linux/x86_64/libproject_binding.so");
        NativeLibraryLoader.registerNativeLibrary("project_binding", Platform.Linux32, "native/linux/x86/libproject_binding.so");
        NativeLibraryLoader.registerNativeLibrary("project_binding", Platform.Windows64, "native/windows/x86_64/libproject_binding.dll");
        NativeLibraryLoader.registerNativeLibrary("project_binding", Platform.Windows32, "native/windows/x86/libproject_binding.dll");
        NativeLibraryLoader.registerNativeLibrary("project_binding", Platform.MacOSX64, "native/darwin/x86_64/libproject_binding.dylib");
        NativeLibraryLoader.registerNativeLibrary("project_binding", Platform.MacOSX32, "native/darwin/x86/libproject_binding.dylib");
    }

    public static void loadNativeLibrary(){
        if(isLoaded) return;
        NativeLibraryLoader.loadNativeLibrary("project", true);
        NativeLibraryLoader.loadNativeLibrary("project_binding", true);
        isLoaded = true;
    }
}
