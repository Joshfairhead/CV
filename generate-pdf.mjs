import puppeteer from 'puppeteer';
import { fileURLToPath } from 'url';
import { dirname, resolve } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const cvPath = resolve(__dirname, 'public/cv/index.html');
const outputPath = resolve(__dirname, 'public/josh-fairhead-cv.pdf');

const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
const page = await browser.newPage();
await page.goto(`file://${cvPath}`, { waitUntil: 'networkidle0' });
await page.pdf({
  path: outputPath,
  format: 'A4',
  printBackground: true,
  margin: { top: 0, right: 0, bottom: 0, left: 0 },
});
await browser.close();
console.log(`PDF generated at ${outputPath}`);
