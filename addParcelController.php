<?php
include 'db_functions.php';
addRowToTable(
    $_POST['parcel_type'],
    $_POST['sender_id'],
    $_POST['receiver_name'],
    $_POST['receiver_address']
);
header("Location: .");