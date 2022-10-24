# v2ray proxy

**In this scenario there are two machines (VPS), IR: `internal` & non-IR: `external` which running on `ubuntu 22.04`.**

## How to Run

In both servers install `git` for clonning [this repo](https://github.com/mehrdad-drpc/proxy).

```bash
apt install git -y
```


**Internal:** `IR`

```bash
git clone https://github.com/mehrdad-drpc/proxy.git
chmod +x internal.sh
bash internal.sh
bash fake_traffic.sh
```

**External:** `non-IR`

```bash
git clone https://github.com/mehrdad-drpc/proxy.git
chmod +x external.sh
bash external.sh
```

---


**Note:**
Change to user directory `[/root]` before git clone

---

### Check open ports and running cotainters

```bash
ss -tlpn
docker ps
```

---

# V2ray Clients
First option is our recommendation, but have two or more of apps in case off signature based packet dropping.
## Android clients:
[v2rayNG](https://play.google.com/store/apps/details?id=com.v2ray.ang)

[AnXray](https://f-droid.org/packages/io.nekohasekai.anXray/)

[XRAYVPN](https://play.google.com/store/apps/details?id=vpn.v2ray.xray)

[Matsuri](https://play.google.com/store/apps/details?id=moe.matsuri.lite)

## IOS clients:
[ShadowLink](https://apps.apple.com/us/app/shadowlink-shadowsocks-vpn/id1439686518)

[NapsternetV](https://apps.apple.com/us/app/napsternetv/id1629465476)

[OneClick](https://apps.apple.com/us/app/oneclick-safe-easy-fast/id1545555197)

[Shadowrocket](https://apps.apple.com/us/app/shadowrocket/id932747118)

[i2Ray](https://apps.apple.com/us/app/i2ray/id1445270056)

## Windows clinets:
[NekoRay](https://github.com/MatsuriDayo/nekoray/releases)

[v2rayN](https://github.com/2dust/v2rayN/)

## Linux clients:
[NekoRay](https://github.com/MatsuriDayo/nekoray/releases)

[qv2ray](https://qv2ray.net/getting-started/step1.html#linux-debian-ubuntu-and-their-derivatives)

## MacOS clients:
[NekoRay](https://github.com/MatsuriDayo/nekoray/releases)

[V2RayX](https://github.com/Cenmrev/V2RayX/releases/)
