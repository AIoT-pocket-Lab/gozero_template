### main.tpl
启用系统环境变量：
修改`conf.MustLoad(*configFile, &c)`
成为`conf.MustLoad(*configFile, &c, conf.UseEnv())`
