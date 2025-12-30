-- 启用 messages 表的实时订阅
-- 在 Supabase 的 SQL Editor 中执行此命令

-- 1. 首先检查现有的 publications
SELECT * FROM pg_publication_tables;

-- 2. 确保 supabase_realtime publication 存在
-- 如果不存在，创建它
CREATE PUBLICATION IF NOT EXISTS supabase_realtime;

-- 3. 将 messages 表添加到 realtime publication
ALTER PUBLICATION supabase_realtime ADD TABLE messages;

-- 4. 验证设置
SELECT * FROM pg_publication_tables WHERE pubname = 'supabase_realtime';
