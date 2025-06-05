#!/bin/bash

# HUMI App - Build Script per Google Play Store
# Questo script crea l'APK finale firmato per la pubblicazione

set -e

echo "🚀 HUMI App - Build per Google Play Store"
echo "========================================"

# Controllo prerequisiti
echo "📋 Controllo prerequisiti..."

if ! command -v npx &> /dev/null; then
    echo "❌ Node.js/npm non trovato. Installa Node.js prima di continuare."
    exit 1
fi

if ! command -v npx cap &> /dev/null; then
    echo "❌ Capacitor CLI non trovato. Installando..."
    npm install -g @capacitor/cli
fi

# Pulizia build precedenti
echo "🧹 Pulizia build precedenti..."
rm -rf client/dist
rm -rf android/app/build

# Build dell'app web
echo "🔨 Build dell'applicazione web..."
npm run build

# Sync con Capacitor
echo "🔄 Sincronizzazione con Capacitor..."
npx cap sync android

# Copia delle risorse Android
echo "📱 Preparazione risorse Android..."
npx cap copy android

# Verifica della configurazione Android
echo "🔍 Verifica configurazione Android..."
if [ ! -f "android/app/src/main/res/mipmap-hdpi/ic_launcher.png" ]; then
    echo "⚠️  Icone Android non trovate. Generando icone..."
    node generate-android-icons.js
fi

# Verifica keystore
KEYSTORE_PATH="android/app/humi-release-key.keystore"
if [ ! -f "$KEYSTORE_PATH" ]; then
    echo "🔑 Keystore non trovato. Creando keystore di rilascio..."
    ./create-keystore.sh
fi

echo "📦 Build dell'APK di rilascio..."
cd android

# Build release APK
./gradlew assembleRelease

# Verifica che l'APK sia stato creato
APK_PATH="app/build/outputs/apk/release/app-release.apk"
if [ -f "$APK_PATH" ]; then
    echo "✅ APK creato con successo!"
    echo "📍 Percorso: android/$APK_PATH"
    
    # Informazioni sull'APK
    echo ""
    echo "📊 Informazioni APK:"
    ls -lh "$APK_PATH"
    
    # Copia l'APK nella directory root per facilità di accesso
    cp "$APK_PATH" "../humi-play-store-release.apk"
    echo "📋 APK copiato come: humi-play-store-release.apk"
    
else
    echo "❌ Errore nella creazione dell'APK"
    exit 1
fi

cd ..

echo ""
echo "🎉 BUILD COMPLETATO!"
echo "========================"
echo "📱 APK pronto per Google Play Store: humi-play-store-release.apk"
echo "🔗 Privacy Policy: https://humi.store/privacy-policy.html"
echo "🔗 Termini di Servizio: https://humi.store/terms-of-service.html"
echo "📧 Supporto: info@humi.store"
echo ""
echo "📋 Prossimi passi:"
echo "1. Accedi a Google Play Console"
echo "2. Carica humi-play-store-release.apk"
echo "3. Configura le informazioni dell'app"
echo "4. Aggiungi screenshot e grafica"
echo "5. Pubblica l'app"
echo ""
echo "✅ L'app è pronta per la pubblicazione!"