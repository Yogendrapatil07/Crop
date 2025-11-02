# ⚡ Quick Start Guide

Get Smart Crop Technologies running in 5 minutes!

---

## 🏃‍♂️ Local Development

### 1. Install Dependencies
```bash
cd smart-crop-tech
npm install
```

### 2. Run Development Server
```bash
npm run dev
```

### 3. Open Browser
Navigate to: **http://localhost:3000**

That's it! The app is now running locally.

---

## 🌐 Deploy to Vercel (Fastest)

### Option A: One-Click Deploy

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/yourusername/smart-crop-tech)

### Option B: Manual Deploy

1. **Push to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/yourusername/smart-crop-tech.git
   git push -u origin main
   ```

2. **Import to Vercel**
   - Go to [vercel.com](https://vercel.com)
   - Click "Add New Project"
   - Import your GitHub repo
   - Click "Deploy"

3. **Done!** Your app is live in 2-3 minutes at `https://your-app.vercel.app`

---

## 🧪 Test All Features

Once deployed, test these pages:

- **Landing Page**: `/` - Hero, features, testimonials
- **Dashboard**: `/dashboard` - Upload drone images, view reports
- **Admin Portal**: `/admin` - Analytics, farmer management
- **Pricing**: `/pricing` - Subscription plans
- **About**: `/about` - Company info
- **Contact**: `/contact` - Contact form

---

## 🔑 Environment Variables (Optional)

For production, add these in Vercel dashboard:

```
NEXT_PUBLIC_API_URL=https://your-app.vercel.app
```

More variables needed when integrating real services:
- Database: `DATABASE_URL`, `SUPABASE_URL`, `SUPABASE_KEY`
- SMS: `TWILIO_ACCOUNT_SID`, `TWILIO_AUTH_TOKEN`
- Storage: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`

---

## 📱 Key Features to Try

### Farmer Dashboard
1. Go to `/dashboard`
2. Click "Upload Drone Image"
3. Select any image file
4. Click "Upload & Analyze"
5. See mock AI analysis with NDVI, detections, recommendations
6. Try "Send via WhatsApp" button on recommendations

### Language Toggle
1. Click language button in navbar (EN ↔ हिं)
2. See entire UI translate to Hindi
3. Toggle back to English

### Admin Portal
1. Go to `/admin`
2. View analytics dashboard
3. See registered farmers
4. Review pending reports

---

## 🎨 Customization

### Change Colors
Edit `tailwind.config.ts`:
```typescript
theme: {
  extend: {
    colors: {
      primary: '#your-color',
      secondary: '#your-color',
    }
  }
}
```

### Add More Languages
1. Edit `lib/translations.ts`
2. Add new language object
3. Update `Language` type

### Modify API Responses
Edit mock generators in `lib/mockData.ts`

---

## 🐛 Common Issues

### Port Already in Use
```bash
# Kill process on port 3000
npx kill-port 3000

# Or use different port
npm run dev -- -p 3001
```

### Build Errors
```bash
# Clear cache
rm -rf .next node_modules
npm install
npm run build
```

### TypeScript Errors
```bash
# Check what's wrong
npx tsc --noEmit

# Auto-fix ESLint issues
npm run lint -- --fix
```

---

## 📚 Next Steps

1. ✅ Deploy to Vercel/Netlify
2. ✅ Add custom domain
3. ⏳ Integrate real database (PostgreSQL/Supabase)
4. ⏳ Add authentication (NextAuth.js/Supabase Auth)
5. ⏳ Integrate real AI model (TensorFlow.js)
6. ⏳ Connect IoT devices (MQTT)
7. ⏳ Add payment gateway (Razorpay/Stripe)
8. ⏳ Implement real SMS/WhatsApp (Twilio)

---

## 🎉 You're Ready!

Your Smart Crop Technologies platform is now running!

**Local**: http://localhost:3000  
**Production**: https://your-app.vercel.app

Need help? Check `DEPLOYMENT.md` for detailed deployment guide.
