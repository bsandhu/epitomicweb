ssh root@45.55.192.142 'mkdir ~/epitomicweb';
scp * root@45.55.192.142:~/epitomicweb;
scp -r server root@45.55.192.142:~/epitomicweb;
scp -r site root@45.55.192.142:~/epitomicweb;
