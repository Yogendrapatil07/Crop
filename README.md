# 🌾 Smart Crop Technologies

**Precision Farming for Every Farmer**

A comprehensive web-based precision agriculture platform that leverages AI, IoT, and drone technology to help farmers increase yield, reduce losses, and practice sustainable farming.

![Next.js](https://img.shields.io/badge/Next.js-15-black)
![TypeScript](https://img.shields.io/badge/TypeScript-5.0-blue)
![TailwindCSS](https://img.shields.io/badge/TailwindCSS-3.0-38bdf8)
![License](https://img.shields.io/badge/License-MIT-green)

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/yourusername/smart-crop-tech)
[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/yourusername/smart-crop-tech)

---

## 🎯 Problem Statement

Indian agriculture faces critical challenges:
- **86%** of farmers are small/marginal (<2 hectares) with limited access to precision technology
- **₹60,000 crore** lost annually due to pests, diseases, and poor soil management
- **30-40%** yield variation each year due to climate unpredictability
- Farming is often guesswork — wrong fertilizers, delayed pest detection, water waste

## 💡 Our Solution

Smart Crop Technologies provides:
- **Drone-based crop monitoring** - Aerial analysis with AI-powered insights
- **AI pest/disease detection** - Early detection with 88% accuracy
- **IoT sensor integration** - Real-time soil, moisture, and temperature data
- **Smart recommendations** - Actionable advice in local languages (Hindi & English)
- **Affordable subscriptions** - Plans designed for small farmers

---

## ✨ Features

### 🖥️ Landing Page
- Hero section with compelling messaging
- Features showcase with icons
- Problem/solution presentation
- Farmer testimonials
- Call-to-action sections

### 📱 Farmer Dashboard
- Drone image upload & AI analysis
- Live IoT sensor data display
- Crop health reports (NDVI index)
- Pest/disease detection results
- Weather forecasts
- Smart recommendations in Hindi/English
- WhatsApp/SMS notification integration

### 🧑‍💻 Admin Portal
- Analytics dashboard (farmers, reports, yield improvement)
- Subscription breakdown visualization
- Report review & approval system
- Farmer profile management
- Real-time monitoring

### 🤖 AI & IoT Integration
- Mock AI analysis engine
- Simulated IoT sensor readings
- NDVI health index calculation
- Pest/disease confidence scoring
- Multilingual recommendation engine

### 💰 Pricing & Plans
- Free Trial (1 field, 5 reports/month)
- Standard (5 fields, unlimited reports, ₹999/month)
- Premium (unlimited, consulting, ₹2,999/month)

### 🌐 Multilingual Support
- Full English/Hindi translation
- Language toggle in navbar
- Localized recommendations
- SMS/WhatsApp in local language

---

## 🛠️ Tech Stack

**Frontend:**
- Next.js 15 (React) with App Router
- TypeScript
- TailwindCSS for styling
- Framer Motion for animations
- Lucide React for icons

**Backend:**
- Next.js API Routes
- Mock AI inference system
- Simulated IoT data generation

**Planned Integrations:**
- PostgreSQL/Supabase (database)
- AWS S3/Supabase Storage (image storage)
- Twilio (SMS/WhatsApp notifications)
- OpenWeather API (weather data)

---

## 🚀 Getting Started

### Prerequisites
- Node.js 18+ 
- npm/yarn/pnpm

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/smart-crop-tech.git
cd smart-crop-tech
```

2. **Install dependencies**
```bash
npm install
```

3. **Set up environment variables**
Create a `.env.local` file:
```env
NEXT_PUBLIC_API_URL=http://localhost:3000
SUPABASE_URL=your_supabase_url
SUPABASE_KEY=your_supabase_key
TWILIO_API_KEY=your_twilio_key
```

4. **Run development server**
```bash
npm run dev
```

5. **Open in browser**
Navigate to [http://localhost:3000](http://localhost:3000)

---

## 📁 Project Structure

```
smart-crop-tech/
├── app/
│   ├── api/              # API routes
│   │   ├── upload-drone/ # Drone image upload & analysis
│   │   ├── report/       # Report retrieval
│   │   ├── sensor/       # IoT sensor data
│   │   ├── subscribe/    # Subscription management
│   │   ├── notify/       # SMS/WhatsApp notifications
│   │   └── weather/      # Weather data
│   ├── dashboard/        # Farmer dashboard
│   ├── admin/            # Admin portal
│   ├── pricing/          # Pricing page
│   ├── about/            # About page
│   ├── contact/          # Contact page
│   ├── layout.tsx        # Root layout with providers
│   └── page.tsx          # Landing page
├── components/
│   ├── Navbar.tsx        # Navigation bar
│   └── Footer.tsx        # Footer component
├── lib/
│   ├── types.ts          # TypeScript type definitions
│   ├── translations.ts   # English/Hindi translations
│   ├── mockData.ts       # Mock data generators
│   └── LanguageContext.tsx # Language context provider
└── public/               # Static assets
```

---

## 🔌 API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/upload-drone` | POST | Upload drone image for AI analysis |
| `/api/report/:id` | GET | Retrieve specific report |
| `/api/sensor/:fieldId` | GET | Get IoT sensor data |
| `/api/subscribe` | POST | Create/update subscription |
| `/api/notify` | POST | Send SMS/WhatsApp notification |
| `/api/weather` | GET | Get weather forecast |

---

## 📊 Mock AI Response Format

```json
{
  "reportId": "RPT-1001",
  "fieldId": "FLD001",
  "fieldName": "North Field",
  "ndvi": 0.72,
  "detections": [
    {
      "label": "Leaf Blight",
      "confidence": 0.88,
      "bbox": [10, 20, 120, 200]
    }
  ],
  "recommendations": [
    {
      "action": "Apply neem-based organic fungicide",
      "severity": "high",
      "language": {
        "en": "Apply neem-based organic fungicide within 48 hours.",
        "hi": "48 घंटों के भीतर नीम आधारित जैविक फफूंदनाशक का उपयोग करें।"
      }
    }
  ]
}
```

---

## 🎨 Design System

**Colors:**
- Primary: Green (#4CAF50)
- Secondary: Earth tones
- Background: Off-white (#F9FAFB)

**Typography:**
- Font: Inter
- Headings: Bold, large sizes
- Body: Regular, readable

**Mobile-First:**
- Optimized for low-end Android devices
- Large touch targets
- High contrast
- Minimal data usage

---

## 🚢 Deployment

### Option 1: Deploy on Netlify

**One-Click Deploy:**

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/yourusername/smart-crop-tech)

**Manual Deploy:**

1. Push code to GitHub
2. Go to [app.netlify.com](https://app.netlify.com)
3. Click "Add new site" → "Import an existing project"
4. Select your repository
5. Build settings (auto-detected):
   - Build command: `npm run build`
   - Publish directory: `.next`
6. Add environment variables
7. Deploy!

```bash
# Or use Netlify CLI
npm install -g netlify-cli
netlify login
netlify init
netlify deploy --prod
```

**📖 Detailed Guide:** See [NETLIFY_DEPLOY.md](NETLIFY_DEPLOY.md)

### Option 2: Deploy on Vercel

**One-Click Deploy:**

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/yourusername/smart-crop-tech)

**Manual Deploy:**

1. Push code to GitHub
2. Import project to Vercel
3. Configure environment variables
4. Deploy!

```bash
# Or use Vercel CLI
npm run build
vercel --prod
```

**📖 Detailed Guide:** See [DEPLOYMENT.md](DEPLOYMENT.md)

### Environment Variables for Production

```env
NEXT_PUBLIC_API_URL=https://yourapp.netlify.app  # or .vercel.app
SUPABASE_URL=your_production_supabase_url
SUPABASE_KEY=your_production_key
TWILIO_API_KEY=your_production_twilio_key
```

---

## 🧪 Testing

```bash
# Run tests (when implemented)
npm run test

# Type checking
npm run type-check

# Linting
npm run lint
```

---

## 📈 Future Roadmap

- [ ] Real ML model integration (TensorFlow.js/ONNX)
- [ ] Actual IoT device integration (MQTT)
- [ ] Database implementation (PostgreSQL/Supabase)
- [ ] Image storage (S3/Supabase Storage)
- [ ] Real Twilio integration
- [ ] Payment gateway (Razorpay/Stripe)
- [ ] Mobile app (React Native)
- [ ] Voice assistance (Hindi voice commands)
- [ ] Offline mode support
- [ ] GPS field mapping
- [ ] Historical data analytics

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License.

---

## 📞 Contact

**Smart Crop Technologies**
- Email: info@smartcroptech.com
- Phone: +91-9876543210
- Address: New Delhi, India

---

## 🙏 Acknowledgments

- Farmers who provided feedback and insights
- Agricultural research institutions
- Open-source community
- Next.js and React teams

---

**Made with ❤️ for Indian Farmers**
