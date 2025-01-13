# pSSL - Passive subdomain discovery over SSL

## Disclaimer

- pSSL is a passive asset discovery scanner. This means it does not interact with the target domain or its hosts while performing a scan. 
- This is done by downloading the certificate transparancy logs of your target and resolving CNAME records through public services.
- If you decide to interact with a host following a scan, it is **your responsibility** to verify you have the proper juristiction. 

**I am not responsible for any legal or criminal proceedings filed against you for using this tool.**

## Overview

pSSL is a tool I wrote in PowerShell to enumerate certificate transparancy logs using DoH (DNS over HTTPS). 

This provides an unique list of hostnames and addresses for a glimpse of the network behind a target domain. Identify internal hostnames to maximize asset discovery and validate information flow.

## Getting Started
pSSL is written for Windows and has a few dependancies from [GnuWin32](https://gnuwin32.sourceforge.net/).

Luckily, I wrote a tool for installing everything you need. You can run these scripts [from source](https://github.com/ndr-repo/gnuwin32_Scan-Download/), or use the [compiled executable binary](https://github.com/ndr-repo/gnuwin32_Scan-Download/releases/tag/v1.0.0).

If you would like to download the dependancies ad-hoc, you'll need to install gawk from [here](https://gnuwin32.sourceforge.net/packages/gawk.htm) and grep from [here](https://gnuwin32.sourceforge.net/packages/grep.htm).

## Related Articles
- For more on DoH, check out RFC8484 [here](https://www.rfc-editor.org/rfc/rfc8484.html) or at the [PDF](https://www.rfc-editor.org/rfc/pdfrfc/rfc8484.txt.pdf).
- For more on certificate transparancy, check out this guide from [certificate.transparancy.dev](https://certificate.transparency.dev/howctworks/).
- For more on CNAME record resolution, check out this article from [Cloudflare](https://www.cloudflare.com/learning/dns/dns-records/dns-cname-record/).

## Coming soon...
pSSL in Python for optimized scan times and implementation of new features :)

## Support
If you find use from this, consider supporting my work on [Ko-fi](https://ko-fi.com/weekndr_sec). Im currently consulting full-time and get paid by the project, not by my time.
