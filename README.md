# Yuhuan Xiongcheng — 公司官网

玉环雄程机械有限公司英文官网（单页，中英双语切换），纯静态 HTML/CSS/JS，无构建依赖。

## 页面结构

| 区块 | 内容 |
|---|---|
| Hero | 主标题 + 主营规格面板（含产品主图槽位） |
| Products | 传动轴 / 半轴 CV 轴 / 转向轴 / 万向节叉类 / 花键轴 / OEM 贴牌（6 张产品图） |
| Coverage | 俄系·独联体 / 韩系 / 日系 / 美系欧系 四类车型覆盖 |
| Capability | 6 项工厂能力说明 |
| Workshop | 工厂视频 + 3 张车间实拍 |
| Process | 询盘 → 适配确认 → 报价 → 样品 → 生产质检 → 发运 |
| Contact | WhatsApp / 地址 / 阿里店铺 |

## 本地预览

直接双击 `index.html` 即可（无需服务器）。
或起一个本地服务：

```bash
python -m http.server 8000
```

然后浏览器打开 <http://localhost:8000>

## 添加图片和视频（两种方式，推荐第一种）

### 一键脚本（不用改名、不用找文件夹）

1. 双击 `tools\打开素材文件夹.bat` → 桌面会自动建好 `media` 文件夹并打开
2. 照片、视频全部丢进 `media`（想指定位置就给文件名加数字前缀，如 `1.jpg`）
3. 双击 `tools\导入素材.bat` → 核对清单 → 输入 `Y` → 自动复制并改名到位
4. 回到 GitHub Desktop → **Commit to main** → **Push origin**

编号与位置的对应表见 [`ASSETS.md`](ASSETS.md)。脚本可重复运行，重复运行会覆盖同名文件。

### 手工方式

**按 [`ASSETS.md`](ASSETS.md) 的文件名和尺寸要求放入对应目录**，放进去即自动显示；没放的槽位会显示虚线占位框，不会破图。
仓库文件夹可从 GitHub Desktop 菜单 **Repository → Show in Explorer** 打开。

```
images/hero-product.jpg
images/products/{drive-shaft,cv-axle,steering-shaft,universal-joint,spline-shaft,oem-parts}.jpg
images/factory/{workshop,cnc,inspection}.jpg
videos/factory-tour.mp4
```

## 上线（GitHub Pages）

GitHub Desktop：**Commit → Push origin** 之后，
仓库 `Settings → Pages → Source: Deploy from a branch → main / (root)` 保存，
1–2 分钟后线上地址生效：`https://zhangzili01.github.io/my-website/`

## 待确认的内容

`index.html` 里以下信息是已填好的，如需修改请同步改中英双份：

- 电话 / WhatsApp：`+8613666839529`、`+8615867066756`
- 地址：`YUHUAN, TAIZHOU, ZHEJIANG, CHINA`
- 阿里店铺：`yuhuanxiongcheng.en.alibaba.com`

> 双语机制：所有文案都写成 `data-en` / `data-zh` 两个属性，右上角切换按钮或浏览器语言自动切换。
