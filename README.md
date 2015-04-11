Go [here](http://adampash.com/related-widget/build/) and enter links you'd like to share.

# Development
```bash
gulp
```

### Before deploying
```bash
gulp production
```

**When deploying to CloudFront:**
1. Replace files
2. Change permissions
3. Invalidate cache

**Invalidations:**
```
/related-widget/index.html
/related-widget/index.html?*
/related-widget/global.js
/related-widget/app.css
```
