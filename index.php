<?php
$servername = "localhost:3306";
$username = "massinissa";
$password = "root";
$dbname = "test";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "UPDATE compteur SET cpt = cpt + 1";
$result = $conn->query($sql);


$sql = "SELECT * FROM compteur";
$result = $conn->query($sql);

    while($row = $result->fetch_assoc()) {
        echo "- Compteur: " . $row["cpt"]."</br>";
        echo "<hr>";
    }


$conn->close();

?>
