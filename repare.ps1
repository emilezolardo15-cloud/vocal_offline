# 1. Nettoyage des dossiers générés par Flutter
Remove-Item -Recurse -Force .dart_tool, .flutter-plugins, .flutter-plugins-dependencies, build -ErrorAction SilentlyContinue

# 2. Réécriture propre de l'AndroidManifest principal
$manifestPath = "android/app/src/main/AndroidManifest.xml"
$manifestContent = @"
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <application
        android:label="vocal_offline"
        android:name="`${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name="io.flutter.embedding.android.FlutterActivity"
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

# 3. Forcer la mise à jour des liaisons Flutter
$projectPropertiesPath = "android/local.properties"
if (Test-Path $projectPropertiesPath) {
    Remove-Item $projectPropertiesPath -Force
}

Write-Host "Nettoyage radical effectue avec succes !"