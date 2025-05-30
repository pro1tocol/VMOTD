# HOW TO WORK
``` bash
git clone -b termux --single-branch https://github.com/pro1tocol/VMOTD.git
cd VMOTD && pwd
# you need to record the path for work
```

- ### Create Soft Link
``` bash
ln -sf /source_path /destination_path
```
| FILES | source | destination |
| :--- | :--- | :--- |
| ranger | VMOTD/config/ranger | $HOME/.config/ranger |
| plugins | VMOTD/plugins | $HOME/.plugins |
| sbin | VMOTD/sbin | $HOME/sbin |
| termux | VMOTD/termux/termux.properties | $HOME/.termux/termux.properties |
| vim | VMOTD/vim | $HOME/.vim |
| nanorc | VMOTD/nanorc | $HOME/.nanorc |
| profile | VMOTD/profile | $PREFIX/efi/profile |
| vimrc | VMOTD/vimrc | $HOME/.vimrc |
| zprofile | VMOTD/zprofile | $HOME/.zprofile |
| zshrc | VMOTD/zshrc | $HOME/.zshrc |
| zshrc | VMOTD/zshrc | $PREFIX/etc/zshrc |

- ### Copy The Files
``` bash
cp -rf /source_path /destination_path
```
| FILES | source | destination |
| :--- | :--- | :--- |
| motd | VMOTD/motd | $HOME/.motd |
