# RHEL 9 Setup for SysAdmins

A standard configuration for Red Hat Enterprise Linux 9 that is a keyboard first setup. The basic
configuration will install some basic applications for getting up to speed and configurations for
them and gnome.

Before starting, make sure to install [Tactile](#tactile) and [Just Perfection](#just-perfection)
before continuing until we figure out how to install gnome extensions via a CLI tool.

## How to run

Download the latest release for a more stable experience, or checkout the latest version of this
repository for experimental. Enter the repository and run `bash setup.sh`.

## Installed Items

- [Wezterm](https://wezfurlong.org/wezterm/index.html): a modern terminal
  emulator
- [Neovim](https://neovim.io/): the PDE
- [YADM](https://yadm.io/): configuration file manager
- keychain: SSH and GPG keychain manager
- [flameshot](https://flameshot.org/): more advanced screenshot tool
- DejaVu and Cascadia Mono Nerd fonts
- [Tactile](#tactile) and [Just Perfection](#just-perfection) Gnome Extensions

## Keyboard Shortcuts

| key              | Action                                |
| ---              | ---                                   |
| `[meta]` + `[#]` | Switches to workspace _#_             |
| `[alt]` + `[#]`  | Switched to app _#_ on Gnome Dock     |
| `[CapsLock]`     | This useless key is now a `[ctr]` key |
| `[PrtScr]`       | Take a screenshot with flameshot      |
| `[meta]` + `[t]` | launches [Tactile](#tactile)          |

## Additional changes

### Tactile

<https://extensions.gnome.org/extension/4548/tactile/>

Tactile allows re-sizing of windows similar to a tiling window manager. This configuration sets it up
to use a 3x2 grid for layout. With the window you want to configure, press `[meta]`+`[t]` to launch
tactile, then use and a grid pops up on the screen to setup the window size and location. The first
key press is the top left corner of your window, and the second will be the bottom right.

Tactile grid:

|          | col1  | col2  | col3  |
| ---      | ---   | ---   | ---   |
| **row1** | `[q]` | `[w]` | `[e]` |
| **row2** | `[a]` | `[s]` | `[d]` |

### Neovim

This sets up Neovim with a basic Lazy.nvim configuration based around TJ DeVries walk through and
[Nvim Kickstart](https://github.com/nvim-lua/kickstart.nvim). I highly recommend reading through the
config as it is very highly documented and helps you learn how to configure Neovim to be your
personal development environment (PDE).

[TJ's Video Walkthrough of Neovim Kickstart](https://youtu.be/m8C0Cq9Uv9o?si=SxvYUw5jUSohNsSN)

### Just Perfection

<https://extensions.gnome.org/extension/3843/just-perfection/>

- Set animation speed to `2`
- Sets the indicator for running apps on the Gnome Dash
- Use Workspaces
- Hide workspace switcher popup

## Acknowledgment

Some of this was from older checklists I had, but I finally was inspired to get this put together
thanks to some recent reloading that has become necessary with work, needing to spin up some temp
machines, and DHH's [Omakub](https://omakub.org/) project.
