port=$1 #the variable gets the first passed value 
#Checking the first value transmitted for the port number
if [[ ! $port =~ ^[1-9][0-9]{0,4}$ || $port -gt 65536 ]]; then
    echo "The port must be a number from 1 to 65536"
    port=8080 # default port value
fi
echo "Port: $port"
shift #shift to the right if the first value transmitted is the port number
names=$@  #contains all the command line arguments passed to the script except for the port number
echo "Names: $names"
python test_task_DevOPS.py "$names" #Executing a python script that generates an HTML page and passing to it the value containing the names for the greeting
docker build -t test_task_docker_image . #building an image from the dockerfile 
docker run -it --rm -p "$port":80 test_task_docker_image # Start the container in interactive mode and open the page on the specified port