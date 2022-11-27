#install depends on ubuntu 2204 if your need
sudo apt -y install tigervnc-scraping-server tigervnc-standalone-server 
sudo apt -y install gstreamer1.0-plugins-bad  python3

#reset  port
killall tcpulse
kill $(lsof -t -i:8080)
kill $(lsof -t -i:8081)
kill $(lsof -t -i:5900)
kill $(lsof -t -i:5800)
kill $(lsof -t -i:10101)



x0vncserver -localhost no   :0 #start vnc server
 ./saudio/audioserver/tcpulse  0.0.0.0   10101    & #start audio server

./saudio/websockify/run   :::8080   localhost:10101 --cer ./cert.pem --key key.pem &  #for audio
./saudio/websockify/run   :::5800   localhost:5900 --cer ./cert.pem --key key.pem  & #for vnc



python3 -m http.server --bind ::  8081  & #start http server 
#then use browser to open 
#http://your_computer_ip:8081/snovnc.html?port=5800&password=yourpasswd