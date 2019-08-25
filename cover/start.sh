service docker start;
echo "starting docker...";
sleep 30s;
docker build -t autograding_image vmms/;
service supervisor start;
