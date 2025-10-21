

# UbuntuToggleTouchPad

## 🔧 Introduction

This is a lightweight script designed for Ubuntu (and Debian-based distributions). The script automatically detects the touchpad device and toggles it between enabled and disabled states. It's useful for laptop users who want a quick way to control the touchpad.

---

## ✅ Features

- Automatically detects devices with "Touchpad" in their name — no manual device ID lookup required.
- Provides two script variants: a basic version (no notifications) and a notification version (uses `notify-send`).
- Minimal dependencies: only `xinput` (commonly preinstalled). The notification version requires `notify-send` (usually provided by `libnotify-bin`).
- Simple, ready-to-use, and terminal-friendly.

---

## 🛠 Installation & Usage

### Clone the repository / Download the scripts

```bash
git clone https://github.com/AlbertRX/UbuntuToggleTouchPad.git
cd UbuntuToggleTouchPad
```

### Grant execute permission

```bash
chmod +x TouchPad.sh
chmod +x TouchPadNotifyToggle.sh
```

### Run the script

- Basic version (no notifications):

```bash
./TouchPad.sh
```

- Notification version (recommended):

```bash
./TouchPadNotifyToggle.sh
```

Optional: bind the script to a keyboard shortcut in System Settings → Keyboard → Custom Shortcuts. Use the script's absolute path as the command, for example `~/UbuntuToggleTouchPad/TouchPadNotifyToggle.sh`.

---

## 🎯 Compatibility & Requirements

- OS: Ubuntu or other Debian-based distributions.
- Requirement: `xinput` must be installed.
- Notification variant requires `notify-send` (usually available via `libnotify-bin`).
- The touchpad device must include the word "Touchpad" in the `xinput` list for automatic detection.

---

## 🧑‍💻 Contributing

Issues and Pull Requests are welcome:

- Suggest new features (e.g., support for more touchpad vendors, smarter detection logic, desktop-environment adaptation).
- Report bugs (e.g., detection failures or notification issues).
- Improve portability and readability of the scripts with pull requests.

---

## 📄 License

This project is licensed under the MIT License. See the `LICENSE` file for details. In short: you're free to use, modify, and distribute the code, but please keep the original author attribution.

---

Thank you for using UbuntuToggleTouchPad! If you have questions or suggestions, please open an issue. Let's make it even better together! 
