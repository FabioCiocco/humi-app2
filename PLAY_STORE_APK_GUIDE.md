# HUMI App - APK Build Guide for Play Store

## Current Status
L'applicazione HUMI è completa e funzionale. Per completare l'APK per Google Play Store:

## Metodo 1: Build Locale (Raccomandato)
Sul tuo computer locale con Android Studio installato:

```bash
# 1. Clona il progetto
git clone [repository-url]
cd humi-app

# 2. Installa dipendenze
npm install

# 3. Build web assets
npm run build

# 4. Sincronizza Capacitor
npx cap sync android

# 5. Apri in Android Studio
npx cap open android

# 6. In Android Studio:
# - Build > Generate Signed Bundle/APK
# - Seleziona APK
# - Crea nuovo keystore o usa esistente
# - Build Release APK
```

## Metodo 2: GitHub Actions (Automatico)
Configurazione CI/CD per build automatico:

```yaml
# .github/workflows/android.yml
name: Android Build
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-java@v3
        with:
          java-version: '17'
          distribution: 'temurin'
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm install
      - run: npm run build
      - run: npx cap sync android
      - run: cd android && ./gradlew assembleRelease
```

## File Preparati per Play Store

### Icone Generate ✅
- `play-store-icon-512.svg` - Icona Play Store (512x512)
- Icone adaptive per tutte le densità Android generate

### Configurazione App ✅
```
App ID: com.humi.journal
Nome: HUMI - Daily Journal
Versione: 1.0.0
Target SDK: 34
Min SDK: 24
```

### Descrizioni Pronte
**Titolo Breve (30 chars):**
`HUMI - Daily Journal`

**Descrizione Breve (80 chars):**
`Track moods, write thoughts, build habits. Your daily emotional wellness.`

**Descrizione Completa:**
```
HUMI is your personal daily journal for emotional wellness and mindfulness.

🌟 FEATURES:
• Track daily moods with 5 emotions
• Write personal journal entries
• View weekly trends and insights
• Build consistent habits with streaks
• Multi-language support (5 languages)
• Dark/Light theme options
• Intelligent emotional support
• Privacy-focused offline storage

📱 PERFECT FOR:
• Daily reflection and mindfulness
• Emotional awareness building
• Habit tracking and consistency
• Mental health monitoring
• Personal growth journaling

🔒 PRIVACY:
Your data stays private. All entries stored securely on your device.

Start your emotional wellness journey today with HUMI!
```

### Screenshots Necessari
Devi preparare screenshot dell'app in funzione:
- 2-8 screenshot telefono (1080x1920px)
- 1-8 screenshot tablet (1200x1920px)

## Passi Successivi
1. Completa APK build con uno dei metodi sopra
2. Firma APK con keystore di produzione
3. Prepara screenshot dell'app
4. Carica su Google Play Console
5. Compila informazioni app
6. Invia per revisione

## Link Utili
- Google Play Console: https://play.google.com/console
- Android Developer Guide: https://developer.android.com/studio/publish
- APK Signing: https://developer.android.com/studio/publish/app-signing

L'app è pronta - serve solo completare il processo di build e upload su Play Store.