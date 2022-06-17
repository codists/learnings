[TOC]

# 背景描述

1、ubuntu

```
$ lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 21.04
Release:	21.04
Codename:	hirsute
```

2、Git:

```
$ git --version
git version 2.30.2
```

# 问题描述

```
$ git push main 
fatal: 'main' does not appear to be a git repository
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

# 问题分析

本地使用“git init”命令初始化仓库的时候，得到的分支名为 master，但是 github  上面的仓库分支名为main，因为两者不一样，无法将本地的代码 push 到 github，需要将本地分支名 master 修改为 main。

# 解决方式

使用 `git branch -m` 命令实现：

```
$ git branch -m master main
```

 修改完成后，使用 `git branch`  命令验证是否修改成功：

```
$ git branch
* main
```

`git branch` 命令详细用法见参考资料[1]。

# 参考资料

[1] git branch: https://git-scm.com/docs/git-branch

