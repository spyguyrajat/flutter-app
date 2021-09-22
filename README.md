# Flutter Template

A template to create Flutter applications.

## Using this template to setup a new repository

### Requirements:
-  [Flutter](https://flutter.dev/docs/get-started/install)
-  [Android Studio](https://developer.android.com/studio/install)

### Steps to be followed for setting up a project from this template
In the **Create a new repository** page, select the `Surya-Training/flutter_template` option from the **Repository template** menu.

In your newly created repository, do the following for initial setup. (It is preferred that you [clone](https://git-scm.com/docs/git-clone) the repository, [checkout](https://git-scm.com/docs/git-checkout) to a new branch, do the following setup and merge it to master through a pull request):

1) Setup Git LFS in the root directory of the repo. For documentation on how to setup Git LFS, [click here](https://git-lfs.github.com).

2) Now, from Android Studio Welcome screen, select `Open existing Android Studio Project` and point to the directory where you cloned this project.

3) When Android opens up the project, you will see errors. Open up the terminal in the current project directory and run `flutter packages get`. Alternatively, you can click on `Get dependencies` which can be found on the top right of the editor.

4) Delete `sample_test.dart` file located in the `test` directory. This file is only to showcase how tests are to be written.


## Contributing to this template

### Requirements:
-  [Flutter](https://flutter.dev/docs/get-started/install)
-  [Android Studio](https://developer.android.com/studio/install)

### Steps to be followed for contributing to this template

1) Clone the repo using `git clone git@github.com:Surya-Training/flutter_template.git`.

2) Setup Git LFS in the root directory of the repo. For documentation on how to setup Git LFS, [click here](https://git-lfs.github.com).

3) Now, from Android Studio Welcome screen, select `Open existing Android Studio Project` and point to the directory where you cloned this project.

4) When Android opens up the project, you will see errors. Open up the terminal in the current project directory and run `flutter packages get`. Alternatively, you can click on `Get dependencies` which can be found on the top right of the editor.

5) Run the project and verify if the setup is successful.


## FAQs

### How to update the app name?

1) In `android/app/build.gradle` file,  update the `applicationId` field in the `defaultConfig` section to denote new `applicationId`. For example, `applicationId "com.suryasoft.old_name"` would become `applicationId "com.suryasoft.new_name"`.

2) Update the package name according to the new name in `android/app/src/debug/AndroidManifest.xml`, `android/app/src/main/AndroidManifest.xml` and `android/app/src/profile/AndroidManifest.xml`. For example, `package="com.suryasoft.old_name"` would become `package="com.suryasoft.new_name"`.

3) In `android/app/src/main/kotlin/com/suryasoft/flutter_template/MainActivity.kt`, update `package com.suryasoft.old_name` to `package com.suryasoft.new_name`.

4) In `ios/Runner.xcodeproj/project.pbxproj`, set `PRODUCT_BUNDLE_IDENTIFIER` to `com.suryasoft.newName`. Make sure you follow proper casing. You should be meticulous in setting `PRODUCT_BUNDLE_IDENTIFIER` at its every occurrence in the file. Failing to comply may result in app crashes.

5) In `ios/Runner/Info.plist`, change `<string>old_name</string>` under `<key>CFBundleName</key>` to `<string>new_name</string>`.

6) In `pubspec.yaml`, change `name: old_name` to `name: new_name`.

7) Run `flutter clean` and build/run the project.
