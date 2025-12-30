# 工作组聊天 - 多设备实时同步

一个基于验证码的群组聊天应用，支持多设备实时同步。相同验证码的用户可以共享聊天记录。

## 功能特性

- 验证码群组：输入4位数字验证码创建或加入群组
- 多设备同步：使用Supabase实现跨设备实时同步
- 管理员权限：第一个创建群组的用户为管理员，可删除消息
- 自动清空：超过24小时未清空的记录会自动删除
- 实时更新：消息实时同步到所有设备
- 本地模式：未配置Supabase时使用localStorage（仅限单设备）

## 快速开始

### 方式一：本地模式（单设备使用）

直接在浏览器中打开 `index.html` 文件即可使用。

### 方式二：多设备同步模式

#### 1. 创建 Supabase 项目

1. 访问 [https://supabase.com](https://supabase.com) 注册账号
2. 点击 "New Project" 创建新项目
3. 等待项目创建完成（约2分钟）

#### 2. 获取 API 凭证

1. 进入项目设置 Settings > API
2. 复制以下信息：
   - Project URL
   - anon public key

#### 3. 配置项目

打开 `supabase-config.js` 文件，填入你的凭证：

```javascript
const SUPABASE_CONFIG = {
    url: 'YOUR_SUPABASE_URL_HERE',
    anonKey: 'YOUR_SUPABASE_ANON_KEY_HERE'
};
```

#### 4. 创建数据库表

1. 在 Supabase 项目中进入 SQL Editor
2. 点击 "New Query"
3. 复制 `database-setup.sql` 文件的内容
4. 粘贴到编辑器中
5. 点击 "Run" 执行脚本

#### 5. 启动应用

在浏览器中打开 `index.html` 文件即可使用。

## 使用说明

### 创建/加入群组

1. 在首页输入4位数字验证码（如：1234）
2. 点击"验证并进入"按钮
3. 如果验证码不存在，将创建新群组（你成为管理员）
4. 如果验证码已存在，将加入现有群组

### 发送消息

1. 在文本框中输入消息内容
2. 点击"发送消息"或按 Enter 键发送
3. 消息会实时同步到所有设备

### 管理员功能

- 删除单条消息：点击消息右侧的"删除"按钮
- 清空全部记录：点击顶部的"清空全部"按钮

### 退出群组

点击右上角的"退出分组"按钮返回验证页面。

## 项目结构

```
workgroup-chat/
├── index.html              # 主应用文件
├── supabase-config.js      # Supabase配置文件
├── database-setup.sql      # 数据库表创建脚本
└── README.md              # 项目说明文档
```

## 技术栈

- **前端**：原生 JavaScript + HTML5 + Tailwind CSS
- **后端**：Supabase (PostgreSQL + Realtime)
- **实时同步**：Supabase Realtime API

## 部署到 GitHub Pages

### 1. 初始化 Git 仓库

```bash
git init
```

### 2. 创建 .gitignore 文件

```bash
echo "node_modules/" > .gitignore
```

### 3. 提交代码

```bash
git add .
git commit -m "Initial commit"
```

### 4. 创建 GitHub 仓库

1. 访问 [https://github.com](https://github.com)
2. 点击右上角的 "+" > "New repository"
3. 输入仓库名称（如：workgroup-chat）
4. 选择 Public 或 Private
5. 点击 "Create repository"

### 5. 推送到 GitHub

```bash
git remote add origin https://github.com/你的用户名/workgroup-chat.git
git branch -M main
git push -u origin main
```

### 6. 启用 GitHub Pages

1. 进入仓库的 Settings > Pages
2. 在 "Build and deployment" 下，选择 Source 为 "Deploy from a branch"
3. 选择 Branch 为 "main" 和 "/ (root)"
4. 点击 "Save"

等待几分钟，你的网站将部署到：
`https://你的用户名.github.io/workgroup-chat/`

## 安全说明

- Supabase 的 anon key 是公开的，但已配置 RLS 策略
- 建议在生产环境中使用 Supabase 的 Row Level Security (RLS)
- 验证码为4位数字，共10000种组合，适合小团队使用

## 常见问题

### Q: 消息不同步怎么办？

A: 检查以下几点：
1. 确认 `supabase-config.js` 已正确配置
2. 检查浏览器控制台是否有错误信息
3. 确认 Supabase 项目状态为 Active

### Q: 如何更换 Supabase 项目？

A: 只需更新 `supabase-config.js` 中的 URL 和 Key 即可。

### Q: 本地模式和多设备模式可以切换吗？

A: 可以。未配置 Supabase 时自动使用本地模式，配置后自动使用多设备模式。

## 许可证

MIT License
