<?php
include 'db_functions.php';
deleteRowFromTable($_GET['id']);
header("Location: .");