import sys #Getting command line arguments from bash
with open("index.html", "w") as file: #  Creating a file for recording
    # Write the page title
    file.write("<html>\n<head>\n<title>My first page</title>\n</head>\n<body>\n")
    # Writing down the contents of the page
    file.write("<html>\n")
    file.write("<h2> Hello, Greetings: : </h2>\n")
    #split the string of passed argument
    for name in sys.argv[1].split(' '):
        file.write(f'<h2>{name}</h2>')
    file.write('<img src="Cat_mem.jpg">\n')
     # Close tags and file
    file.write("</body>\n</html>")