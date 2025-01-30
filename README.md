# pSSL - Passive subdomain discovery over SSL

## Disclaimer

- pSSL is a passive asset discovery scanner. This means it does not interact with the target domain or its hosts while performing a scan. 
- This is done by downloading the certificate transparancy logs of your target and resolving CNAME records through public services.
- If you decide to interact with a host following a scan, it is **your responsibility** to verify you have the proper jurisdiction.

**I am not responsible for any legal or criminal proceedings filed against you for using this tool.**

## Overview

pSSL is a tool I wrote in PowerShell to enumerate certificate transparancy logs using DoH (DNS over HTTPS). 

This provides an unique list of hostnames and addresses for a glimpse of the network behind a target domain. Identify internal hostnames to maximize asset discovery and validate information flow.

## Getting Started
pSSL is written for Windows and has a few dependencies from [GnuWin32](https://gnuwin32.sourceforge.net/).

Luckily, I wrote a tool for installing everything you need. You can run these scripts [from source](https://github.com/ndr-repo/gnuwin32_Scan-Download/), or use the [compiled executable binary](https://github.com/ndr-repo/gnuwin32_Scan-Download/releases/tag/v1.0.0).

If you would like to download the dependencies ad-hoc, you'll need to install gawk from [here](https://gnuwin32.sourceforge.net/packages/gawk.htm) and grep from [here](https://gnuwin32.sourceforge.net/packages/grep.htm).

**Quickstart Steps**:
1. Download and run my compiled installer for grep, sed, & awk dependancies
2. Verify the tools are added to your [environment variables](https://www.howtogeek.com/787217/how-to-edit-environment-variables-on-windows-10-or-11/)
3. Clone the pSSL repository
4. Run pSSL. If you are having issues accessing the dependencies from your environment vars, verify they are set and reboot your machine.

## Related Articles
- For more on DoH, check out RFC8484 [here](https://www.rfc-editor.org/rfc/rfc8484.html) or at the [PDF](https://www.rfc-editor.org/rfc/pdfrfc/rfc8484.txt.pdf).
- For more on certificate transparency, check out this guide from [certificate.transparancy.dev](https://certificate.transparency.dev/howctworks/).
- For more on CNAME record resolution, check out this article from [Cloudflare](https://www.cloudflare.com/learning/dns/dns-records/dns-cname-record/).

## Demonstration & Usage
You can find a video on my [Obsidian Publish](https://publish.obsidian.md/weekndr-sec/GitHub/pSSL/Demo/Video) showcasing pSSL generating 889 unique IPs for a domain in around 3 minutes.

![pSSL_ctDownload](https://github.com/user-attachments/assets/3fdda20b-dbb8-4098-93c4-fa5bafbf3d5b)
![pSSL_resolving](https://github.com/user-attachments/assets/b16bd707-5434-400e-8621-8a4b86280085)
![pSSL_tableCreation2](https://github.com/user-attachments/assets/e0720bf8-d99b-4da0-8f15-91b588162857)
![allMyTools](https://github.com/user-attachments/assets/16cd5559-8d7f-4195-8979-35983e48be72)

## Coming soon...
pSSL in Python for optimized scan times and implementation of new features!

## Support
- If you find use from this, consider supporting my work on [Ko-fi](https://ko-fi.com/weekndr_sec). 
- As of this release, I'm currently consulting full-time and get paid by the project, not by my time.
