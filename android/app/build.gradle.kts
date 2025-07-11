import java.util.Properties

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val properties = Properties()
val localPropertiesFile = project.rootProject.file("key.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.inputStream().use { input ->
        properties.load(input)
    }
}

if (properties.containsKey("storeFile")) {
    project.ext.set("MYAPP_UPLOAD_STORE_FILE", properties["storeFile"])
    project.ext.set("MYAPP_UPLOAD_STORE_PASSWORD", properties["storePassword"])
    project.ext.set("MYAPP_UPLOAD_KEY_ALIAS", properties["keyAlias"])
    project.ext.set("MYAPP_UPLOAD_KEY_PASSWORD", properties["keyPassword"])
}

android {
    namespace = "com.durzaam.dakservice"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_1_8.toString() // Juga ubah jvmTarget ke 1.8
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.durzaam.dakservice"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdkVersion(21)
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    signingConfigs {
        create("release") {
            if (project.hasProperty("MYAPP_UPLOAD_STORE_FILE")) {
                storeFile = file(project.property("MYAPP_UPLOAD_STORE_FILE") as String)
                storePassword = project.property("MYAPP_UPLOAD_STORE_PASSWORD") as String
                keyAlias = project.property("MYAPP_UPLOAD_KEY_ALIAS") as String
                keyPassword = project.property("MYAPP_UPLOAD_KEY_PASSWORD") as String
            }
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            //signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Tambahkan baris ini di sini
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4") // Gunakan versi terbaru jika ada
}
