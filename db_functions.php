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

function addRowToTable($parcel_type, $sender_id, $receiver_name, $office_id)
{
    global $link;
    openDB();

    mysqli_query($link, "
    INSERT INTO parcels SET 
    parcel_type = '$parcel_type',
    sender_id = '$sender_id',
    receiver_name = '$receiver_name',
    office_id = $office_id,
    sending_date = CURRENT_TIMESTAMP
    ");

    closeDB();

}

function getOfficeAdresses()
{
    global $link;
    openDB();

    $result = mysqli_query($link, "SELECT * FROM postal_offices");

    closeDB();
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

function getAddressByID($id)
{
    global $link;
    openDB();

    $result = mysqli_query($link, "SELECT address FROM postal_offices WHERE office_id='$id'");

    closeDB();
    return mysqli_fetch_row($result);
}

?>
