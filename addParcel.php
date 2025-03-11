<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Добавить посылку</title>
</head>

<body>
    <form action="addParcelController.php" method="POST">
        <div><label for="parcel_type">Тип посылки: <input type="text" name="parcel_type"></label></div>
        <div><label for="sender_id">ID отправителя: <input type="text" name="sender_id"></label></div>
        <div><label for="receiver_name">Имя получателя: <input type="text" name="receiver_name"></label></div>
        <div><label for="receiver_address">Адрес получателя: <input type="text" name="receiver_address"></label></div>
        <div><input type="submit" value="Добавить">
    </form>
</body>

</html>