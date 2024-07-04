# RHEL 9 Configuration

Trying to get my RHEL 9 configuration scripted for easier rebuilds. This is a
work in progress and has some things not setup yet.

## ToDo

These are the items I hope to have this configure and setup automatically.

- [ ] Install base software
  - [ ] wezterm
  - [x] keychain
  - [x] nvim
  - [ ] yadm
  - [ ] flameshot
  - [ ] openvpn
- [x] Install fonts
- [x] Install gnome extension
- [x] Configure gnome extensions
- [x] Configure gnome
- [x] Single install script

## Possible Future Ideas

### Basic configurations

While I use yadm to manage my configs, it might be nice to get some basic
configs set in case I am not setting up for a full installation.  I am not sure
about this.

### Add some optional items

Possibly adding some breaks in here to allow for run time decisions could make
this useful for others or just for simpler test installs/temp machines.

## Acknowledgment

Some of this was from older checklists I had, but I finally was inspired to get
this put together thanks to some recent reloading that has become necessary
with work, needing to spin up some temp machines, and DHH's
[Omakub](https://omakub.org/) project.
