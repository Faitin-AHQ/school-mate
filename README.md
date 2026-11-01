# School Mate · 校园搭子

大学生轻交易 · 分享平台官网。用校园社交的信任做底座，叠加轻量交易、二手流转与技能分享。

纯静态 Astro 站点，零框架运行时依赖，可直接部署到 Cloudflare Pages。

## 技术栈

| 项 | 说明 |
|---|---|
| 框架 | Astro 4（静态输出） |
| 样式 | 原生 CSS（设计令牌 + 组件 scoped style） |
| 交互 | 原生 JavaScript（无 Vue/React 运行时） |
| 动效 | Canvas 粒子系统、IntersectionObserver 进场、磁吸按钮、自定义光标、指针视差 |
| 字体 | ZCOOL KuaiLe / Baloo 2（Google Fonts） |

## 本地开发

```bash
npm install
npm run dev      # http://localhost:4321
npm run build    # 产物输出到 dist/
npm run preview  # 预览构建产物
```

要求 Node.js ≥ 18.14.1（推荐 20，见 `.nvmrc`）。

## 目录结构

```
src/
├── pages/
│   ├── index.astro        # 首页，组合 12 个区块
│   └── 404.astro          # 自定义 404
├── layouts/
│   └── Layout.astro       # 全局布局：SEO meta、导航/表单/动效脚本
├── components/
│   ├── Hero.astro         # 首屏（粒子背景 + 打字机 + 3D 手机）
│   ├── About.astro        # 项目定位 + 关键词跑马灯
│   ├── Features.astro     # 功能矩阵（Bento 网格 + 微可视化）
│   ├── Platforms.astro    # 四端 Tab 切换
│   ├── Advantages.astro   # 核心优势卡片
│   ├── Numbers.astro      # 数据墙（深色横幅 + 数字滚动）
│   ├── Compare.astro      # 竞品对比表
│   ├── Scenes.astro       # 使用场景
│   ├── Roadmap.astro      # 发展路线时间轴
│   ├── Voices.astro       # 用户声音
│   ├── Faq.astro          # 常见问题
│   ├── Join.astro         # 内测表单 CTA
│   ├── Footer.astro       # 页脚（站点地图 + 二维码）
│   ├── Nav.astro          # 顶部导航
│   ├── GlobalUI.astro     # 噪点层 / 进度条 / 回到顶部 / Toast
│   ├── Particles.astro    # 可复用 Canvas 粒子组件
│   └── Cursor.astro       # 自定义光标
└── styles/global.css      # 设计令牌 + 基础层
```

## 部署到 Cloudflare Pages

### 方式一：Git 自动部署（推荐）

1. 将仓库推送到 GitHub。
2. 打开 Cloudflare Dashboard → **Workers & Pages** → **Create** → **Pages** → **Connect to Git**，授权并选择该仓库。
3. 构建设置：

   | 配置项 | 值 |
   |---|---|
   | Framework preset | Astro |
   | Build command | `npm run build` |
   | Build output directory | `dist` |
   | Node version（环境变量 `NODE_VERSION`） | `20` |

4. 可选环境变量 `SITE_URL`：填正式域名（如 `https://school-mate.pages.dev`），用于生成规范的站点元信息。
5. 保存并部署。之后每次 `git push` 到主分支都会自动重新部署，其他分支自动生成预览环境。

### 方式二：Wrangler CLI 直接上传

```bash
npx wrangler login
npm run deploy
# 等价于 npm run build && npx wrangler pages deploy dist --project-name school-mate
```

`wrangler.toml` 已声明 `pages_build_output_dir = "dist"`，也支持直接执行 `npx wrangler pages deploy` 交互式上传。

### 部署后可选

- 绑定自定义域名：Pages 项目 → **Custom domains**。
- `public/_headers` 已配置安全响应头与静态资源长缓存。
- `public/robots.txt` 允许全站抓取。

## 已知限制

- 内测表单目前**仅前端校验**，提交数据不会发送到任何后端。上线前建议接入表单服务（如 Formspree、Cloudflare Workers + D1）或自建接口。
- 字体依赖 Google Fonts，国内访问较慢；如面向国内用户，建议改为本地托管或国内 CDN。

## 许可

项目内容与品牌素材归 School Mate 团队所有。如需复用代码结构，请注明来源。
