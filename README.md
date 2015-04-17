My dotfiles
===========

Just a reminder how to install these configs.

After checking out the repository, don't forget to initialize the submodules:

```
$ git submodule init
$ git submodule update
```

The individual configs can then be installed using GNU stow.
For example, if you want to install the xresources files:

```
$ stow xresources
```

To uninstall them again, run:

```
$ stow -D xresources
```
