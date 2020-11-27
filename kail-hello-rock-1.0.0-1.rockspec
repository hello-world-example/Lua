package = "kail-hello-rock"
version = "1.0.0-1"
source = {
  url = "https://github.com/hello-world-example/Lua.git",
  branch = "rock-kail-hello-1.0.0-SNAPSHOT-1"
}
build = {
  type = "builtin",
  modules = {
    ["hello-rock"] = "src/hello-rock.lua"
  }
}
