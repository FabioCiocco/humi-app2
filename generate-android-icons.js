import fs from 'fs';
import path from 'path';

// Create SVG icon content
function createIconSVG(size) {
  return `<svg width="${size}" height="${size}" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="backgroundGradient" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#4F46E5;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#7C3AED;stop-opacity:1" />
    </linearGradient>
    <linearGradient id="iconGradient" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#F8BBD9;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#E879F9;stop-opacity:1" />
    </linearGradient>
  </defs>
  
  <!-- Background with rounded corners -->
  <rect width="512" height="512" rx="120" ry="120" fill="url(#backgroundGradient)"/>
  
  <!-- Head outline -->
  <path d="M 180 160 Q 180 120 220 120 L 292 120 Q 332 120 332 160 L 332 280 Q 332 320 292 320 L 260 320 L 260 360 Q 260 380 240 380 L 220 380 Q 200 380 200 360 L 200 320 L 220 320 Q 180 320 180 280 Z" 
        fill="none" 
        stroke="url(#iconGradient)" 
        stroke-width="8" 
        stroke-linecap="round" 
        stroke-linejoin="round"/>
  
  <!-- Heart in brain -->
  <path d="M 226 200 Q 226 185 240 185 Q 254 185 254 200 Q 268 185 282 185 Q 296 185 296 200 Q 296 220 254 250 Q 240 240 226 200 Z" 
        fill="url(#iconGradient)"/>
  
  <!-- Brain waves -->
  <ellipse cx="254" cy="215" rx="45" ry="20" 
           fill="none" 
           stroke="url(#iconGradient)" 
           stroke-width="3" 
           opacity="0.6"/>
  <ellipse cx="254" cy="215" rx="60" ry="28" 
           fill="none" 
           stroke="url(#iconGradient)" 
           stroke-width="2" 
           opacity="0.4"/>
  
  <!-- HUMI text -->
  <text x="256" y="420" 
        font-family="Arial, sans-serif" 
        font-size="48" 
        font-weight="bold" 
        text-anchor="middle" 
        fill="url(#iconGradient)" 
        letter-spacing="4px">HUMI</text>
  
  <!-- Tagline -->
  <text x="256" y="450" 
        font-family="Arial, sans-serif" 
        font-size="16" 
        text-anchor="middle" 
        fill="rgba(248,187,217,0.8)" 
        letter-spacing="2px">DAILY JOURNAL</text>
</svg>`;
}

// Icon sizes for Android
const iconSizes = [
  { size: 72, density: 'mdpi' },
  { size: 96, density: 'hdpi' },
  { size: 144, density: 'xhdpi' },
  { size: 192, density: 'xxhdpi' },
  { size: 512, density: 'xxxhdpi' }
];

// Create icon files
console.log('Generating HUMI Android icons...');

iconSizes.forEach(({ size, density }) => {
  const svgContent = createIconSVG(size);
  const dirPath = `android/app/src/main/res/mipmap-${density}`;
  const filePath = path.join(dirPath, 'ic_launcher.xml');
  
  // Create directory if it doesn't exist
  if (!fs.existsSync(dirPath)) {
    fs.mkdirSync(dirPath, { recursive: true });
  }
  
  // Create vector drawable XML for Android
  const vectorDrawable = `<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="${size}dp"
    android:height="${size}dp"
    android:viewportWidth="512"
    android:viewportHeight="512">
    
    <!-- Background -->
    <path
        android:pathData="M120,0 L392,0 Q512,0 512,120 L512,392 Q512,512 392,512 L120,512 Q0,512 0,392 L0,120 Q0,0 120,0 Z"
        android:fillColor="#4F46E5"/>
    
    <!-- Head outline -->
    <path
        android:pathData="M180,160 Q180,120 220,120 L292,120 Q332,120 332,160 L332,280 Q332,320 292,320 L260,320 L260,360 Q260,380 240,380 L220,380 Q200,380 200,360 L200,320 L220,320 Q180,320 180,280 Z"
        android:strokeColor="#F8BBD9"
        android:strokeWidth="8"
        android:strokeLineCap="round"
        android:strokeLineJoin="round"
        android:fillColor="@android:color/transparent"/>
    
    <!-- Heart -->
    <path
        android:pathData="M226,200 Q226,185 240,185 Q254,185 254,200 Q268,185 282,185 Q296,185 296,200 Q296,220 254,250 Q240,240 226,200 Z"
        android:fillColor="#E879F9"/>
</vector>`;
  
  fs.writeFileSync(filePath, vectorDrawable);
  console.log(`Created ${density} icon: ${filePath}`);
});

// Also create the main icon as SVG for Play Store
const playStoreIcon = createIconSVG(512);
fs.writeFileSync('android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.svg', playStoreIcon);
fs.writeFileSync('play-store-icon-512.svg', playStoreIcon);

console.log('✅ All Android icons generated successfully!');
console.log('✅ Play Store icon saved as play-store-icon-512.svg');

export { createIconSVG };