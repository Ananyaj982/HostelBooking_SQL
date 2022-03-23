import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="user",
  passwd="=pwd",
  database="two"
)

mycursor = mydb.cursor()

def executeScriptsFromFile(filename):
    # Open and read the file as a single buffer
    fd = open(filename, 'r')
    sqlFile = fd.read()
    fd.close()

    # all SQL commands (split on ';')
    sqlCommands = sqlFile.split(';')

    # Execute every command from the input file
    for command in sqlCommands:
        # This will skip and report errors
        # For example, if the tables do not yet exist, this will skip over
        # the DROP TABLE commands
        try:
            mycursor.execute(command)
        except OperationalError:
            print("Command skipped ")
executeScriptsFromFile(QUERIES.sql)


