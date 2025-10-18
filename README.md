# 🐚 Shell Utility Toolkit

> A **modular, beginner-to-advanced shell script toolkit** for Linux/Unix systems.  
> Includes system monitoring, disk management, backups, logs, network checks, and CI/CD-ready automated testing.

[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![Shell](https://img.shields.io/badge/Shell-Bash-informational)](https://www.gnu.org/software/bash/)

---

## 📂 Project Structure

```

Shell-utility-toolkit/
├── toolkit.sh            # Main menu-driven toolkit
├── utils/                # Individual utility scripts
│   ├── backup.sh
│   ├── cleanup.sh
│   ├── cpu_monitor.sh
│   ├── disk_alert.sh
│   ├── disk_usage.sh
│   ├── log_analysis.sh
│   ├── log_monitor.sh
│   ├── memory_monitor.sh
│   ├── network_check.sh
│   ├── security_audit.sh
│   ├── service_check.sh
│   ├── system_info.sh
│   └── user_monitor.sh
├── tests/
│   └── test_toolkit.sh   # Automated CI/CD test script
├── reports/              # Optional test reports
├── test_results.log      # Test logs
└── README.md             # This file

````

---

## ⚙️ Features

| Script | Description |
|--------|-------------|
| `system_info.sh` | Displays OS, kernel, and hardware info |
| `cpu_monitor.sh` | Monitors CPU usage and load |
| `memory_monitor.sh` | Checks memory usage and alerts |
| `disk_usage.sh` | Shows disk usage for mounted filesystems |
| `disk_alert.sh` | Sends alert if disk usage crosses threshold |
| `backup.sh` | Automated backup of directories |
| `cleanup.sh` | Cleans temporary files and logs |
| `log_monitor.sh` | Monitors live logs (`tail -f`) |
| `log_analysis.sh` | Analyzes log files for errors/warnings |
| `network_check.sh` | Checks connectivity and network stats |
| `security_audit.sh` | Performs basic security checks |
| `service_check.sh` | Verifies service status and health |
| `user_monitor.sh` | Tracks logged-in users and activity |
| `test_toolkit.sh` | Runs automated CI/CD tests for all scripts |

> ✅ All scripts support `--test` flag for automated CI/CD execution.

---

## 🛠 Installation

```bash
git clone https://github.com/yourusername/shell-utility-toolkit.git
cd shell-utility-toolkit
chmod +x toolkit.sh utils/*.sh tests/*.sh
````

---

## 🚀 Usage

### Run the main toolkit

```bash
./toolkit.sh
```

* Follow the interactive menu to access utilities.

### Run automated tests

```bash
./tests/test_toolkit.sh
```

* Logs saved in `test_results.log`.
* Progress bars show real-time execution.

---

## 🔧 CI/CD Integration

* Fully CI/CD-ready via `tests/test_toolkit.sh`.
* Can be integrated with **GitHub Actions**, **Jenkins**, or other pipelines.

Example GitHub Actions workflow:

```yaml
name: Shell Toolkit CI/CD

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  lint_and_test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install ShellCheck
        run: sudo apt-get install -y shellcheck
      - name: Lint Shell Scripts
        run: shellcheck $(find . -type f -name "*.sh")
      - name: Run CI/CD Tests
        run: ./tests/test_toolkit.sh
```

---

## 📖 Requirements

* Linux / macOS / WSL (Windows Subsystem for Linux)
* Bash 4.0+
* `timeout` command (usually included in coreutils)

---

## 📝 Contribution

1. Fork the repository
2. Create a new branch (`feature/new-script`)
3. Add your script in `utils/` and support `--test` mode
4. Update `tests/test_toolkit.sh` to include your script
5. Submit a pull request

---

## 📜 License

MIT License © 2025

---

## 🎯 Goals

* Help beginners learn shell scripting through real-world examples
* Provide a CI/CD-ready modular toolkit
* Encourage contribution and collaborative development

