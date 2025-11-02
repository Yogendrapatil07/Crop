# 🚀 Netlify Deployment Guide - Smart Crop Technologies

Complete guide to deploy your Smart Crop Technologies platform on Netlify.

---

## 🎯 Quick Deploy (2 Minutes)

### Option 1: One-Click Deploy Button

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/yourusername/smart-crop-tech)

---

## 📋 Prerequisites

Before deploying to Netlify:
- ✅ GitHub/GitLab/Bitbucket account
- ✅ Netlify account (free tier works)
- ✅ Code pushed to Git repository
- ✅ Node.js 18+ installed locally

---

## 🔧 Method 1: Deploy via Netlify Dashboard

### Step 1: Push Code to GitHub

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Ready for Netlify deployment"

# Create GitHub repo and push
git remote add origin https://github.com/yourusername/smart-crop-tech.git
git branch -M main
git push -u origin main
```

### Step 2: Connect to Netlify

1. Go to [app.netlify.com](https://app.netlify.com)
2. Click **"Add new site"** → **"Import an existing project"**
3. Choose your Git provider (GitHub/GitLab/Bitbucket)
4. Authorize Netlify to access your repositories
5. Select `smart-crop-tech` repository

### Step 3: Configure Build Settings

Netlify should auto-detect Next.js, but verify these settings:

**Build Settings:**
- **Base directory**: (leave empty)
- **Build command**: `npm run build`
- **Publish directory**: `.next`
- **Functions directory**: (auto-detected)

**Build Environment Variables:**
- `NEXT_PUBLIC_API_URL`: `https://your-site.netlify.app`
- `NODE_VERSION`: `18`

Click **"Deploy site"**

### Step 4: Wait for Deployment

- ⏳ Build takes 2-3 minutes
- ✅ Site will be live at `https://random-name-123.netlify.app`
- 🎉 Done!

---

## 🖥️ Method 2: Deploy via Netlify CLI

### Step 1: Install Netlify CLI

```bash
npm install -g netlify-cli
```

### Step 2: Login

```bash
netlify login
```

Your browser will open for authentication.

### Step 3: Initialize Site

```bash
# In your project directory
cd smart-crop-tech

# Initialize
netlify init
```

Follow the prompts:
- **Create & configure a new site**: Yes
- **Team**: Select your team
- **Site name**: `smart-crop-tech` (or custom name)
- **Build command**: `npm run build`
- **Publish directory**: `.next`

### Step 4: Deploy

```bash
# Deploy to draft URL (for testing)
netlify deploy

# Deploy to production
netlify deploy --prod
```

---

## 🔐 Environment Variables

### Required Variables

Add these in Netlify Dashboard → Site settings → Environment variables:

```env
# API Configuration
NEXT_PUBLIC_API_URL=https://your-site.netlify.app

# Future integrations (when implemented)
DATABASE_URL=your_database_url
SUPABASE_URL=your_supabase_url
SUPABASE_KEY=your_supabase_key
TWILIO_ACCOUNT_SID=your_twilio_sid
TWILIO_AUTH_TOKEN=your_twilio_token
```

### Add via Dashboard:
1. Go to **Site settings** → **Environment variables**
2. Click **"Add a variable"**
3. Enter key and value
4. Click **"Save"**

### Add via CLI:
```bash
netlify env:set NEXT_PUBLIC_API_URL "https://your-site.netlify.app"
```

---

## 🌐 Custom Domain Setup

### Step 1: Add Domain

1. Go to **Site settings** → **Domain management**
2. Click **"Add custom domain"**
3. Enter your domain: `smartcroptech.com`
4. Click **"Verify"**

### Step 2: Update DNS

Netlify will provide DNS records. Add these to your domain registrar:

**Option A: Use Netlify DNS (Recommended)**
- Change nameservers to Netlify's
- Netlify handles everything automatically

**Option B: External DNS**
- Add A record: `104.198.14.52`
- Add CNAME record: `www` → `your-site.netlify.app`

### Step 3: Enable HTTPS

- ✅ Netlify auto-provisions SSL certificate
- ✅ HTTPS enforced automatically
- ✅ Certificate renews automatically

---

## 📦 Netlify Configuration Files

### netlify.toml (✅ Already Created)

Located at root: `netlify.toml`

Key settings:
```toml
[build]
  command = "npm run build"
  publish = ".next"
  
[[plugins]]
  package = "@netlify/plugin-nextjs"
```

### _redirects (✅ Already Created)

Located at: `public/_redirects`

Handles client-side routing:
```
/api/*  /.netlify/functions/:splat  200
/*      /index.html                  200
```

---

## 🔌 Install Netlify Next.js Plugin

The plugin is configured but needs to be installed:

### Automatic Installation (Recommended)

Netlify will automatically install `@netlify/plugin-nextjs` during first deploy.

### Manual Installation

```bash
npm install -D @netlify/plugin-nextjs
```

Then commit and push:
```bash
git add package.json package-lock.json
git commit -m "Add Netlify Next.js plugin"
git push
```

---

## ⚡ Performance Optimization

### 1. Enable Netlify CDN

✅ Automatically enabled - global edge network

### 2. Configure Cache Headers

Already set in `netlify.toml`:
- Static assets: 1 year cache
- Images: 1 week cache

### 3. Enable Asset Optimization

In Netlify Dashboard → **Site settings** → **Build & deploy** → **Post processing**:
- ✅ Enable **Bundle CSS**
- ✅ Enable **Minify CSS**
- ✅ Enable **Minify JS**
- ✅ Enable **Compress images**

### 4. Enable Branch Deploys

For preview deployments on PRs:
- Go to **Site settings** → **Build & deploy** → **Continuous deployment**
- Enable **Deploy previews**

---

## 🔄 Continuous Deployment

