# 素材清单（图片 / 视频）

站点 `index.html` 已经写好全部版面与占位逻辑：**文件放进指定位置就会自动显示，没放就显示虚线占位框**，不会出现破图。

---

## 方法一：一键脚本（推荐，不用改名、不用找文件夹）

1. 双击 `tools\打开素材文件夹.bat`
   → 会在**桌面**自动建好一个叫 `media` 的文件夹并打开它
2. 把你的照片和视频**全部丢进这个 `media` 文件夹**（文件名随便，不用改）
3. 想让某张图去某个位置，就给文件名**加数字前缀**（对照下表）；不加数字的按文件名顺序排在后面
4. 双击 `tools\导入素材.bat`
   → 它会先列出"哪个文件 → 放到哪个位置"，输入 `Y` 回车即开始复制并自动改名
5. 打开 GitHub Desktop → 填一句说明 → **Commit to main** → **Push origin**

### 编号对应表（加数字前缀即可，例如 `1.jpg`、`2.jpg`）

| 编号 | 素材内容 | 最终落到 |
|---|---|---|
| 1 | 首屏主图（最有代表性的产品图） | `images/hero-product.jpg` |
| 2 | 传动轴总成 | `images/products/drive-shaft.jpg` |
| 3 | 半轴与 CV 轴 | `images/products/cv-axle.jpg` |
| 4 | 转向轴与转向机 | `images/products/steering-shaft.jpg` |
| 5 | 万向节与叉类件 | `images/products/universal-joint.jpg` |
| 6 | 花键轴与联轴件 | `images/products/spline-shaft.jpg` |
| 7 | OEM / 贴牌包装 | `images/products/oem-parts.jpg` |
| 8 | 车间全景 | `images/factory/workshop.jpg` |
| 9 | 加工工序（车削/花键/热处理） | `images/factory/cnc.jpg` |
| 10 | 检验或包装 | `images/factory/inspection.jpg` |
| 视频 | 任意一个 mp4 | `videos/factory-tour.mp4` |

> 只放 5 张也行，脚本会按顺序占用前 5 个位置，其余仍显示占位框。
> 视频必须是 **.mp4（H.264）**；`.mov` 浏览器放不了，需先转换。

---

## 方法二：手工放（不装脚本也能用）

**GitHub Desktop 里没有"拖进去"的地方**——素材要先放进硬盘上的仓库文件夹，GitHub Desktop 会自动发现改动。

1. GitHub Desktop 菜单 **Repository → Show in Explorer**（快捷键 `Ctrl+Shift+F`）
   → 直接弹出 `my-website` 文件夹
2. 进入 `images` / `images/products` / `images/factory` / `videos`
3. 把照片、视频拖进去，**并把文件名改成下面表格里指定的名字**
4. 回到 GitHub Desktop → **Commit to main** → **Push origin**

> 改名避坑：先在资源管理器「查看」里勾上**显示文件扩展名**，否则把 `IMG_1234` 改成 `hero-product.jpg` 容易变成 `hero-product.jpg.jpg`。

### 要求的文件名（必须完全一致：小写、连字符、不要中文、不要空格）

## 目录结构（已建好）

```
my-website/
├─ index.html
├─ ASSETS.md            ← 本清单
├─ images/
│  ├─ hero-product.jpg      ← 首屏主图
│  ├─ products/             ← 6 张产品卡片图
│  └─ factory/              ← 3 张车间实拍图
└─ videos/
   └─ factory-tour.mp4      ← 工厂视频
```

## 一、首屏主图（1 张）

| 文件名 | 位置 | 建议尺寸 | 内容 |
|---|---|---|---|
| `images/hero-product.jpg` | 首屏右侧规格面板顶部 | 1600×900（16:9） | 一张最有代表性的整根传动轴/半轴产品图，白底或浅灰底干净背景 |

> 你仓库里已有的 `77.jpg`（白底传动轴产品图）可以直接改名为 `images/hero-product.jpg` 使用。

## 二、产品卡片图（6 张）

统一放在 `images/products/`，建议 **1200×900（4:3）**：

| 文件名 | 对应产品 | 拍摄内容 |
|---|---|---|
| `drive-shaft.jpg` | 传动轴总成 | 整根传动轴（含十字万向节、滑动花键） |
| `cv-axle.jpg` | 半轴与 CV 轴 | 半轴总成，带球笼与防尘套，最好左右各一根 |
| `steering-shaft.jpg` | 转向轴与转向机 | 转向柱万向轴或齿轮齿条转向机 |
| `universal-joint.jpg` | 万向节与叉类件 | 十字节特写，或十字节 + 叉头摆拍 |
| `spline-shaft.jpg` | 花键轴与联轴件 | 花键轴端部特写，能看清齿形 |
| `oem-parts.jpg` | OEM / 贴牌 | 带自有品牌包装箱/标签的产品，或包装线 |

## 三、车间实拍（3 张）

统一放在 `images/factory/`，建议 **1200×900（4:3）**：

| 文件名 | 内容 |
|---|---|
| `workshop.jpg` | 车间全景（能看到产线/设备规模） |
| `cnc.jpg` | 加工工序特写（车削/花键加工/热处理，有人操作更好） |
| `inspection.jpg` | 检验或包装环节（卡尺、检具、装箱） |

## 四、工厂视频（1 个）

| 文件名 | 位置 | 格式 |
|---|---|---|
| `videos/factory-tour.mp4` | 工厂实拍区块（16:9 播放器） | **MP4 / H.264**，1920×1080，时长 30–60 秒，**文件 ≤ 20 MB** |

> 视频不要放 4K 原始文件，GitHub Pages 加载会非常慢。建议先压缩到 1080p / 几 MB。

## 五、通用要求

- 格式：JPG（照片）优先；需要透明底用 PNG，并把 HTML 里的 `.jpg` 改成 `.png`
- 单张图片建议 **≤ 300 KB**（长边 1600px、质量 80% 足够清晰）
- 不要用中文文件名、空格、括号，避免线上路径出错
- 拍产品尽量同背景、同光线、同角度，整页看起来才统一

## 六、怎么放进去

1. 在资源管理器里打开 `C:\Users\Administrator\Documents\GitHub\my-website\images\` 等目录
2. 把图片/视频按上表**改名后拖进去**
3. 回到 GitHub Desktop：左侧会列出这些新文件 → 填一句 commit 说明 → **Commit to main** → **Push origin**
4. 等 1–2 分钟，刷新线上地址即可看到图

> 注意：空的文件夹 git 不会保存，所以每个目录里都放了一个 `.gitkeep` 小文件，**不要删**。
