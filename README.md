# Asgard

The Asgard project itself will build NONE of honest-to-goodness tools. It just compresses some great development tools or configuration as well as a small setup script into a self-extractable archive by [Stephane Peter's makeself](https://github.com/megastep/makeself). By this way, you will get a self-contained installer which is still working off-line.

# Big Thanks to

- [amix/vimrc](https://github.com/amix/vimrc)
- [junegunn/fzf](https://github.com/junegunn/fzf)
- [megastep/makeself](https://github.com/megastep/makeself)
- [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)

# How to Build

You can "git clone" this repository along with its submodules to any directory and run make. After that, you will get a self-extractable shell script named after **"asgard.run"**

```
git clone --recurse-submodules https://github.com/gpu-insight/asgard.git
cd asgard
make
```
