import { defineConfig } from 'astro/config';

// 部署域名：本地/预览无需配置；Cloudflare Pages 上可在项目环境变量里设置 SITE_URL
const site = process.env.SITE_URL || 'https://school-mate.pages.dev';

export default defineConfig({
  site,
  build: {
    // 生成 /index.html 便于静态托管
    format: 'directory',
  },
  server: { port: 4321 },
});
