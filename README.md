#Build the libmp3lame original source code (on Mac)
First, we need to compile the original libmp3lame sources for the architectures used by the different iOS platforms.

1. Extract the original lame sources (lame-3.99.5.tar.gz).
2. Copy the build script (build_ios.sh) into the directory with the sources.
3. Execute the build script to create the librirys for ios.
4. The created librarys for the different platforms are in the builds folder.

#Build the objective c wrapper (in XCode on Mac)
In the next step we create an Objective-C wrapper around the methods of the lame library we want to use.

1. Add the libmp3lame library created from the original sources to the project.
2. Write the Objective-C wrapper code and add the public interfaces to the header file.
3. Build the project and copy the resulting output files to './build' directory
5. Navigate into the './build' directory and execute [sharpie tool](https://developer.xamarin.com/guides/cross-platform/macios/binding/objective-sharpie/) to generate ApiDefinitions.cs:

```
sharpie bind -o . -sdk iphoneos9.2 ./include/Mp3Lame/Mp3Lame.h
```

#Build the C# bindings (in Visual Studio on Windows)
Finally, we create a bindings library in C# to use the Objective-C methods we created in the second step.

1. Add the library createt with xcode (in step two, 'libMp3Lame.a') to the Bindings Library Project.
2. Copy the content of the ApiDefinitions.cs file createt with the tool sharpie (in step two) into the ApiDefinitions.cs file from the Bindings Library Project.
3. Remove all [Verify(MethodToProperty)] from the ApiDefinitions.cs file.
3. Replace all short[] and byte[] with System.IntPtr in the ApiDefinitions.cs file.
4. Compile the project and add the resulting dll to the iOS project.
