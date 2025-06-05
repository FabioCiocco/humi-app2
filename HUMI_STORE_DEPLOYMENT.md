# HUMI - Deployment su humi.store

## Configurazione Dominio Personalizzato

### DNS Setup Richiesto
Per collegare l'app al dominio humi.store, configura questi record DNS:

```
Type: A
Name: @ (o humi.store)
Value: [IP del server Replit o hosting provider]

Type: CNAME  
Name: www
Value: humi.store

Type: CNAME
Name: app (opzionale per app.humi.store)
Value: humi.store
```

### Configurazione HTTPS/SSL
1. Certificato SSL configurato per humi.store
2. Redirect automatico HTTP → HTTPS
3. HSTS headers per sicurezza

### Variabili d'Ambiente Produzione
```bash
# Database
DATABASE_URL=postgresql://[username]:[password]@[host]:[port]/[database]

# Dominio
DOMAIN=humi.store
PROTOCOL=https

# Session
SESSION_SECRET=[generate-strong-secret]

# Analytics (opzionale)
GOOGLE_ANALYTICS_ID=[your-ga-id]

# App URLs
APP_URL=https://humi.store
API_URL=https://humi.store/api
```

### Configurazione Server Express
Il server è già configurato per supportare:
- Serving statico degli asset PWA
- API endpoints per /api/*
- Gestione session con database
- CORS per dominio humi.store

### File Configurazione Aggiornati
- `capacitor.config.ts` - URL server https://humi.store
- `client/public/manifest.json` - Start URL e scope
- Service Worker - Cache per humi.store

### Build per Produzione humi.store
```bash
# 1. Build ottimizzato per produzione
npm run build

# 2. Sync Capacitor con nuova configurazione
npx cap sync android

# 3. Test locale con dominio
# Modifica /etc/hosts per test:
# 127.0.0.1 humi.store

# 4. Deploy su hosting provider
# Upload dist/ e server files
```

### Replit Deployment Settings
Se usi Replit Deployments:
1. Connetti dominio personalizzato humi.store
2. Configura variabili d'ambiente
3. Enable custom domain in deployment settings
4. Verifica SSL certificate

### Android App Configuration
L'app Android è configurata per:
- Server URL: https://humi.store
- Schema: HTTPS obbligatorio
- Domain whitelist: humi.store

### PWA Installation
Con humi.store gli utenti possono:
- Installare PWA direttamente dal browser
- Aggiungere alla home screen
- Utilizzare offline con Service Worker
- Ricevere notifiche push (se configurate)

### Verifica Deployment
1. `https://humi.store` - App web accessibile
2. `https://humi.store/api/health` - API funzionanti
3. `https://humi.store/manifest.json` - PWA manifest
4. SSL certificate valido
5. Performance metrics ottimali

### CDN e Caching
Raccomandazioni per produzione:
- CloudFlare per CDN globale
- Caching statico asset (24h)
- Caching API responses (5min)
- Gzip compression abilitata

Il deployment su humi.store è configurato e pronto per la produzione.