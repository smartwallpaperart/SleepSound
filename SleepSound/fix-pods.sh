#!/bin/bash
set -e

echo "🔧 Running postinstall fix for Capacitor iOS Pods..."

# Vérifie la présence du dossier node_modules
if [ ! -d "node_modules" ]; then
  echo "📦 Installing dependencies..."
  npm install --legacy-peer-deps --force
fi

# Vérifie la présence du module Capacitor iOS
if [ ! -d "node_modules/@capacitor/ios" ]; then
  echo "📦 Installing @capacitor/ios..."
  npm install @capacitor/ios@latest --force
fi

# Vérifie que le fichier pods_helpers.rb existe
if [ ! -f "node_modules/@capacitor/ios/scripts/pods_helpers.rb" ]; then
  echo "⚙️ Creating missing pods_helpers.rb..."
  mkdir -p node_modules/@capacitor/ios/scripts
  echo "# dummy file created by fix-pods.sh" > node_modules/@capacitor/ios/scripts/pods_helpers.rb
fi

# Synchronise le projet natif
echo "🔄 Running Capacitor sync..."
npx cap sync ios || true

echo "✅ postinstall fix complete!"
