- # error  Component name "Layout" should always be multi-word

  - 问题分析

    此问题来源于 [eslint](https://eslint.vuejs.org/rules/multi-word-component-names.html)。

  - 解决方法

    在 `vue.config.js` 文件里面配置如下内容：

    ```
    module.exports = defineConfig({
      ....
      lintOnSave: false
    })
    ```

- # 

