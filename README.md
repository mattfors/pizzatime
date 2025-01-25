# Pizza Time

## Overview
This project is a sandbox for old tech and common old bad patterns with the intent to use this for testing AI conversion to modern frameworks. It includes a utility for running SQL migrations and a simple example of querying the MySQL version.
## Prerequisites
- Java 11 or higher
- Maven
- Docker and Docker Compose

## Environment Variables
Create a `.env` file in the root directory of the project with the following content:
```plaintext
MYSQL_CONNECTION_URL=jdbc:mysql://mysql:3306/your_database
MYSQL_USER=your_username
MYSQL_PASSWORD=your_password
```

## Building the Project
1. Clone the repository:  
```shell
git clone https://github.com/mattfors/pizzatime.git
cd pizzatime
```

2. Build the project using Maven:  
```shell
./mvnw clean install
```

## Starting MySQL with Docker Compose
1. Start the MySQL server using Docker Compose:  
```shell
docker-compose up -d
```

2. Verify that the MySQL server is running:
```shell
docker-compose ps
```

