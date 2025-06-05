#!/bin/bash

# HUMI App - Build Script per App Bundle (AAB)
# Da eseguire in ambiente con Java e Android SDK

set -e

echo "Building HUMI App Bundle for Google Play Store"
echo "=============================================="

# Verifica prerequisiti
if ! command -v java &> /dev/null; then
    echo "ERROR: Java non trovato. Installa Java 11+ prima di continuare."
    exit 1
fi

# Build dell'app web
echo "Building web app..."
npm run build

# Sync con Capacitor
echo "Syncing with Capacitor..."
npx cap sync android

# Copy web assets
echo "Copying web assets..."
npx cap copy android

# Build App Bundle
echo "Building App Bundle..."
cd android
./gradlew bundleRelease

# Verifica creazione AAB
AAB_PATH="app/build/outputs/bundle/release/app-release.aab"
if [ -f "$AAB_PATH" ]; then
    echo "SUCCESS: App Bundle creato!"
    echo "Percorso: android/$AAB_PATH"
    
    # Copia nella directory root
    cp "$AAB_PATH" "../humi-release.aab"
    echo "App Bundle copiato come: humi-release.aab"
    
    # Informazioni file
    ls -lh "$AAB_PATH"
else
    echo "ERROR: Creazione App Bundle fallita"
    exit 1
fi

echo ""
echo "App Bundle pronto per Google Play Console!"
echo "File: humi-release.aab"