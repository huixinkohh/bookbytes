<?php
// Replace with your actual database credentials
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bookbytes";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Collect input from http request
$name = $_POST['name'];
$email = $_POST['email'];
// In production, consider hashing the password
$password = $_POST['password'];

// Check if user already exists
$checkEmailQuery = "SELECT * FROM users WHERE email = '$email'";
$checkResult = $conn->query($checkEmailQuery);

if ($checkResult->num_rows > 0) {
    // User exists
    echo "User already exists";
} else {
    // User doesn't exist, proceed with registration
    // This is vulnerable to SQL injection, use prepared statements in production
    $sql = "INSERT INTO users (name, email, password) VALUES ('$name', '$email', '$password')";

    if ($conn->query($sql) === TRUE) {
        echo "Success"; // Registration success
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>
