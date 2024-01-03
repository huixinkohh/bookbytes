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

// Assuming you have 'users' table with 'email' and 'password' columns.
// Replace $_POST with real escaped strings for security in production
$userInput = $_POST['userInput'];
$userPassword = $_POST['password'];

// This is vulnerable to SQL injection, use prepared statements in production
$sql = "SELECT * FROM users WHERE email = '$userInput' AND password = '$userPassword'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row (you might want to check for password match here if you're hashing passwords)
    while($row = $result->fetch_assoc()) {
        echo "Success"; // Login success
    }
} else {
    echo "Fail"; // Login fail
}

$conn->close();
?>
