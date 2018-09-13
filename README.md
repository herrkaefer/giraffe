![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiAcG9QO7XhF4SvFt1T5IbZUjhWH7DBMsVQlbHxLcgu8zjenEH)

`giraffe`: One command to setup a Shadowsocks server on Ubuntu VPS.

- BBR acceleration
- Auto start after reboot

(Tested on Ubuntu 16.04)

## How to use

1 : SSH to VPS server

2 :

```sh
wget https://raw.githubusercontent.com/herrkaefer/giraffe/master/giraffe.sh
chmod +x giraffe.sh
```

3 : Edit `giraffe.sh` using editor like `nano`, change password or other settings (line 16 ~ 22)

4 :

```sh
sudo ./giraffe.sh
```

In the process, press keys following the prompt.

5 : Reboot in the end.
