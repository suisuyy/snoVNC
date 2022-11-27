 #start audio redirect server 
 ./audioserver/tcpulse  0.0.0.0   10101 &

 #start ws to tcp proxy server,port 8080 seems needs,or chrome not connect other ws port
./websockify/run   localhost:8080 0.0.0.0:10101 --cer ./cert.pem --key key.pem &

#start http-server and open browser to test ,:: for listening at ip6 and ip4 port   
python3 -m http.server --bind ::  8081 

#open http://localhost:8081/test.html
firefox http://localhost:8081/test.html
chromium http://localhost:8081/test.html