### Auto-Deploy on Push

✅ Enabled by default once connected to Git

Every push to `main` branch:
1. Triggers new build
2. Runs tests (if configured)
3. Deploys to production
4. Updates live site

### Deploy Previews

Every pull request:
1. Creates preview deployment
2. Generates unique URL
3. Allows testing before merge
4. Auto-deploys when PR is merged

---

## 🧪 Testing Before Production

### Deploy to Draft URL

```bash
netlify deploy
```

This creates a draft URL like:
`https://6479abc123--your-site.netlify.app`

Test everything, then deploy to production:
```bash
netlify deploy --prod
```

### Test Checklist

- [ ] Homepage loads correctly
- [ ] All navigation links work
- [ ] Dashboard functionality works
- [ ] API endpoints respond
- [ ] Language toggle functions
- [ ] Forms submit correctly
- [ ] Images load properly
- [ ] Mobile responsive
- [ ] HTTPS working

---

## 📊 Monitor Deployments

### View Build Logs

1. Go to **Deploys** tab
2. Click on latest deploy
3. View **Deploy log**

### Check Site Status

```bash
netlify status
```

### View Site Info

```bash
netlify sites:list
```

---

## 🐛 Troubleshooting

### Build Fails

**Check Node.js Version:**
```toml
# In netlify.toml
[build.environment]
  NODE_VERSION = "18"
```

**Clear Cache and Rebuild:**
1. Go to **Deploys** → **Trigger deploy**
2. Select **"Clear cache and deploy site"**

### 404 Errors on Routes

**Solution:** Ensure `_redirects` file exists in `public/` folder.

### API Routes Not Working

**Check netlify.toml:**
```toml
[[redirects]]
  from = "/api/*"
  to = "/.netlify/functions/:splat"
  status = 200
```

### Environment Variables Not Available

**Verify:**
1. Variables start with `NEXT_PUBLIC_` for client-side
2. Variables are set in Netlify dashboard
3. Redeploy after adding new variables

### Image Optimization Issues

**Install Sharp:**
```bash
npm install sharp
```

Add to `netlify.toml`:
```toml
[functions]
  external_node_modules = ["sharp"]
```

---

## 📈 Netlify Features to Enable

### 1. Forms (Contact Page)

In your contact form, add:
```html
<form netlify>
  <!-- form fields -->
</form>
```

Enable in Netlify Dashboard → **Forms**

### 2. Functions (Serverless)

For additional serverless functions:
```bash
netlify functions:create
```

### 3. Identity (Authentication)

Enable user authentication:
- Go to **Site settings** → **Identity**
- Click **"Enable Identity"**

### 4. Analytics

Premium feature for visitor insights:
- **Site settings** → **Analytics**
- Enable for $9/month

---

## 💰 Netlify Pricing

### Free Tier (Sufficient for MVP)
- ✅ 100GB bandwidth/month
- ✅ 300 build minutes/month
- ✅ Unlimited sites
- ✅ HTTPS included
- ✅ Continuous deployment
- ✅ Deploy previews

### Pro Tier ($19/month)
- 400GB bandwidth
- 1000 build minutes
- Background functions
- Password protection
- Analytics

---

## 🔒 Security Best Practices

### 1. Protect API Routes

Add authentication headers:
```typescript
// In API routes
const authHeader = request.headers.get('authorization');
if (!authHeader) {
  return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
}
```

### 2. Rate Limiting

Use Netlify Edge Functions for rate limiting.

### 3. Environment Variables

- ✅ Never commit `.env` files
- ✅ Use Netlify environment variables
- ✅ Rotate secrets regularly

---

## 📱 Post-Deployment Checklist

- [ ] Site loads at custom domain
- [ ] HTTPS working (green lock icon)
- [ ] All pages accessible
- [ ] API routes responding
- [ ] Forms working
- [ ] Images optimized
- [ ] Mobile responsive
- [ ] Performance score 90+
- [ ] SEO tags present
- [ ] Analytics configured

---

## 🆘 Support Resources

### Documentation
- [Netlify Docs](https://docs.netlify.com)
- [Next.js on Netlify](https://docs.netlify.com/frameworks/next-js/)
- [Netlify CLI Docs](https://cli.netlify.com)

### Community
- [Netlify Community](https://answers.netlify.com)
- [Netlify Discord](https://discord.gg/netlify)
- [Netlify Twitter](https://twitter.com/netlify)

### Get Help
```bash
netlify help
netlify help deploy
```

---

## 🎯 Deployment Commands Reference

```bash
# Login
netlify login

# Initialize new site
netlify init

# Deploy to draft
netlify deploy

# Deploy to production
netlify deploy --prod

# Open site
netlify open

# Open admin dashboard
netlify open:admin

# View logs
netlify logs

# Check status
netlify status

# List sites
netlify sites:list

# Link to existing site
netlify link

# Environment variables
netlify env:list
netlify env:set KEY value
netlify env:get KEY
netlify env:unset KEY
```

---

## ✅ Success!

Your Smart Crop Technologies platform is now deployed on Netlify! 🎉

**Live URLs:**
- Production: `https://smart-crop-tech.netlify.app`
- Custom Domain: `https://smartcroptech.com` (if configured)
- Admin: `https://app.netlify.com/sites/smart-crop-tech`

---

## 📈 Next Steps

1. ✅ Test all features in production
2. ✅ Set up custom domain
3. ✅ Configure analytics
4. ⏳ Add real database (Supabase)
5. ⏳ Enable user authentication
6. ⏳ Integrate payment gateway
7. ⏳ Set up monitoring alerts

---

**Need help?** Check `DEPLOYMENT.md` for multi-platform deployment or `TROUBLESHOOTING.md` for common issues.

**Made with ❤️ for Indian Farmers**
