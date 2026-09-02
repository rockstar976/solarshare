// Read base64 strings
const fs = require('fs');

const logoB64 = fs.readFileSync('c:/Users/rekha/ideathon/logo_only.txt', 'utf8').trim();
const bannerB64 = fs.readFileSync('c:/Users/rekha/ideathon/banner_only.txt', 'utf8').trim();

let html = fs.readFileSync('c:/Users/rekha/ideathon/index.html', 'utf8');

// Replace all ./logo.jpg references
const logoDataUrl = `data:image/jpeg;base64,${logoB64}`;
const bannerDataUrl = `data:image/jpeg;base64,${bannerB64}`;

html = html.replaceAll('./logo.jpg', logoDataUrl);
html = html.replaceAll('./banner.jpg', bannerDataUrl);

fs.writeFileSync('c:/Users/rekha/ideathon/index.html', html);
console.log('Done! Replaced logo and banner with base64 data URLs.');
