# HUMI App - Guida Completa per Google Play Store

## Stato Attuale del Progetto

✅ **Completato:**
- App funzionale e testata
- Legal compliance (Privacy Policy, Terms of Service)
- Configurazione Capacitor per Android
- Google Play Console configurato con tester interni
- Icone e metadata pronti

❌ **Da completare:**
- Generazione App Bundle (.aab) firmato
- Upload su Google Play Console

## Opzioni per Generare App Bundle

### Opzione 1: Build Locale (Raccomandato)

**Prerequisiti:**
- Android Studio installato
- Java 11+ installato
- Android SDK configurato

**Passi:**
1. Scarica il progetto Replit sul tuo computer
2. Apri terminale nella directory del progetto
3. Esegui lo script di build:
```bash
chmod +x build-app-bundle.sh
./build-app-bundle.sh
```

### Opzione 2: Android Studio Manual Build

1. Apri Android Studio
2. Apri il progetto dalla cartella `android/`
3. Build → Generate Signed Bundle/APK
4. Seleziona "Android App Bundle"
5. Usa il keystore esistente o creane uno nuovo
6. Build release AAB

### Opzione 3: Comando Gradle Diretto

```bash
# Nella directory del progetto
npm run build
npx cap sync android
cd android
./gradlew bundleRelease
```

Il file AAB sarà in: `android/app/build/outputs/bundle/release/app-release.aab`

## File Necessari per Google Play Console

1. **App Bundle (.aab)** - File principale dell'app
2. **Privacy Policy URL:** https://humi.store/privacy-policy.html
3. **Terms of Service URL:** https://humi.store/terms-of-service.html
4. **Icone e Screenshot** - Già preparati
5. **Descrizione dell'app** - Pronta in multiple lingue

## Upload su Google Play Console

1. Vai su Google Play Console
2. Seleziona l'app HUMI
3. Release → Production → Create new release
4. Upload dell'App Bundle (.aab)
5. Compila metadati richiesti
6. Pubblica per revisione

## Configurazione Keystore (Se Necessario)

Se non hai un keystore, creane uno:
```bash
keytool -genkey -v -keystore humi-release.keystore -alias humi -keyalg RSA -keysize 2048 -validity 10000
```

## Contatti e Supporto

- **Email supporto:** info@humi.store
- **Dominio principale:** humi.store
- **Account deletion:** https://humi.store/delete-account.html

## Tester Interni Configurati

Email già aggiunte per il test interno:
- fabianacolonelli@gmail.com
- umbiux89@gmail.com
- francescaputzu1@gmail.com
- mirellafraschetti@gmail.com
- riccardocioccoloni@gmail.com

L'app è completamente pronta per la pubblicazione. Serve solo generare l'App Bundle in ambiente locale.