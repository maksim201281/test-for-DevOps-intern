# Fetching the first value passed
port=$1
# Checking the first value for a number and range
if [[ $port =~ ^[0-9]+$ && $port -le 65536 ]]; then
    echo "Port: $port"
else
    echo "Invalid port number or no port number provided. Using default port: 8080"
    port=8080
fi
# Creating array of names without numbers
names=()
for arg in "$@"; do
    if ! [[ $arg =~ ^[0-9]+$ ]]; then
        names+=("$arg")
    fi
done
echo "Names: ${names[@]}"
python test_task_DevOPS.py "${names[@]}" #Executing a python script that generates an HTML page and passing to it the value containing the names for the greeting
docker build -t test_task_docker_image . #building an image from the dockerfile 
docker run -it --rm -p "$port":80 test_task_docker_image # Start the container in interactive mode and open the page on the specified port
