# HUMI - Integrazione Dominio humi.store

## Configurazione Completata

### 1. Configurazione Capacitor
File `capacitor.config.ts` aggiornato con:
- Server URL: https://humi.store
- Hostname: humi.store
- Schema HTTPS obbligatorio

### 2. Configurazione PWA Manifest
File `client/public/manifest.json` configurato per:
- Start URL: https://humi.store/
- Scope: https://humi.store/
- Icone app per tutte le densità

### 3. Configurazione Server Express
Server configurato con:
- CORS per dominio humi.store
- Security headers per produzione
- Support per origini multiple (www.humi.store, app.humi.store)
- HTTPS enforcement

### 4. Script Deployment
Creato `deploy-humi-store.sh` per:
- Build ottimizzato per produzione
- Configurazione automatica dominio
- Sync Capacitor con nuove impostazioni
- Compressione asset statici

## Requisiti Infrastruttura

### DNS Configuration
Configura questi record DNS per humi.store:
```
A       @           [IP_SERVER]
CNAME   www         humi.store
CNAME   app         humi.store (opzionale)
```

### SSL Certificate
- Certificato SSL valido per humi.store
- Wildcard certificate raccomandato (*.humi.store)
- Auto-redirect HTTP → HTTPS

### Environment Variables
Configura sul server di produzione:
```bash
NODE_ENV=production
DOMAIN=humi.store
DATABASE_URL=postgresql://[user]:[pass]@[host]:[port]/[db]
SESSION_SECRET=[secure-random-string]
```

## Deployment Steps

### 1. Preparazione Build
```bash
# Esegui build per humi.store
./deploy-humi-store.sh
```

### 2. Upload Files
Upload su server humi.store:
- `client/dist/*` → Root web directory
- `dist/*` → Server application directory
- `android/*` → For mobile app builds

### 3. Server Setup
```bash
# Install dependencies
npm ci --production

# Start production server
npm start
```

### 4. Verification
Verifica che funzioni:
- https://humi.store (PWA web app)
- https://humi.store/api/health (API status)
- https://humi.store/manifest.json (PWA manifest)

## Mobile App Configuration

### Android App
App configurata per:
- Server: https://humi.store
- API endpoints: https://humi.store/api/*
- Authentication: Secure HTTPS only

### Build Android
```bash
# Build APK per humi.store
npm run build
npx cap sync android
cd android && ./gradlew assembleRelease
```

## Features Integrate

### Progressive Web App
- Installabile da browser su humi.store
- Offline support con Service Worker
- Push notifications ready (se configurate)
- App-like experience su mobile

### Google Play Store
- Package: com.humi.journal
- Server URL: https://humi.store
- Hybrid app (web + native capabilities)

### Multi-Platform Access
Users possono usare HUMI via:
1. Browser web su humi.store
2. PWA installata da humi.store
3. Android app da Google Play Store
4. Direct APK download da humi.store

## Performance Optimization

### CDN Setup (Raccomandato)
- CloudFlare per cache globale
- Static asset caching (24h)
- API response caching (5min)
- Gzip compression automatica

### Database Optimization
- Connection pooling configurato
- Query optimization per scale
- Backup automatici configurati

L'applicazione HUMI è completamente configurata per l'integrazione con il dominio humi.store. Tutti i file sono pronti per il deployment su infrastruttura di produzione.