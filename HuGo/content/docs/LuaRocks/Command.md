# LuaRocks 常用命令



## luarocks

- `luarocks help` 查看帮助
  - `luarocks help <command>`  查看命令帮助

---

- `luarocks list` 已安装的 rocks
  - `luarocks list --porcelain` 每个 rock 放在一行显示，便于 `grep` 等命令处理
  - 如： `luarocks list --porcelain | grep kong-plugin`

---

- `luarocks show <rock>` 查看 rock 信息
  - `luarocks show lua-cjson --deps` 查看依赖
  - `luarocks show lua-cjson --rock-tree` 安装路径

---

- `luarocks path` Lua path 和 cpath

---

- `luarocks search <rock>` 搜索
- `luarocks install <rock>` 安装
- `luarocks remove <rock>` 卸载

---

- 



## Read More

- ❤ [luarocks](https://github.com/luarocks/luarocks/wiki/luarocks) ❤
- [luarocks-admin](https://github.com/luarocks/luarocks/wiki/luarocks-admin)

