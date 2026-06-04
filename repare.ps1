# 1. Chemins des fichiers clés
$manifestPath = "android/app/src/main/AndroidManifest.xml"
$kotlinDir = "android/app/src/main/kotlin/com/example/vocal_offline"
$kotlinFile = "$kotlinDir/MainActivity.kt"

# 2. Réécriture propre de l'AndroidManifest principal
$manifestContent = @"
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <application
        android:label="vocal_offline"
        android:name="`${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
    <queries>
        <intent>
            <action android:name="android.intent.action.MAIN"/>
        </intent>
    </queries>
</manifest>
"@
Set-Content -Path $manifestPath -Value $manifestContent

# 3. Forcer la création du fichier MainActivity.kt au format V2 strict
if (!(Test-Path $kotlinDir)) {
    New-Item -ItemType Directory -Force -Path $kotlinDir | Out-Null
}

$kotlinContent = @"
package com.example.vocal_offline

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}
"@
Set-Content -Path $kotlinFile -Value $kotlinContent

Write-Host "AndroidManifest et MainActivity.kt ont ete v2-ises de force !"