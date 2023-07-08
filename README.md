### goctl
如果本地没有 `~/.goctl/x.x.x[1.4.3]` 文件夹，可以通过模板初始化命令 `goctl template init` 进行初始化。

将 goctl 模板复制、覆盖初始化生成的模板：
```sh
rm -r ~/.goctl/1.4.3
cp -r ./1.4.3 ~/.goctl/
```
