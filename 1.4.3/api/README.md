### handler.tpl
增加 http 信息返回的统一处理：
参考于：https://go-zero.dev/cn/docs/advance/template

### main.tpl
启用系统环境变量：
修改`conf.MustLoad(*configFile, &c)`
成为`conf.MustLoad(*configFile, &c, conf.UseEnv())`
