package de.jvpichowski.wrapper;

import de.jvpichowski.project.Project;

public class Wrapper {

    public Wrapper() {
        NativeProjectLibrary.loadNativeLibrary();
    }

    public void sayHello() {
        Project.sayHello();
    }
}