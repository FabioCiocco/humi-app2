# Guida per Pubblicare HUMI su Play Store e App Store

## Preparazione Locale

### 1. Setup dell'ambiente di sviluppo
```bash
# Clona il progetto localmente
git clone [URL_DEL_TUO_REPLIT]
cd humi-app

# Installa dipendenze
npm install

# Installa Capacitor
npm install @capacitor/core @capacitor/cli @capacitor/android @capacitor/ios

# Inizializza Capacitor
npx cap init "HUMI" "com.humi.app" --web-dir="client/dist"
```

### 2. Configurazione Capacitor
Modifica `capacitor.config.ts`:
```typescript
import { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.humi.app',
  appName: 'HUMI',
  webDir: 'client/dist',
  server: {
    androidScheme: 'https'
  },
  plugins: {
    SplashScreen: {
      launchShowDuration: 2000,
      backgroundColor: "#6366f1",
      showSpinner: false
    },
    StatusBar: {
      style: 'dark'
    }
  }
};

export default config;
```

## Build per Android (Play Store)

### 3. Preparazione Android
```bash
# Build del progetto web
npm run build

# Aggiungi piattaforma Android
npx cap add android

# Sincronizza i file
npx cap sync android

# Apri in Android Studio
npx cap open android
```

### 4. Configurazione Android Studio
- Apri il progetto in Android Studio
- Genera keystore di produzione:
  ```bash
  keytool -genkey -v -keystore humi-release-key.keystore -alias humi -keyalg RSA -keysize 2048 -validity 10000
  ```
- Configura `android/app/build.gradle` per il release
- Build APK firmato per Play Store

### 5. Pubblicazione Play Store
- Crea account Google Play Console ($25)
- Upload APK/AAB
- Compila store listing:
  - Titolo: "HUMI - Daily Journal"
  - Descrizione breve: "Track your emotions, reflect daily"
  - Categoria: Health & Fitness
  - Screenshots richiesti

## Build per iOS (App Store)

### 6. Preparazione iOS
```bash
# Aggiungi piattaforma iOS
npx cap add ios

# Sincronizza i file
npx cap sync ios

# Apri in Xcode
npx cap open ios
```

### 7. Configurazione Xcode
- Account sviluppatore Apple ($99/anno)
- Configura Bundle Identifier: `com.humi.app`
- Configura certificati di sviluppo/distribuzione
- Archive per App Store

### 8. Pubblicazione App Store
- Upload tramite Xcode o Application Loader
- App Store Connect:
  - Nome app: "HUMI"
  - Categoria: Health & Fitness
  - Screenshots per tutte le dimensioni dispositivi
  - Descrizione e parole chiave

## Requisiti Legali

### 9. Documenti necessari
- **Privacy Policy** (obbligatoria)
- **Terms of Service**
- **Informativa sui cookies**

### 10. Store Listing ottimizzato
**Titolo**: HUMI - Daily Emotional Journal
**Sottotitolo**: Track mood, reflect, grow daily
**Descrizione**:
```
Discover emotional wellness with HUMI, your personal daily journal.

✓ Track your mood with intuitive emoji selection
✓ Write meaningful daily reflections
✓ Visualize emotional patterns with calendar view
✓ Gain insights from weekly and monthly trends
✓ Available in 5 languages
✓ Works offline with cloud sync

HUMI helps you build emotional awareness through consistent journaling. 
Track your feelings, understand patterns, and grow towards better mental health.

Perfect for mindfulness practice, therapy support, or personal growth.
```

**Keywords**: mood tracker, journal, emotional health, mindfulness, mental wellness

## Icone e Asset

### 11. Requisiti grafici
**Android**:
- Icon: 512x512px
- Feature graphic: 1024x500px
- Screenshots: varie dimensioni

**iOS**:
- App Icon: 1024x1024px
- Screenshots: iPhone e iPad

## Timeline stimata
- Setup locale: 2-3 ore
- Build Android: 1-2 giorni
- Build iOS: 2-3 giorni
- Approvazione Play Store: 1-3 giorni
- Approvazione App Store: 1-7 giorni

## Note importanti
1. Testa l'app su dispositivi reali prima della pubblicazione
2. Prepara tutti i documenti legali prima del submit
3. L'app PWA esistente funziona già perfettamente su mobile
4. Considera di iniziare con Android (più veloce da approvare)

La tua app HUMI è già perfettamente funzionante come PWA. Il processo sopra ti permetterà di distribuirla anche attraverso gli store ufficiali per massimizzare la reach.