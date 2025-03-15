<?PHP
include 'db_functions.php';

$table = getTable();
$oneRow = getRowFromTable(5);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Посылки</title>
</head>

<body>
    <a href="addParcel.php">Добавить посылку</a>
    <table>
        <caption>Посылки</caption>
        <th>ID</th>
        <th>Тип посылки</th>
        <th>ID отправителя</th>
        <th>Имя получателя</th>
        <th>Адрес получателя</th>
        <th>ID офиса</th>
        <th>Дата отправки</th>
        <th>Дата получения</th>
        <?php foreach ($table as $parcel) {
            echo "<tr>";
            foreach ($parcel as $key => $val) {
                if ($key == 'receiving_date' && is_null($val)) {
                    echo "<td>Не получено</td>";
                } else if ($key == 'receiver_address') {
                    $address = getAddressByID($parcel['office_id'])[0];
                    echo "<td>$address</td>";
                } else {
                    echo "<td>$val</td>";
                }
            }
            $parcel_id = $parcel['parcel_id'];
            echo "<td><a href=\"controllerDeleteRow.php?id=$parcel_id\">Удалить</a></td>";
            echo "</tr>";
        } ?>
    </table>
    <hr>
    <table>
        <caption>Посылка</caption>
        <th>ID</th>
        <th>Тип посылки</th>
        <th>ID отправителя</th>
        <th>Имя получателя</th>
        <th>Адрес получателя</th>
        <th>ID офиса</th>
        <th>Дата отправки</th>
        <th>Дата получения</th>
        <?php foreach ($oneRow as $parcel) {
            echo "<tr>";
            foreach ($parcel as $val) {
                echo "<td>$val</td>";
            }
            echo "</td>";
        } ?>
    </table>
</body>

</html>
