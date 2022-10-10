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
