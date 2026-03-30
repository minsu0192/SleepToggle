# SleepToggle 🎵

> Keep your music playing even when your MacBook lid is closed.
> 맥북 덮개를 닫아도 음악이 계속 재생됩니다.

![macOS](https://img.shields.io/badge/macOS-11.0+-black?logo=apple)
![Swift](https://img.shields.io/badge/Swift-5.5+-orange?logo=swift)
![License](https://img.shields.io/badge/license-MIT-blue)

---

## ✨ Features

- 🎵 Keeps music/audio playing when MacBook lid is closed
- 🌍 Multilingual: English, 한국어, 日本語, 简体中文, 繁體中文
- 🔔 Lives in your menu bar — always one click away
- ⚡ Lightweight & minimal CPU usage
- 🔒 Only modifies sleep settings — nothing else

---

## 🚀 Installation

### Requirements
- macOS 11.0 or later
- Xcode 13+

### Step 1 — Clone the repository
```bash
git clone https://github.com/minsu0192/SleepToggle.git
cd SleepToggle
```

### Step 2 — Allow passwordless pmset (one-time setup)
```bash
whoami
echo "YOUR_USERNAME ALL=(ALL) NOPASSWD: /usr/bin/pmset" | sudo tee /etc/sudoers.d/sleeptoggle
```

### Step 3 — Build & Run in Xcode

1. Open `SleepToggle.xcodeproj` in Xcode
2. Go to **Signing & Capabilities** → Remove **App Sandbox**
3. Press **▶ Run**
4. Look for the **♩** icon in your menu bar!

---

## 🎮 Usage

1. Click the **♩** icon in the menu bar
2. Toggle **ON** → icon changes to **♪**
3. Close your MacBook lid — music keeps playing! 🎶
4. Toggle **OFF** to return to normal sleep behavior

---

## 🌍 Language Support

English · 한국어 · 日本語 · 简体中文 · 繁體中文

---

## ⚠️ Notes

- The sudoers setup only allows passwordless access to `pmset` — no other commands are affected
- App Sandbox must be disabled for system-level commands

---

## 📄 License

MIT License — feel free to use, modify, and share!
