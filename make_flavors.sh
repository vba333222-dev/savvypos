#!/bin/bash

echo "🦎 The Chameleon Engine: Build Script 🦎"

# 1. Generate Icons
echo "🎨 Generating Icons..."
flutter pub run flutter_launcher_icons -f flutter_launcher_icons-dev.yaml
flutter pub run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml

# 2. Build Dev
echo "🏗️ Building Dev (APK)..."
flutter build apk --flavor dev --target lib/main_dev.dart --debug
echo "✅ Dev Build Complete: build/app/outputs/flutter-apk/app-dev-debug.apk"

# 3. Build Prod (Obfuscated)
echo "🛡️ Building Prod (Obfuscated Bundle)..."
# Ensure symbols dir exists
mkdir -p build/app/outputs/symbols

flutter build appbundle \
  --flavor prod \
  --target lib/main_prod.dart \
  --obfuscate \
  --split-debug-info=build/app/outputs/symbols

echo "✅ Prod Build Complete: build/app/outputs/bundle/prodRelease/app-prod-release.aab"
echo "🔑 Symbol Maps: build/app/outputs/symbols"
