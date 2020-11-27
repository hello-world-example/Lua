# 创建一个 Rock



## 初始化 rock

```bash
$ mkdir rock-hello

$ cd rock-hello

# 创建 rockspec 文件模板
$ luarocks write_rockspec

# 成功后会在当前文件夹下生成 rock-hello-dev-1.rockspec 文件
$ cat rock-hello-dev-1.rockspec
```



## *.rockspec 文件

> - [Rockspec format](https://github.com/luarocks/luarocks/wiki/Rockspec-format) 详细文件格式

```lua
-- {package}-{version}.rockspec 与文件名保持一致
package = "rock-hello"
-- ❤❤❤ 版本号要以 -x 结尾，如0.0.1-1，1.3-1，如果你不按照这种规则定义则会报错！
version = "dev-1"
-- ❤❤❤ luarocks 仓库托管的只有 *.rockspec 这个文件
-- ❤❤❤ source 需要执行可以下载的地址
source = {
  -- 源码位置，如： github 地址
  url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
  -- 项目文档地址，如 github 的 page
  homepage = "*** please enter a project homepage ***",
  summary = "简介",
  detailed = [[
  详细描述
  ]],
  -- 开源协议，如： MIT
  license = "*** please specify a license ***"
}
dependencies = {
  "lua >= 5.1, < 5.4",
  "luaknife >= 2.3"
  -- 其他依赖
}
build = {
  -- 编译方式
  type = "builtin",
  -- 包含的模块
  modules = {}
}
```



## 创建一个模块

```bash
$ cd rock-hello

$ vim src/hello.lua
```

`src/hello.lua` 内容如下

```lua
module = {}

function module.sayHello()
    print("Hello World")
end

function module.say(some)
    print(some)
end

return module
```

修改 `rock-hello-dev-1.rockspec` 文件，内容如下：

```lua
package = "rock-hello"
version = "1.0.0-1"
source = {
  -- 注意文件地址：https://github.com/hello-world-example/Lua.git， https->git, 去掉 .git 后缀 
  url = "git://github.com/hello-world-example/Lua",
  tag = "v.rock-hello-1.0.0-1",
  branch = "rock-hello-1.0.0-1"
}
build = {
  type = "builtin",
  modules = {
    ["hello-rock"] = "src/hello.lua"
  }
}
```

重命名 `rock-hello-dev-1.rockspec` 文件 为 `rock-hello-1.0.0-1.rockspec` 与文件内容保持一致

```bash
$ mv kail-hello-rock-1.0.0-1.rockspec rock-hello-1.0.0-1.rockspec

# 使用本地安装
$ sudo luarocks make
```



## 托管到 Github

```bash
$ cd rock-hello

$ git init

$ git remote add origin https://github.com/hello-world-example/Lua.git

# 创建一个空分支
$ git checkout --orphan rock-hello-1.0.0-1

# 提交文件
$ git add .
$ git commit -am init
$ git push --set-upstream origin rock-hello-1.0.0-1

$ git tag v.rock-hello-1.0.0-1
$ git push --tags

# 删除 tag
# $ git tag -d v.rock-hello-1.0.0-1
# $ git push origin :refs/tags/v.rock-hello-1.0.0-1
```



## 上传到 luarocks.org

- 先在 https://luarocks.org/register 注册账户
- 登陆后在 https://luarocks.org/settings/api-keys 生成 `api-key`

```bash
# 删除生成的文件
$ rm *.rock

# 
$ luarocks upload rock-hello-1.0.0-1.rockspec --api-key=<Your Key>

# 安装
$ sudo luarocks install rock-hello
# 卸载
# $ sudo luarocks remove rock-hello
```



## Read More

- [Creating a rock](https://github.com/luarocks/luarocks/wiki/Creating-a-rock)
- [教你使用 luarocks 来创建 rock 包](https://segmentfault.com/a/1190000017176952)

