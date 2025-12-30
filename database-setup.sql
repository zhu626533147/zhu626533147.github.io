-- Supabase 数据库设置脚本
-- 在 Supabase 的 SQL Editor 中执行此脚本

-- 创建群组表
CREATE TABLE IF NOT EXISTS groups (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    code VARCHAR(4) UNIQUE NOT NULL,
    admin_id VARCHAR(36) NOT NULL,
    last_clear_time TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 创建消息表
CREATE TABLE IF NOT EXISTS messages (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    group_code VARCHAR(4) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    user_id VARCHAR(36) NOT NULL
);

-- 创建索引以提高查询性能
CREATE INDEX IF NOT EXISTS idx_messages_group_code ON messages(group_code);
CREATE INDEX IF NOT EXISTS idx_groups_code ON groups(code);

-- 启用 Row Level Security (RLS)
ALTER TABLE groups ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;

-- 允许所有人读取群组数据
CREATE POLICY "Allow public read access on groups"
    ON groups FOR SELECT
    USING (true);

-- 允许所有人创建群组
CREATE POLICY "Allow public insert on groups"
    ON groups FOR INSERT
    WITH CHECK (true);

-- 允许所有人读取消息
CREATE POLICY "Allow public read access on messages"
    ON messages FOR SELECT
    USING (true);

-- 允许所有人插入消息
CREATE POLICY "Allow public insert on messages"
    ON messages FOR INSERT
    WITH CHECK (true);

-- 允许管理员删除群组
CREATE POLICY "Allow admin delete on groups"
    ON groups FOR DELETE
    USING (true);

-- 允许管理员删除消息
CREATE POLICY "Allow admin delete on messages"
    ON messages FOR DELETE
    USING (true);

-- 启用实时订阅
ALTER PUBLICATION supabase_realtime ADD TABLE messages;
