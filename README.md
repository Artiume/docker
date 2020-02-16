My goal is to provide a means of security while having fun.

I have created a default toml-less traefik.yml which has full HSTS capabilities, dynamic DNS resolvers (both for traefik itself and for ACME), enhanced security features, and whitelistings to help with compatibility.

<p align="center">
  <img src="https://github.com/Artiume/docker-swarm/blob/master/A-rating-cert.PNG" width="700"/>

Test your website here!
<br> https://www.ssllabs.com/ssltest/
<br> https://www.grc.com/dns/dns.htm
<br> https://securityheaders.com/

Dns Leak Tests
https://github.com/macvk/dnsleaktest/blob/master/README.md 
https://www.privateinternetaccess.com/forum/discussion/23924/easy-quick-dns-and-ipv6-leak-testing-via-command-prompt-line-method-no-browser-or-website-needed

Here's some good information to learn about 
<br> https://github.com/ssllabs/research/wiki/SSL-and-TLS-Deployment-Best-Practices#25-use-forward-secrecy 
<br> https://scotthelme.co.uk/https-cheat-sheet/
<br> https://www.toptenreviews.com/secure-encryption-methods
<br> https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Project+Homepage
<br> https://openvpn.net/security-advisory/the-voracle-attack-vulnerability/
<br> https://www.cisecurity.org/cis-benchmarks/
<br> https://matt.traudt.xyz/posts/vpn-tor-not-mRikAa4h.html
<br> https://en.wikipedia.org/wiki/Salt_(cryptography)
<br> https://blog.qualys.com/ssllabs/2012/09/14/crime-information-leakage-attack-against-ssltls
<br> https://tonsky.me/blog/disenchantment/

I am currently working on creating a frontend and backend traefik which will remove the socket access to the traefik facing the internet.

I want to also get a elevated permissions proxy setup for the system https://github.com/Tecnativa/docker-socket-proxy 

Reading :
https://www.wired.com/story/notpetya-cyberattack-ukraine-russia-code-crashed-the-world/
