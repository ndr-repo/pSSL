# pSSL - Passive subdomain discovery over SSL

## Disclaimer
pSSL is a passive enumeration tool. It does not interact with the target domain or its hosts while performing a scan. This is done by downloading the certificate transparancy logs of your target and resolving CNAME records through public services. If you decide to interact with a host following a scan, it is your responsibility to verify you have the proper juristiction. 

**I am not responsible for any legal or criminal proceedings filed against you for using this tool.**

## Description

pSSL is a tool I wrote in PowerShell to enumerate certificate transparancy logs using DoH (DNS over HTTPS). 

This provides an unique list of hostnames and addresses for a glimpse of the network behind a target domain. Identify internal hostnames to maximize asset discovery ops and validate information flow.

## Related Articles
- For more on DoH, check out RFC8484 [here](https://www.rfc-editor.org/rfc/rfc8484.html) or at the [PDF](https://www.rfc-editor.org/rfc/pdfrfc/rfc8484.txt.pdf).
- For more on certificate transparancy, check out this guide at [certificate.transparancy.dev](https://certificate.transparency.dev/howctworks/)

## Coming soon...
I plan to rewrite this in Python to maximize its efficiency and add a few new features :)
