# Guida Completa: HUMI su Google Play Store

## 1. Preparazione Account e Costi

### Account Google Play Console
- Costo: $25 (pagamento unico)
- Registrazione: https://play.google.com/console
- Documenti richiesti: documento d'identità, dati fiscali

### Informazioni App
- **Nome**: HUMI - Daily Journal
- **Package Name**: com.humi.app
- **Categoria**: Health & Fitness
- **Età target**: 13+ (journaling e benessere emotivo)

## 2. Build della App Android

### Opzione A: Build Locale (Raccomandato)
```bash
# Sul tuo computer:
git clone [URL_REPLIT_PROJECT]
cd humi-app
npm install
npm run build
npx cap sync android
npx cap open android
```

### Opzione B: PWABuilder (Automatico)
1. Vai su https://www.pwabuilder.com
2. Inserisci l'URL della tua app deployata
3. Genera APK per Android
4. Scarica il file APK pronto per Play Store

## 3. Asset Grafici Richiesti

### Icona App
- **Dimensione**: 512x512 px
- **Formato**: PNG a 32 bit
- **Design**: Logo HUMI su sfondo solido

### Screenshots (obbligatori)
- **Phone**: minimo 2, massimo 8
- **Dimensioni**: 320-3840 px (lato più lungo)
- **Formato**: JPG o PNG a 24 bit

### Feature Graphic
- **Dimensione**: 1024x500 px
- **Uso**: Header della pagina Play Store
- **Contenuto**: Logo + slogan "Track your emotions, reflect daily"

## 4. Store Listing Ottimizzato

### Titolo (30 caratteri)
```
HUMI - Daily Journal
```

### Descrizione Breve (80 caratteri)
```
Track your mood, write reflections, understand emotional patterns daily
```

### Descrizione Completa (4000 caratteri)
```
Discover emotional wellness with HUMI, your personal daily journal app.

✨ FEATURES
• Simple mood tracking with intuitive emoji selection
• Daily reflection writing with guided prompts
• Beautiful calendar view of your emotional journey
• Weekly and monthly insights and trends
• Multilingual support (English, Italian, Spanish, French, German)
• Offline functionality with automatic sync
• Privacy-focused with local data storage

🌱 BENEFITS
HUMI helps you build emotional awareness through consistent journaling. Track your feelings, understand patterns, and grow towards better mental health.

Perfect for:
• Mindfulness and self-reflection practice
• Therapy and counseling support
• Personal growth and emotional intelligence
• Stress management and wellness tracking
• Building healthy daily habits

🔒 PRIVACY & SECURITY
Your personal thoughts and emotions stay private. All data is stored securely on your device with optional cloud backup.

🎨 BEAUTIFUL DESIGN
Clean, intuitive interface designed for daily use. Calming colors and smooth animations create a peaceful journaling experience.

📱 WORKS EVERYWHERE
Install as a web app or download from Play Store. Seamlessly sync across all your devices.

Start your emotional wellness journey today with HUMI.
```

### Parole Chiave
```
mood tracker, journal, emotional health, mindfulness, mental wellness, diary, reflection, feelings, therapy, self-care
```

## 5. Requisiti Legali

### Privacy Policy (Obbligatoria)
```url
https://your-humi-app.replit.app/privacy-policy
```

### Documento da creare:
```markdown
# Privacy Policy - HUMI

## Data Collection
HUMI collects only the data you voluntarily provide:
- Journal entries and mood selections
- Account information (email, name)

## Data Storage
- All personal data stored locally on your device
- Optional cloud backup with user consent
- No third-party data sharing

## Data Usage
Your data is used solely to provide the journaling service.
We do not sell, rent, or share personal information.

## Contact
For privacy questions: privacy@humi.app
```

## 6. Configurazione Android

### File: android/app/build.gradle
```gradle
android {
    compileSdkVersion 34
    defaultConfig {
        applicationId "com.humi.app"
        minSdkVersion 22
        targetSdkVersion 34
        versionCode 1
        versionName "1.0.0"
    }
    
    buildTypes {
        release {
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            signingConfig signingConfigs.release
        }
    }
}
```

### Keystore di Produzione
```bash
keytool -genkey -v -keystore humi-release-key.keystore \
-alias humi -keyalg RSA -keysize 2048 -validity 10000
```

## 7. Processo di Pubblicazione

### Step 1: Upload APK
1. Accedi a Play Console
2. Crea nuova app "HUMI"
3. Upload APK nella sezione "Release"

### Step 2: Store Listing
1. Compila tutte le informazioni app
2. Carica screenshots e icone
3. Aggiungi descrizioni multilingue

### Step 3: Content Rating
1. Completa questionario IARC
2. Categoria: Informazioni Generali
3. Target: 13+ (contenuto neutrale)

### Step 4: Prezzi e Distribuzione
1. App gratuita
2. Distribuzione mondiale
3. Nessun acquisto in-app

## 8. Timeline e Approvazione

### Tempistiche Stimate
- Upload e configurazione: 2-4 ore
- Review Google: 1-3 giorni lavorativi
- Pubblicazione: immediata dopo approvazione

### Motivi Comuni di Rifiuto
- Privacy policy mancante o inadeguata
- Screenshots di bassa qualità
- Descrizione non conforme alle policy
- APK non firmato correttamente

## 9. Post-Pubblicazione

### Monitoraggio
- Console analytics per download e utilizzo
- Reviews e rating degli utenti
- Crash reports e feedback

### Aggiornamenti
- Versioni successive tramite Android App Bundle
- A/B testing per miglioramenti
- Localizzazione per nuovi mercati

## File Allegati Necessari

1. **APK firmato** per production
2. **Icon 512x512** in PNG
3. **Screenshots** per diverse dimensioni schermo
4. **Feature graphic** 1024x500
5. **Privacy policy** pubblicata online

La tua app HUMI è già perfettamente funzionante. Questi passaggi la renderanno disponibile su Play Store per milioni di utenti Android.

Per iniziare subito, ti consiglio l'opzione PWABuilder che converte automaticamente la tua PWA in APK pronto per Play Store.