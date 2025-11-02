# 🚀 Deployment Guide - Smart Crop Technologies

This guide will help you deploy the Smart Crop Technologies platform to production.

---

## 📋 Pre-Deployment Checklist

- [ ] All code committed to Git repository
- [ ] Environment variables configured
- [ ] Dependencies installed and tested locally
- [ ] Build passes successfully (`npm run build`)
- [ ] No TypeScript errors (`npm run type-check`)
- [ ] ESLint passes (`npm run lint`)

---

## 🌐 Option 1: Deploy to Vercel (Recommended)

Vercel is the easiest and fastest way to deploy Next.js applications.

### Step 1: Push to GitHub

```bash
# Initialize git (if not already done)
git init
git add .
git commit -m "Initial commit: Smart Crop Technologies platform"

# Create GitHub repository and push
git remote add origin https://github.com/yourusername/smart-crop-tech.git
git branch -M main
git push -u origin main
```

### Step 2: Deploy to Vercel

**Method A: Using Vercel Dashboard**

1. Go to [vercel.com](https://vercel.com) and sign in
2. Click **"Add New Project"**
3. Import your GitHub repository
4. Configure project:
   - **Framework Preset**: Next.js
   - **Root Directory**: `./`
   - **Build Command**: `npm run build`
   - **Output Directory**: `.next`

5. Add Environment Variables:
   ```
   NEXT_PUBLIC_API_URL=https://your-app-name.vercel.app
   ```

6. Click **"Deploy"**
7. Wait 2-3 minutes for deployment to complete
8. Your app will be live at `https://your-app-name.vercel.app`

**Method B: Using Vercel CLI**

```bash
# Install Vercel CLI
npm install -g vercel

# Login to Vercel
vercel login

# Deploy
vercel

# Deploy to production
vercel --prod
```

### Step 3: Configure Custom Domain (Optional)

1. In Vercel Dashboard, go to **Settings** → **Domains**
2. Add your custom domain (e.g., `smartcroptech.com`)
3. Update DNS records as instructed
4. SSL certificate will be auto-generated

---

## 🔧 Option 2: Deploy to Netlify

### Step 1: Prepare Build

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Login
netlify login
```

### Step 2: Configure netlify.toml

Create `netlify.toml`:
```toml
[build]
  command = "npm run build"
  publish = ".next"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

### Step 3: Deploy

```bash
# Deploy
netlify deploy

# Deploy to production
netlify deploy --prod
```

---

## ☁️ Option 3: Deploy to AWS (Advanced)

### Using AWS Amplify

1. Go to AWS Amplify Console
2. Connect your GitHub repository
3. Configure build settings:
   ```yaml
   version: 1
   frontend:
     phases:
       preBuild:
         commands:
           - npm install
       build:
         commands:
           - npm run build
     artifacts:
       baseDirectory: .next
       files:
         - '**/*'
     cache:
       paths:
         - node_modules/**/*
   ```
4. Deploy

### Using EC2 + PM2

```bash
# On EC2 instance
sudo apt update
sudo apt install nodejs npm nginx

# Clone repository
git clone https://github.com/yourusername/smart-crop-tech.git
cd smart-crop-tech

# Install dependencies
npm install

# Build
npm run build

# Install PM2
npm install -g pm2

# Start with PM2
pm2 start npm --name "smart-crop-tech" -- start

# Configure Nginx reverse proxy
sudo nano /etc/nginx/sites-available/smart-crop-tech
```

Nginx configuration:
```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

---

## 🔐 Environment Variables Setup

### Production Environment Variables

Create these in your deployment platform:

```env
# API Configuration
NEXT_PUBLIC_API_URL=https://your-production-domain.com

# Database (when implemented)
DATABASE_URL=postgresql://user:password@host:5432/dbname
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_KEY=your-supabase-anon-key

# Storage (when implemented)
AWS_S3_BUCKET=smart-crop-images
AWS_ACCESS_KEY_ID=your-access-key
AWS_SECRET_ACCESS_KEY=your-secret-key

# Notifications (when implemented)
TWILIO_ACCOUNT_SID=your-twilio-sid
TWILIO_AUTH_TOKEN=your-twilio-token
TWILIO_PHONE_NUMBER=+1234567890

# Weather API (when implemented)
OPENWEATHER_API_KEY=your-openweather-key

# Payment Gateway (when implemented)
RAZORPAY_KEY_ID=your-razorpay-key
RAZORPAY_SECRET=your-razorpay-secret
```

### Setting Environment Variables

**Vercel:**
```bash
vercel env add NEXT_PUBLIC_API_URL
# Enter value when prompted
```

**Netlify:**
```bash
netlify env:set NEXT_PUBLIC_API_URL "https://your-app.netlify.app"
```

---

## 🧪 Pre-Production Testing

### 1. Build Test
```bash
npm run build
```
Should complete without errors.

### 2. Production Server Test
```bash
npm run build
npm start
```
Test at `http://localhost:3000`

### 3. Type Check
```bash
npm run type-check
```

### 4. Lint Check
```bash
npm run lint
```

---

## 📊 Post-Deployment Monitoring

### 1. Vercel Analytics (Built-in)
- Automatic performance monitoring
- Real user metrics
- Error tracking

### 2. Google Analytics (Optional)

Add to `app/layout.tsx`:
```tsx
import Script from 'next/script'

// In <head>
<Script
  src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"
  strategy="afterInteractive"
/>
<Script id="google-analytics" strategy="afterInteractive">
  {`
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-XXXXXXXXXX');
  `}
</Script>
```

### 3. Error Monitoring with Sentry

```bash
npm install @sentry/nextjs
```

Initialize Sentry:
```bash
npx @sentry/wizard@latest -i nextjs
```

---

## 🔄 Continuous Deployment (CD)

### GitHub Actions Workflow

Create `.github/workflows/deploy.yml`:
```yaml
name: Deploy to Vercel

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          
      - name: Install dependencies
        run: npm install
        
      - name: Run tests
        run: npm run lint
        
      - name: Build
        run: npm run build
        
      - name: Deploy to Vercel
        uses: amondnet/vercel-action@v20
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
          vercel-args: '--prod'
```

---

## 🌍 CDN & Performance Optimization

### 1. Image Optimization
Next.js automatically optimizes images. Ensure you use:
```tsx
import Image from 'next/image'

<Image 
  src="/path/to/image.jpg"
  alt="Description"
  width={500}
  height={300}
  priority // for above-the-fold images
/>
```

### 2. Edge Functions
Vercel automatically deploys API routes as Edge Functions for optimal performance.

### 3. Caching Strategy
Add cache headers in API routes:
```typescript
export async function GET() {
  return NextResponse.json(data, {
    headers: {
      'Cache-Control': 'public, s-maxage=60, stale-while-revalidate=30'
    }
  })
}
```

---

## 🔒 Security Best Practices

### 1. Environment Variables
- ✅ Never commit `.env.local` to Git
- ✅ Use different secrets for production
- ✅ Rotate API keys regularly

### 2. CORS Configuration
Add to API routes if needed:
```typescript
const headers = {
  'Access-Control-Allow-Origin': 'https://your-domain.com',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type',
}
```

### 3. Rate Limiting
Implement in API routes:
```typescript
import { Ratelimit } from '@upstash/ratelimit'
import { Redis } from '@upstash/redis'

const ratelimit = new Ratelimit({
  redis: Redis.fromEnv(),
  limiter: Ratelimit.slidingWindow(10, '10 s'),
})
```

---

## 📱 Progressive Web App (PWA)

### Add PWA Support

1. Install next-pwa:
```bash
npm install next-pwa
```

2. Update `next.config.ts`:
```typescript
const withPWA = require('next-pwa')({
  dest: 'public',
  register: true,
  skipWaiting: true,
})

module.exports = withPWA({
  // your next config
})
```

3. Create `public/manifest.json`:
```json
{
  "name": "Smart Crop Technologies",
  "short_name": "SmartCrop",
  "description": "Precision farming for every farmer",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#ffffff",
  "theme_color": "#4CAF50",
  "icons": [
    {
      "src": "/icon-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/icon-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

---

## 🐛 Troubleshooting

### Build Fails
```bash
# Clear cache and rebuild
rm -rf .next
npm run build
```

### TypeScript Errors
```bash
# Check types
npm run type-check

# Fix auto-fixable issues
npm run lint -- --fix
```

### Environment Variables Not Working
- Check variable names start with `NEXT_PUBLIC_` for client-side access
- Redeploy after adding new variables
- Clear browser cache

### 502 Bad Gateway
- Check API routes for errors
- Verify serverless function timeout limits
- Review logs in deployment platform

---

## 📈 Scaling Considerations

### Database
When traffic grows, implement:
- PostgreSQL with connection pooling
- Supabase for managed database
- Redis for caching

### Image Storage
- Move to AWS S3 or Supabase Storage
- Implement CDN (CloudFront/Cloudflare)

### API Rate Limiting
- Implement Redis-based rate limiting
- Use API gateway (AWS API Gateway/Kong)

### Monitoring
- Set up Datadog/New Relic
- Configure alerts for downtime
- Monitor API response times

---

## 🎉 Production Launch Checklist

- [ ] Custom domain configured
- [ ] SSL certificate active (auto with Vercel)
- [ ] All environment variables set
- [ ] Google Analytics installed
- [ ] Error monitoring active (Sentry)
- [ ] Performance monitoring active
- [ ] Backup strategy in place
- [ ] CDN configured
- [ ] SEO metadata optimized
- [ ] Social media cards configured
- [ ] 404 and error pages tested
- [ ] Mobile responsiveness verified
- [ ] Cross-browser testing completed
- [ ] Load testing performed
- [ ] Security audit completed

---

## 📞 Support

For deployment issues:
- Check Vercel docs: https://vercel.com/docs
- Next.js deployment: https://nextjs.org/docs/deployment
- Community: https://github.com/vercel/next.js/discussions

---

**Ready to go live! 🚀**
