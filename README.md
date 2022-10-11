# v2ray proxy

### In this scenario we used two machines (VPS), IR `internal` & non-IR `external` running on `ubuntu 22.04`

## How to Run

In both side install `git` for clonning [this repo](https://github.com/mehrdad-drpc/proxy)

```bash
apt install git -y
```

---

**Internal:**

```bash
git clone https://github.com/mehrdad-drpc/proxy.git
chmod +x internal.sh
./internal.sh
```

**External:**

```bash
git clone https://github.com/mehrdad-drpc/proxy.git
chmod +x external.sh
./external.sh
```

---

### check open ports and running cotainters

```bash
ss -tlpn
docker ps
```

---

## V2ray Clients

[Android](https://play.google.com/store/apps/details?id=com.v2ray.ang)

[iOS](https://apps.apple.com/us/app/shadowrocket/id932747118) - [iOS](https://apps.apple.com/us/app/i2ray/id1445270056)

[windows](https://github.com/2dust/v2rayN/releases/download/5.36/v2rayN-Core.zip)

[linux](https://qv2ray.net/getting-started/step1.html#linux-debian-ubuntu-and-their-derivatives)

[macOS](https://github.com/Cenmrev/V2RayX/releases/tag/v1.5.1)
