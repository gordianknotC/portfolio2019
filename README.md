# [![Flutter logo][]][flutter.dev]

[![Build Status - Cirrus][]][Build status]
[![Gitter Channel][]][Gitter badge]

Flutter is Google's mobile app SDK for crafting high-quality native interfaces
on iOS and Android in record time. Flutter works with existing code, is used by
developers and organizations around the world, and is free and open source.

## Trouble Shooting



#### Error - Could not get unknown property 'runtimeConfiguration' 

###### erorr quintences
- __Execution failed for task ':audioplayer:verifyReleaseResources'.__
    - __error: resource android:attr/fontStyle not found__

- __Could not get unknown property 'runtimeConfiguration' for object of type com.android.build.gradle.internal.api.LibraryVariantImpl.__



###### detail logs
    ```log
    FAILURE: Build failed with an exception.
    
    * What went wrong:
    Execution failed for task ':audioplayer:verifyReleaseResources'.
    > A failure occurred while executing com.android.build.gradle.internal.tasks.Workers$ActionFacade
       > Android resource linking failed
         C:\Users\gordianknot\.gradle\caches\transforms-2\files-2.1\0a271e99b6771ad4a84318244d532fb7\core-1.0.0\res\values\values.xml:57:5-88:25: AAPT: error: resource android:attr/fontStyle not found.
         C:\Users\gordianknot\.gradle\...
         ...
    
    * Try:
    Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.
    
    * Get more help at https://help.gradle.org
    
    BUILD FAILED in 36s
    Running Gradle task 'assembleRelease'...
    Running Gradle task 'assembleRelease'... Done                      37.4s
    The built failed likely due to AndroidX incompatibilities in a plugin. The tool is about to try using Jetfier to solve the incompatibility.
    Building plugin audioplayer...
    Running Gradle task 'assembleAarRelease'...
    Running Gradle task 'assembleAarRelease'... Done                    3.6s
    NDK is missing a "platforms" directory.
    If you are using NDK, verify the ndk.dir is set to a valid NDK directory.  It is currently set to D:\Users\gordianknot\AppData\Local\Android\android-sdk\ndk-bundle.
    If you are not using NDK, unset the NDK variable from ANDROID_NDK_HOME or local.properties to remove this warning.
    
    Incremental java compilation is an incubating feature.
    
    BUILD FAILED
    
    Total time: 3.336 secs
    
    
    FAILURE: Build failed with an exception.
    
    * Where:
    Initialization script 'E:\flutter\packages\flutter_tools\gradle\aar_init_script.gradle' line: 122
    
    * What went wrong:
    Could not get unknown property 'runtimeConfiguration' for object of type com.android.build.gradle.internal.api.LibraryVariantImpl.
    
    * Try:
    Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output.
    
    
    The plugin audioplayer could not be built due to the issue above.
    
    ```

###### Solution

set compileSdkVersion of audioplayer to 28 to match the sdkversion used in my project.

```groovy
android {
    compileSdkVersion 28 // 25
//    buildToolsVersion '25.0.3'
    ...
}
```




Flutter is a fully open source project, and we welcome contributions.
Information on how to get started can be found at our
[contributor guide](CONTRIBUTING.md).

[Flutter logo]: https://flutter.dev/assets/flutter-lockup-4cb0ee072ab312e59784d9fbf4fb7ad42688a7fdaea1270ccf6bbf4f34b7e03f.svg
[flutter.dev]: https://flutter.dev
[Build Status - Cirrus]: https://api.cirrus-ci.com/github/flutter/flutter.svg
[Build status]: https://cirrus-ci.com/github/flutter/flutter/master
[Gitter Channel]: https://badges.gitter.im/flutter/flutter.svg
[Gitter badge]: https://gitter.im/flutter/flutter?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge
[layered architecture]: https://flutter.dev/docs/resources/inside-flutter
[widget catalog]: https://flutter.dev/widgets/
[Reflectly hero image]: https://github.com/flutter/website/blob/master/src/images/homepage/reflectly-hero-600px.png
[Skia]: https://skia.org/
[Dart platform]: https://dart.dev/
[Hot reload animation]: https://raw.githubusercontent.com/flutter/website/master/src/_assets/image/tools/android-studio/hot-reload.gif
[Hot reload]: https://flutter.dev/docs/development/tools/hot-reload
[Visual Studio Code]: https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter
[IntelliJ / Android Studio]: https://plugins.jetbrains.com/plugin/9212-flutter
[Flutter packages]: https://pub.dev/flutter
[interop example]: https://github.com/flutter/flutter/tree/master/examples/platform_channel