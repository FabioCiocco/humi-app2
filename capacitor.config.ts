import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.humi.journal',
  appName: 'HUMI - Daily Journal',
  webDir: 'client/dist',
  server: {
    androidScheme: 'https',
    hostname: 'humi.store',
    url: 'https://humi.store'
  },
  android: {
    allowMixedContent: true,
    captureInput: true,
    webContentsDebuggingEnabled: false
  },
  plugins: {
    SplashScreen: {
      launchShowDuration: 2000,
      backgroundColor: "#6B7280",
      showSpinner: false
    },
    StatusBar: {
      style: "DARK",
      backgroundColor: "#6B7280"
    }
  }
};

export default config;
