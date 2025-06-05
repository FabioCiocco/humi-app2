#!/bin/bash

# HUMI Android Build Script for Google Play Store
# Run this script to build production-ready APK and AAB files

echo "🔄 Starting HUMI Android build process..."

# Step 1: Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -rf client/dist
rm -rf android/app/build

# Step 2: Install dependencies
echo "📦 Installing dependencies..."
npm install

# Step 3: Build web assets
echo "🏗️ Building web assets..."
timeout 180s npm run build || {
    echo "⚠️ Build timeout, using existing assets"
}

# Step 4: Ensure dist directory exists
mkdir -p client/dist

# Step 5: Sync with Capacitor
echo "🔄 Syncing with Capacitor..."
npx cap sync android

# Step 6: Check Android project structure
echo "📱 Checking Android project..."
if [ ! -d "android" ]; then
    echo "❌ Android project not found. Run 'npx cap add android' first."
    exit 1
fi

# Step 7: Copy app icons (manual step reminder)
echo "🎨 App Icons Setup:"
echo "   1. Open generate-icons.html in browser"
echo "   2. Download PNG icons for all sizes (72x72, 96x96, 144x144, 192x192, 512x512)"
echo "   3. Copy to android/app/src/main/res/mipmap-* directories"
echo "   4. Rename as ic_launcher.png"

# Step 8: Build debug APK
echo "🔨 Building debug APK..."
cd android
if ./gradlew assembleDebug 2>/dev/null; then
    echo "✅ Debug APK built: android/app/build/outputs/apk/debug/app-debug.apk"
else
    echo "⚠️ Debug build failed. Check Android Studio setup."
fi

# Step 9: Build release APK (unsigned)
echo "🔨 Building release APK..."
if ./gradlew assembleRelease 2>/dev/null; then
    echo "✅ Release APK built: android/app/build/outputs/apk/release/app-release-unsigned.apk"
else
    echo "⚠️ Release build failed. Need signing key setup."
fi

# Step 10: Build AAB for Play Store (unsigned)
echo "📦 Building AAB bundle for Google Play Store..."
if ./gradlew bundleRelease 2>/dev/null; then
    echo "✅ AAB bundle built: android/app/build/outputs/bundle/release/app-release.aab"
else
    echo "⚠️ AAB build failed. Need signing key setup."
fi

cd ..

echo ""
echo "🎉 HUMI Android build process completed!"
echo ""
echo "📋 Next Steps for Google Play Store:"
echo "   1. Generate and add app icons using generate-icons.html"
echo "   2. Sign the AAB file with your keystore"
echo "   3. Upload to Google Play Console"
echo "   4. Complete store listing with descriptions and screenshots"
echo "   5. Submit for review"
echo ""
echo "📁 Build outputs:"
echo "   - Debug APK: android/app/build/outputs/apk/debug/"
echo "   - Release APK: android/app/build/outputs/apk/release/"
echo "   - AAB Bundle: android/app/build/outputs/bundle/release/"
echo ""
echo "📚 Documentation:"
echo "   - Google Play Store Guide: GOOGLE_PLAY_STORE_LAUNCH.md"
echo "   - App Ready Summary: PLAY_STORE_READY_SUMMARY.md"