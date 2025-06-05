#!/bin/bash

# Generate keystore for HUMI app signing
echo "Creating keystore for HUMI app signing..."

# Generate the keystore
keytool -genkey -v -keystore android/app/humi-release-key.keystore \
  -alias humi-key \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -storepass humisecure123 \
  -keypass humisecure123 \
  -dname "CN=HUMI, OU=HUMI Team, O=HUMI, L=City, S=State, C=IT"

echo "Keystore created at: android/app/humi-release-key.keystore"
echo "Alias: humi-key"
echo "Store password: humisecure123"
echo "Key password: humisecure123"