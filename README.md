My goal is to provide a means of security while having fun.

I have created a default toml-less traefik.yml which has full HSTS capabilities, dynamic DNS resolvers (both for traefik itself and for ACME), enhanced security features, and whitelistings to help with compatibility.

<p align="center">
  <img src="https://github.com/Artiume/docker-swarm/blob/master/A-rating-cert.PNG" width="700"/>

Test your website here!
<br> https://www.ssllabs.com/ssltest/
<br> https://www.grc.com/dns/dns.htm

Here's some good information to learn about 
<br> https://github.com/ssllabs/research/wiki/SSL-and-TLS-Deployment-Best-Practices#25-use-forward-secrecy 
<br> https://scotthelme.co.uk/https-cheat-sheet/
<br> https://www.toptenreviews.com/secure-encryption-methods
<br> https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Project+Homepage
<br> https://openvpn.net/security-advisory/the-voracle-attack-vulnerability/
<br> https://www.cisecurity.org/cis-benchmarks/


I am currently working on creating a frontend and backend traefik which will remove the socket access to the traefik facing the internet.

I want to also get a elevated permissions proxy setup for the system https://github.com/Tecnativa/docker-socket-proxy 
