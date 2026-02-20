# Deployment Guide: The Chameleon Engine

## 1. Flavors & Entry Points
We use a flavor-based architecture to support multiple environments.

| Environment | Entry Point | Config |
|-------------|-------------|--------|
| **Development** | `lib/main_dev.dart` | `AppConfig(flavor: Flavor.dev)` |
| **Production** | `lib/main_prod.dart` | `AppConfig(flavor: Flavor.prod)` |

## 2. Generating Icons
To update app icons for each flavor:
```bash
# Generate Dev Icons
flutter pub run flutter_launcher_icons -f flutter_launcher_icons-dev.yaml

# Generate Prod Icons
flutter pub run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml
```

## 3. Building for Release (The Iron Curtain)
To build a secure, obfuscated release APK/Bundle:

```bash
# 1. Clean
flutter clean

# 2. Build Release (Obfuscated)
flutter build apk \
  --flavor prod \
  --target lib/main_prod.dart \
  --obfuscate \
  --split-debug-info=./build/app/outputs/symbols
```

**Note:** Always keep the `symbols` folder safe! You need these files to de-obfuscate stack traces from Crashlytics.

## 4. Signing (Keystore)
Do **NOT** commit `key.properties` or `.jks` files to Git.
1. Create `android/key.properties`:
   ```properties
   storePassword=YOUR_STORE_PASS
   keyPassword=YOUR_KEY_PASS
   keyAlias=key
   storeFile=../keystore.jks
   ```
2. Ensure `android/app/build.gradle` references this file to sign the release build.
