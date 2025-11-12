#!/bin/bash
echo "🔧 Installing npm dependencies..."
npm install

echo "⚙️ Syncing Capacitor..."
npx cap sync ios
