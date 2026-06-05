# 1. Suppression radicale des dossiers de build et du dossier Android corrompu
Remove-Item -Recurse -Force .dart_tool, .flutter-plugins, .flutter-plugins-dependencies, build, android -ErrorAction SilentlyContinue

Write-Host "Dossier Android et caches supprimes !"

# 2. Demander à Flutter de recréer un dossier Android tout neuf aux normes V2
flutter create --platforms=android .

Write-Host "Nouveau dossier Android V2 genere par Flutter !"