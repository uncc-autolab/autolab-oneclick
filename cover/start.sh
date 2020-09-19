service docker start;
echo "Waiting 30s for docker to start in Tango ...";
sleep 30s;

#Uncomment the following line to build the default autograding image
#docker build -t autograding_image vmms/;

echo "Building autograding VM for ITCS-5152"
docker build -t autograding_itcs_5152 vmms/ITCS-5152/;

echo "Building autograding VM for ITCS-4156"
docker build -t autograding_itcs_4156 vmms/ITCS-4156/;

service supervisor start;
