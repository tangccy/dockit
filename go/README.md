# 说明

### 添加 .air.toml 配置文件（可选）

在项目根目录加一个 `.air.toml`，可以自定义热更新规则，比如：

```toml
[build]
cmd = "go build -o ./tmp/main ."
bin = "./tmp/main"
include_ext = ["go", "tpl", "tmpl", "html"]
exclude_dir = ["tmp", "vendor", "node_modules"]

[log]
time = true
```

