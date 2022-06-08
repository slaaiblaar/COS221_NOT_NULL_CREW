We used the MARIADB windows version, so all our commands are for windows.
Our MARIADB service name is MariaDB.

1. To build our application, do the following:
	1.1 Extract our zip into your XAMPP htdocs directory.
	1.2 Create our database as follows:
		1.2.1 Create a new database golf_sportsdb
		1.2.2 Import PA5_Golf_Schema_Populated.sql into your newly created database golf_sportsdb: 
			1.2.2.1 mariadb -u root -p golf_sportsdb < PA5_Golf_Schema_Populated.sql.
	
2. To connect to your golf database and run our application, set up the following environment variables:
	2.1 GOLF_DB_HOST with the value of the host of your MariaDB installation (eg localhost)
	2.2 GOLF_DB_NAME with the value of your golf database (eg golf_sportsdb)
	2.3 GOLF_DB_USERNAME with the value of your username of your MariaDB installation (eg root)
	2.4 GOLF_DB_PASSWORD with the value of your password of your MariaDB installation (eg xxxx)

3. To execute our application, enter the following link in your local browser:
	3.1 https://localhost/COS221_NOT_NULL_CREW/php/home.php

