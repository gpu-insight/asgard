# Asgard

The Asgard project itself won't build any of honest-to-goodness tools. It just compresses some great development tools or configuration as well as a small setup script into a self-extractable archive by [Stephane Peter's makeself](https://github.com/megastep/makeself). By this way, you will get a self-contained installer which is still working even if the machine is out of the Internet.

# Big Thanks to

- [amix/vimrc](https://github.com/amix/vimrc)
- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
- [jgm/pandoc](https://github.com/jgm/pandoc)
- [junegunn/fzf](https://github.com/junegunn/fzf)
- [megastep/makeself](https://github.com/megastep/makeself)
- [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
- [romkatv/zsh-bin](https://github.com/romkatv/zsh-bin)
- [wting/autojump](https://github.com/wting/autojump)

# How to Build

You can "git clone" this repository along with its submodules to any directory and run make. After that, you will get a self-extractable shell script named after **"asgard.run"**

```
git clone --recurse-submodules https://github.com/gpu-insight/asgard.git
cd asgard
make
```

# How to Use

`asgard.run` is a self-extractable archive in essence. To know how it works, refer to [here](https://github.com/megastep/makeself)
