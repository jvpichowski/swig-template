package de.jvpichowski.wrapper;

import de.jvpichowski.utils.natives.NativeLibraryLoader;
import de.jvpichowski.utils.natives.Platform;

public class NativeProjectLibrary {

    private NativeProjectLibrary() { }

    private static boolean isLoaded = false;

    static {
        NativeLibraryLoader.registerNativeLibrary("project", Platform.Linux64, "native/linux/x86_64/libproject.so");
        NativeLibraryLoader.registerNativeLibrary("project", Platform.Linux32, "native/linux/x86/libproject.so");
        NativeLibraryLoader.registerNativeLibrary("project_binding", Platform.Linux64, "native/linux/x86_64/libproject_binding.so");
        NativeLibraryLoader.registerNativeLibrary("project_binding", Platform.Linux32, "native/linux/x86/libproject_binding.so");
    }

    public static void loadNativeLibrary(){
        if(isLoaded) return;
        NativeLibraryLoader.loadNativeLibrary("project", true);
        NativeLibraryLoader.loadNativeLibrary("project_binding", true);
        isLoaded = true;
    }
}
