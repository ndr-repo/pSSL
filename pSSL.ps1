$targetDomain = Read-Host "Enter the target domain name"
$pwd = Get-Location
(Invoke-WebRequest -Uri "https://crt.sh/?q=%.$targetDomain&output=json" -Method Get -UserAgent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0').Content | Out-File $pwd\$targetDomain-ct-log.json  -Encoding utf8 -Force
get-content $pwd\$targetDomain-ct-log.json | ConvertFrom-Json | Sort-Object -Unique | Sort-Object -Property name_value -Descending | Format-Table -Wrap -AutoSize -Property name_value | grep -o -P "^[a-zA-Z0-9].*" | Sort-Object -Unique | Out-String -Stream
get-content $pwd\$targetDomain-ct-log.json | ConvertFrom-Json | Sort-Object -Unique | Sort-Object -Property name_value -Descending | Format-Table -Wrap -AutoSize -Property name_value | grep -o -P "^[a-zA-Z0-9].*" | Sort-Object -Unique | Out-String -Stream | more
$domainNames = ( get-content $pwd\$targetDomain-ct-log.json | ConvertFrom-Json | Sort-Object -Unique | Sort-Object -Property name_value -Descending | Format-Table -Wrap -AutoSize -Property name_value | grep -o -P "^[a-zA-Z0-9].*" | Sort-Object -Unique | Out-String -Stream )
New-Item -ItemType File $pwd\$targetDomain-enumerated-pssl.txt -Force
foreach ($domainName in $domainNames){ Invoke-RestMethod  -ErrorAction Ignore -Method Get https://dns.google/resolve?name=$domainName | Select-Object -ExpandProperty Answer -ErrorAction Ignore | Format-Table -Wrap -AutoSize -Property "name","data" -HideTableHeaders | Tee-Object $pwd\$targetDomain-enumerated-pssl.txt -Append -ErrorAction Ignore }
Write-Host " "
Write-Host "Formatting Results to Table..." -ForegroundColor Red
Write-Host " "
Get-Content $pwd\$targetDomain-enumerated-pssl.txt | grep "[a-zA-Z0-9]" | Out-File $pwd\$targetDomain-hostname-table-pssl.txt -Force utf8
Get-Content $pwd\$targetDomain-hostname-table-pssl.txt 
Write-Host " "
Write-Host "Parsing source IPv4 addresses..." -ForegroundColor Red
Write-Host " "
Get-Content $pwd\$targetDomain-hostname-table-pssl.txt | awk -F ' ' '{ print $2 }' | grep -o -P "^[0-9].*[.].*[0-9].*[.].*[0-9]"  | Sort-Object -Unique | Out-File $pwd\$targetDomain-enumeration-list-ipv4-addrs.txt utf8 -Force
Get-Content $pwd\$targetDomain-hostname-table-pssl.txt  | awk -F ' ' '{ print $2 }' | grep -o -P "^[0-9].*[.].*[0-9].*[.].*[0-9]"  | Sort-Object -Unique |  awk -F ' ' '{ print }{++cnt} END { print cnt }' 
Write-Host " "
Write-Host "Results saved to the following locations: " -ForegroundColor Red
Write-Host "$pwd\$targetDomain-ct-log.json"
Write-Host "$pwd\$targetDomain-enumerated-pssl.txt"
Write-Host "$pwd\$targetDomain-hostname-table-pssl.txt"
Write-Host "$pwd\$targetDomain-enumeration-list-ipv4-addrs.txt"
Write-Host " "
Write-Host "pSSL: Passive Subdomains over SSL" -ForegroundColor Red
Write-Host "Created by Gabriel H. @weekndr_sec" -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red