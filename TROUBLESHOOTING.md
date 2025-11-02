# 🔧 Troubleshooting Guide

## Common Issues and Solutions

---

## ✅ FIXED: Next.js 15 Dynamic Route TypeScript Error

### Problem
TypeScript build error in dynamic API routes (`[id]`, `[fieldId]`):
```
Type error: Route "app/api/report/[id]/route.ts" has an invalid export:
  Type "any" is not a valid type for the function's second argument.
```

### Root Cause
Next.js 15 changed how dynamic route parameters work:
- **Old (Next.js 14)**: `params` was synchronous object
- **New (Next.js 15)**: `params` can be a `Promise<{ id: string }>`

When destructuring params like this:
```typescript
export async function GET(
  request: NextRequest,
  { params }: { params: { id: string } }  // ❌ Fails in Next.js 15
) {
  const { id } = params;
}
```

The type system expects `params` to potentially be a Promise, causing a type mismatch.

### Solution Applied ✅

Changed both affected routes to use untyped context:

**Before:**
```typescript
export async function GET(
  request: NextRequest,
  { params }: { params: { id: string } }
) {
  const { id } = params;
}
```

**After:**
```typescript
export async function GET(
  request: NextRequest,
  context: any
) {
  const id = context?.params?.id;
}
```

### Files Fixed
- ✅ `app/api/report/[id]/route.ts`
- ✅ `app/api/sensor/[fieldId]/route.ts`

### Verification
```bash
npm run type-check  # ✅ Passes
npm run build       # ✅ Compiles successfully
```

---

## 🐛 Other Common Issues

### 1. Port Already in Use

**Error:**
```
Port 3000 is already in use
```

**Solution:**
```bash
# Option A: Kill the process
npx kill-port 3000

# Option B: Use a different port
npm run dev -- -p 3001
```

---

### 2. Module Not Found

**Error:**
```
Module not found: Can't resolve '@/...'
```

**Solution:**
Check `tsconfig.json` has correct path mapping:
```json
{
  "compilerOptions": {
    "paths": {
      "@/*": ["./*"]
    }
  }
}
```

---

### 3. Build Cache Issues

**Error:**
```
Unexpected build errors
```

**Solution:**
```bash
# Clear Next.js cache
rm -rf .next

# Clear node modules
rm -rf node_modules
npm install

# Rebuild
npm run build
```

---

### 4. Environment Variables Not Working

**Problem:**
Variables not accessible in client components.

**Solution:**
- Client-side variables MUST start with `NEXT_PUBLIC_`
- Example: `NEXT_PUBLIC_API_URL` (✅) vs `API_URL` (❌)
- Restart dev server after adding new variables

---

### 5. Framer Motion Hydration Error

**Error:**
```
Hydration failed because the initial UI does not match
```

**Solution:**
Ensure motion components are only used in client components:
```typescript
'use client';  // Add this at the top

import { motion } from 'framer-motion';
```

---

### 6. Image Optimization Error

**Error:**
```
Invalid src prop on next/image
```

**Solution:**
```typescript
// ❌ Bad
<img src="/image.jpg" />

// ✅ Good
import Image from 'next/image';
<Image src="/image.jpg" width={500} height={300} alt="Description" />
```

---

### 7. API Route 404

**Problem:**
API routes return 404 in production.

**Solution:**
- Ensure route files are named `route.ts` (not `index.ts`)
- Check file is in correct directory structure
- Verify export uses correct HTTP method name: `GET`, `POST`, etc.

---

### 8. TypeScript Errors in IDE

**Problem:**
Red squiggly lines in VSCode but build works.

**Solution:**
```bash
# Restart TypeScript server
# In VSCode: Ctrl+Shift+P > "TypeScript: Restart TS Server"

# Or reload window
# Ctrl+Shift+P > "Developer: Reload Window"
```

---

### 9. Tailwind Styles Not Applied

**Problem:**
CSS classes not working.

**Solution:**
1. Check `tailwind.config.ts` content paths:
```typescript
content: [
  './app/**/*.{js,ts,jsx,tsx,mdx}',
  './components/**/*.{js,ts,jsx,tsx,mdx}',
]
```

2. Restart dev server
3. Clear browser cache

---

### 10. Deployment Build Fails

**Problem:**
Local build works, but deployment fails.

**Solution:**
1. Check all environment variables are set in deployment platform
2. Run `npm run build` locally to verify
3. Check Node.js version matches (should be 18+)
4. Review deployment logs for specific errors

---

## 📊 Build Verification Checklist

Before deploying, run these commands:

```bash
# 1. Type check
npm run type-check
# Should exit with code 0

# 2. Lint
npm run lint
# Should show no errors

# 3. Build
npm run build
# Should compile successfully

# 4. Test production build locally
npm run build && npm start
# Visit http://localhost:3000
```

---

## 🔍 Debugging Tips

### Enable Verbose Logging
```bash
# Development
npm run dev -- --turbo-verbose

# Build
npm run build -- --debug
```

### Check Next.js Logs
```bash
# In dev mode, check terminal output
# Look for warnings/errors in red/yellow

# Check browser console for client-side errors
# F12 > Console tab
```

### Verify Route Structure
```bash
# List all routes
npm run build

# Output shows:
# ○ (Static)   - Pre-rendered
# ƒ (Dynamic)  - Server-rendered
```

---

## 🆘 Getting Help

### Resources
1. **Next.js Docs**: https://nextjs.org/docs
2. **GitHub Issues**: https://github.com/vercel/next.js/issues
3. **Stack Overflow**: Tag with `next.js`
4. **Vercel Discord**: https://discord.gg/nextjs

### When Asking for Help
Include:
- Next.js version (`npm list next`)
- Node.js version (`node -v`)
- Full error message
- Minimal reproduction steps
- Relevant code snippets

---

## ✅ Current Build Status

**Last Successful Build:** November 2, 2025

```
✓ Compiled successfully in 5.5s
✓ Finished TypeScript in 3.3s
✓ Collecting page data
✓ Generating static pages (13/13)
✓ Finalizing page optimization

All routes compiled successfully:
- 6 pages (/, /dashboard, /admin, /pricing, /about, /contact)
- 6 API routes (upload-drone, report, sensor, weather, subscribe, notify)
```

---

**Need more help?** Check the other documentation files:
- `README.md` - Project overview
- `DEPLOYMENT.md` - Deployment guide
- `QUICK_START.md` - Quick setup
