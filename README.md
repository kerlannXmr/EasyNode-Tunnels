# 🚇 EasyNode-Vpn+Tor

 **Tor & VPN Ready Monero Node Installer**
 
<div>
  <img src="https://github.com/kerlannXmr/EasyNode-Tunnels/blob/main/picture/easynode_animated.svg" alt="EasyNode-Tunnels Logo" width="400" height="400"> 
  <img src="https://github.com/kerlannXmr/EasyNode-Tunnels/blob/main/picture/easynode_features.png" alt="EasyNode-Tunnels Logo" width="430" height="400"> 
 <br>
  <br>
  <img src="https://github.com/kerlannXmr/EasyNode-Tunnels/blob/main/picture/easynode_tunnels.png" alt="EasyNode-Tunnels Logo" width="400" height="450"> 
  <img src="https://github.com/kerlannXmr/EasyNode-Tunnels/blob/main/picture/easynode_tunnels.gif" alt="EasyNode-Tunnels Logo" width="430" height="450">
</div>


---
## 🎯 What is EasyNode-Tunnels?

**EasyNode-Tunnels** is a revolutionary one-click installer that transforms any Linux machine into a bulletproof Monero privacy fortress. In less than 10 minutes, you'll have a production-ready node with military-grade anonymity layers that would typically take experts weeks to configure.

**No Linux knowledge required.**

### 🎯 Why Choose EasyNode-Tunnels?

  **Perfect for users who want:**
The Problem We Solve
- ✅ **Maximum Privacy**: Double anonymization (Tor + VPN)
- ✅ **Zero Configuration**: Works without technical knowledge
- ✅ **Mobile Access**: Connect wallets from anywhere securely
- ✅ **No Port Forwarding**: Especially useful for restrictive networks
- ✅ **Satellite Internet Ready**: Optimized for high-latency connections
- ✅ **Plug & Play**: External disk support for easy setup

### 🎯 Ready to Become Invisible?

Join thousands of users who've transformed their privacy game with **EasyNode-Tunnels**. Whether you're a complete beginner or a security expert, our installer delivers **professional results** without the professional complexity.

**Your journey to ultimate Monero privacy starts with a single command.**

### 🎭 Dual-Tunnel Privacy Architecture

```

🚀 COMPLETE INSTALLATION
├── 🌍 Language Selection (FR/EN)
├── 📦 PHASE 1: Base Installation (Steps 1-5)
│   ├── 1️⃣ System Update + Firewall
│   ├── 2️⃣ Monero CLI Installation v0.18.4.0  
│   ├── 3️⃣ Tor Installation + .onion Generation
│   ├── 4️⃣ bitmonero.conf Configuration
│   └── 5️⃣ Anonymous DNS Configuration
│
├── 💾 PHASE 2: Storage Choice
│   ├── Option 8️⃣ → External Disk (Recommended SSD)
│   └── Default → Internal Disk (~/.bitmonero)
│
├── 🔐 PHASE 3: VPN Configuration (Menu 13)
│   ├── 10-1 → 📖 ZeroTier Info (Usage Guide)
│   ├── 10-2 → 🌐 ZeroTier Installation + Optimization
│   ├── 10-3 → ⚙️ Monero+VPN Configuration
│   └── Skip → 🚀 Direct to startup
│
└── 🎯 PHASE 4: Startup (Step 6)
    ├── Mode 1 → 🛡️ With IP Blocking (Recommended)
    └── Mode 2 → 🔓 Without IP Blocking
```
**Creates a bulletproof Monero node with:**
- 🎭 **Tor Layer**: Hidden .onion services for complete anonymity
- 🔐 **VPN Layer**: Private wallet connections without port forwarding
- 🛡️ **Security Layer**: Automatic IP banning and firewall configuration
- 📱 **Access Layer**: Mobile wallet support from anywhere

---

## 🚀 Quick Start

### Installation

🎯 FULL SETUP WORKFLOW:
1. Run script → Select Language
2. Execute steps: 1 → 2 → 3 → 4 → 5
3. Choose storage: Option 8 (External SSD) OR skip for internal
4. Configure VPN: Option 10 → 1 → 2 → 3
5. Start blockchain: Option 6 → Mode 1 (with IP blocking)
6. Connect wallets using provided addresses

```bash
# 1. Download the installer
wget https://raw.githubusercontent.com/kerlanxmr/EasyNode-Tunnels/main/easynode_vpn_tor.sh

# 2. Make it executable
chmod +x easynode_vpn_tor.sh

# 3. Run with sudo
sudo ./easynode_vpn_tor.sh

# 4. Follow the guided menu
```
## DOWNLOAD
<div>

