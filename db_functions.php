<?php

$link = false;

function openDB()
{
    global $link;

    $link = mysqli_connect("localhost", "root", "", "postalservice");
    mysqli_query($link, "SET NAMES UTF8");
}

function closeDB()
{
    global $link;
    $link = false;
}

function getTable()
{
    global $link;
    openDB();

    $result = mysqli_query($link, "SELECT * FROM parcels");

    closeDB();
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

function getRowFromTable($row_id)
{
    global $link;
    openDB();

    $result = mysqli_query($link, "SELECT * FROM parcels WHERE parcel_id = $row_id");

    closeDB();
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

function deleteRowFromTable($row_id)
{
    global $link;
    openDB();

    mysqli_query($link, "DELETE FROM parcels WHERE parcel_id = $row_id");

    closeDB();

}

function addRowToTable($parcel_type, $sender_id, $receiver_name, $receiver_address, )
{
    global $link;
    openDB();

    mysqli_query($link, "
    INSERT INTO parcels SET 
    parcel_type = '$parcel_type',
    sender_id = '$sender_id',
    receiver_name = '$receiver_name',
    receiver_address = '$receiver_address',
    office_id = 1,
    sending_date = CURRENT_TIMESTAMP
    ");

    closeDB();

}

?>