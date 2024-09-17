# 🚀 WordPress User Enumeration Tool

🔍 A simple and efficient Bash script for enumerating WordPress users using the WordPress REST API. This tool fetches the usernames (`slug` values) from a given WordPress site's `/wp-json/wp/v2/users` endpoint and displays them in a colorful format in the terminal.

![WordPress Security](https://www.wordfence.com/wp-content/uploads/2020/11/WordPress-Security-Header.jpg)

## 🌟 Features

- 🎯 **Easy to Use**: Just provide the WordPress website URL, and the tool will enumerate the users.
- 🌈 **Colorful Output**: Displays results in a colored and easy-to-read format.
- 🪶 **Lightweight**: Minimal dependencies; works with standard Linux tools.

![Terminal Output](https://www.aterminaloutputexampleimage.com/example-terminal-output.png)

## ⚙️ Prerequisites

- 🖥️ **Bash Shell**: This script is written in Bash and should work on any Unix-like operating system.
- 🌐 **curl**: Ensure `curl` is installed to make HTTP requests.

## 📥 Installation

1. Clone this repository or download the `wp-enumeration.sh` script.
2. Make the script executable:

   ```bash
   chmod +x wp-enumeration.sh
  
🚀 Usage
Run the script in your terminal:

```bash
./wp-enumeration.sh
```
OR 
```bash
echo domain.com | ./wp-enumeration.sh
```
```bash
echo all_urls.txt | ./wp-enumeration.sh
```
You will be prompted to enter the website URL:

```python

-------------------------------------
 WordPress User Enumeration Tool
-------------------------------------
Website (e.g., example.com): example.com
Enumerating users at example.com/wp-json/wp/v2/users ...
Found users:
- admin
- editor
- subscriber
```
📘 Example
To enumerate users from example.com, simply run the script and enter the domain when prompted. The tool will display the usernames found on the WordPress site in a colorful and formatted output.

🛠️ Keywords
WordPress, User Enumeration, WordPress Security, Bash Script, Security Tools, Ethical Hacking, Penetration Testing, Cybersecurity, Web Application Security, WordPress REST API

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.