| Version | Links |
|---------|------|
| 🐧 Linux | [![Linux](https://img.shields.io/badge/Download-EasyNode_VPN+TOR-orange?style=for-the-badge)](https://github.com/kerlannXmr/EasyNode-Tunnels/releases/download/V2.0/easynode_vpn_tor.sh) |

</div>


## 🔗 Final Connection Options Available

After complete installation, you get **3 connection methods**:

```
🎭 Tor Access:     [auto-generated].onion:18081
🔐 VPN Access:     172.148.027.xxx:18081  
🌐 Direct Access:  [your-local-ip]:18081
```
## 📱 Connection Methods Details

### 🎭 Tor Connection (.onion)

**Usage:** Maximum anonymity  
**Wallet:** Any Tor-compatible wallet  
**Address:** Generated automatically during step 3  
**Example:** `abc123def456ghi789.onion:18081`  
**Best for:** Anonymous transactions, hidden node identity

### 🔐 VPN Connection (ZeroTier)

**Usage:** Secure mobile access without port forwarding  
**Wallet:** Mobile wallets (Cake Wallet, Monerujo)  
**Address:** Assigned by ZeroTier network  
**Example:** `172.148.027.097:18081`  
**Best for:** Mobile access, no router configuration needed

### 🌐 Direct Connection (Local IP)

**Usage:** Local network access  
**Wallet:** Desktop wallets (Monero GUI)  
**Address:** Your computer's local IP  
**Example:** `192.168.1.100:18081`  
**Best for:** Desktop wallets on same network

---

---

## 💡 Pro Tips for Wallet Connection

**Best practices:**

- ✅ **Use Tor** for maximum privacy and anonymity
- ✅ **Use VPN** for convenient mobile access from anywhere  
- ✅ **Use Direct** only on trusted local networks
- ✅ **Combine methods** for different use cases (Tor for privacy, VPN for convenience)

**Recommended wallet configurations:**

- 📱 **Mobile:** ZeroTier VPN connection for seamless access
- 🖥️ **Desktop:** Tor connection for maximum anonymity
- 🏠 **Local:** Direct connection for simple setup testing


## 🛡️ Connection Security Levels

| Method | Anonymity | Mobile Access | Setup Complexity | Security Level |
|--------|:---------:|:-------------:|:----------------:|:--------------:|
| 🎭 **Tor** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 🔐 **VPN** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| 🌐 **Direct** | ⭐⭐ | ⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |

---

## ✨ Key Features

### 🔥 Unique Capabilities

| Feature | Description | Benefit |
|---------|-------------|---------|
| 🎭 **Auto-Tor Integration** | Automatic .onion address generation | Complete node anonymity |
| 🔐 **VPN-First Design** | Built for VPN-only wallet connections | Zero port forwarding needed |
| 🛰️ **Satellite Optimized** | MTU tuning + TCP optimizations | Perfect for Starlink/satellite |
| 📱 **Mobile-Ready** | ZeroTier integration | Secure mobile wallet access |
| 🛡️ **Smart IP Blocking** | Auto-downloads community ban lists | Enhanced security |
| 💾 **Flexible Storage** | External disk auto-mounting | Easy blockchain management |
| 🌍 **Beginner Friendly** | Guided interface in 2 languages | Zero Linux knowledge needed |
| 🎨 **Beautiful Interface** | Color-coded terminal | Professional user experience |

---

## 🔐 Security Architecture

### 🛡️ Security Levels

| Security Feature | Level | Implementation |
|------------------|-------|----------------|
| **Node Anonymity** | ⭐⭐⭐⭐⭐ | Hidden behind Tor .onion services |
| **Wallet Privacy** | ⭐⭐⭐⭐⭐ | VPN-only connections, no public exposure |
| **Network Security** | ⭐⭐⭐⭐⭐ | Automatic IP banning + firewall rules |
| **DNS Privacy** | ⭐⭐⭐⭐⭐ | Anonymous DNS servers (94.140.14.14) |
| **Traffic Analysis** | ⭐⭐⭐⭐⭐ | Dual-layer obfuscation (Tor+VPN) |

### 🔧 Automatic Security Features

**What happens automatically:**
- 🚫 **IP Banning**: Downloads and applies community blacklists
- 🔥 **Firewall Setup**: UFW configuration with optimal port rules
- 🕵️ **DNS Protection**: Anonymous DNS servers configuration
- 🎭 **Tor Services**: Hidden .onion addresses for SSH + RPC
- 🔐 **VPN Tunnels**: Private network creation for wallet access

---

## 📊 Comparison Table

| Feature / Fonctionnalité | EasyNode-Tunnels | Standard Node | Other Installers |
|-------------------------|:----------------:|:-------------:|:----------------:|
| **Tor Integration** | ✅ Auto .onion | ❌ Manual only | ⚠️ Complex setup |
| **VPN Support** | ✅ Built-in ZeroTier | ❌ None | ❌ None |
| **IP Banning** | ✅ Automatic | ❌ Manual | ⚠️ Basic |
| **Mobile Access** | ✅ VPN tunnels | ❌ Port forwarding | ❌ Port forwarding |
| **Beginner Friendly** | ✅ Zero knowledge | ❌ Expert level | ⚠️ Some knowledge |
| **External Storage** | ✅ Auto-mount | ❌ Manual | ⚠️ Manual |
| **Satellite Optimized** | ✅ Yes | ❌ No | ❌ No |
| **Multilingual** | ✅ FR/EN | ❌ EN only | ❌ EN only |
| **Security Level** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ |

---

## 🎖️ Perfect For

###  Ideal Users

| User Type | Why Perfect | Key Benefits |
|-----------|-------------|--------------|
| 🏠 **Home Users** | Privacy without complexity | One-click setup |
| 🛰️ **Satellite Internet** | Starlink/Hughes/Viasat optimized | No port forwarding |
| 📱 **Mobile Users** | Wallet access anywhere | VPN tunnels |
| 🔒 **Privacy Advocates** | Maximum anonymity | Tor + VPN layers |
| 🏢 **Small Businesses** | Simple deployment | Professional interface |
| 🎓 **Beginners** | Zero knowledge required | Guided setup |

---

## 💡 Pro Tips

###  Maximize Your Privacy

```bash
# Best practices for maximum security:

1. 💾 Use External SSD
   - Better blockchain sync performance
   - Easy backup and portability

2. 🔗 Enable Both Tor + VPN
   - Tor for node anonymity
   - VPN for wallet connections

3. 📱 Mobile Setup
   - Install ZeroTier app on phone
   - Connect to your private network
   - Use Cake Wallet or Monerujo

4. 🎛️ Advanced Options
   - Use pruned blockchain or complete (90GB vs 220GB)
   - Configure custom ban lists
   - Monitor with built-in tools
```

---

## 🛠️ Stockage 

- **Internal or external Storage**: 100GB+ free space

- **Recommended Storage**: External SSD 500GB+

---

## 📞 Support

### Need Help?
- 📖 Check the built-in guide (menu option 0)
- 📚 Read the notes section (menu option 12)
- 🐛 Report bugs via [GitHub Issues](https://github.com/kerlannxmr/EasyNode-Tunnels/issues)
- 📧 Email: easynode@kerlann.org

---

## 💝 Donations

<div align="center">

### Support Development

**If EasyNode-Tunnels helped you achieve privacy, consider supporting development:**

###  <b>🔶Make donnation with 'cake wallet' to : ' kerlann.xmr '</b>

<div align="center"><img src="https://github.com/kerlannXmr/EasyMonerod/blob/main/picture/qrcode1.gif"  alt="wsl Interface"></div>

or fundraiser

[![contact_xmrchat](https://img.shields.io/badge/✨_XmrChat-FF6600?style=flat&logoColor=white)](https://xmrchat.com/easymonerod)[![contact_kuno](https://img.shields.io/badge/🔥_Kuno-FF6600?style=flat&logoColor=white)](https://kuno.anne.media/fundraiser/dkbu)
Every donation helps improve privacy tools for everyone!  
</div>

<div align="center">

---

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)![Platform: Linux](https://img.shields.io/badge/Platform-Linux-blue.svg)![Monero](https://img.shields.io/badge/Monero-Ready-orange.svg)![Tor](https://img.shields.io/badge/Tor-Integrated-purple.svg)![VPN](https://img.shields.io/badge/VPN-ZeroTier-green.svg)


**🔒 PRIVACY MATTERS 🔒**

*Made with ❤️ for the Monero community*

[⭐ Star this repo](https://github.com/[username]/EasyNode-Tunnels) | [🍴 Fork it](https://github.com/[username]/EasyNode-Tunnels/fork) | [📢 Share it](https://twitter.com/intent/tweet?text=Check%20out%20EasyNode-Tunnels%20-%20Privacy-focused%20Monero%20node%20installer%20with%20Tor%20and%20VPN%20support!&url=https://github.com/[username]/EasyNode-Tunnels)

</div>
<div align="center"><img src="https://github.com/kerlannXmr/EasyMonerod/blob/main/picture/monero.gif" width="190" height="60" alt="code Interface"></div>
