<?php
$usuario = "proyecto";
$contrasena = "123";
$conexion = oci_connect($usuario, $contrasena);

if (!$conexion) {
    $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
}

$consultacamisas = "SELECT * FROM camisas";
$consultapantalones = "SELECT * FROM pantalones";
$consultazapatos = "SELECT * FROM zapatos";
$consultasueteres = "SELECT * FROM sueteres";

$stid_camisas = oci_parse($conexion, $consultacamisas);
$stid_pantalones = oci_parse($conexion, $consultapantalones);
$stid_zapatos = oci_parse($conexion, $consultazapatos);
$stid_sueteres = oci_parse($conexion, $consultasueteres);

oci_execute($stid_camisas);
oci_execute($stid_pantalones);
oci_execute($stid_zapatos);
oci_execute($stid_sueteres);

echo '<h2>Camisas</h2>';
echo '<table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Talla</th>
            <th>Color</th>
            <th>Precio</th>
            <th>Cantidad en Stock</th>
        </tr>';

while ($row = oci_fetch_assoc($stid_camisas)) {
    echo '<tr>
            <td>' . $row['ID'] . '</td>
            <td>' . $row['NOMBRE'] . '</td>
            <td>' . $row['TALLA'] . '</td>
            <td>' . $row['COLOR'] . '</td>
            <td>' . $row['PRECIO'] . '</td>
            <td>' . $row['CANTIDAD_STOCK'] . '</td>
          </tr>';
}

echo '</table>';

echo '<h2>Pantalones</h2>';
echo '<table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Talla</th>
            <th>Color</th>
            <th>Precio</th>
            <th>Cantidad en Stock</th>
        </tr>';

while ($row = oci_fetch_assoc($stid_pantalones)) {
    echo '<tr>
            <td>' . $row['ID'] . '</td>
            <td>' . $row['NOMBRE'] . '</td>
            <td>' . $row['TALLA'] . '</td>
            <td>' . $row['COLOR'] . '</td>
            <td>' . $row['PRECIO'] . '</td>
            <td>' . $row['CANTIDAD_STOCK'] . '</td>
          </tr>';
}

echo '</table>';

echo '<h2>Zapatos</h2>';
echo '<table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Talla</th>
            <th>Color</th>
            <th>Precio</th>
            <th>Cantidad en Stock</th>
        </tr>';

while ($row = oci_fetch_assoc($stid_zapatos)) {
    echo '<tr>
            <td>' . $row['ID'] . '</td>
            <td>' . $row['NOMBRE'] . '</td>
            <td>' . $row['TALLA'] . '</td>
            <td>' . $row['COLOR'] . '</td>
            <td>' . $row['PRECIO'] . '</td>
            <td>' . $row['CANTIDAD_STOCK'] . '</td>
          </tr>';
}

echo '</table>';

echo '<h2>Suéteres</h2>';
echo '<table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Talla</th>
            <th>Color</th>
            <th>Precio</th>
            <th>Cantidad en Stock</th>
        </tr>';

while ($row = oci_fetch_assoc($stid_sueteres)) {
    echo '<tr>
            <td>' . $row['ID'] . '</td>
            <td>' . $row['NOMBRE'] . '</td>
            <td>' . $row['TALLA'] . '</td>
            <td>' . $row['COLOR'] . '</td>
            <td>' . $row['PRECIO'] . '</td>
            <td>' . $row['CANTIDAD_STOCK'] . '</td>
          </tr>';
}

echo '</table>';

oci_free_statement($stid_camisas);
oci_free_statement($stid_pantalones);
oci_free_statement($stid_zapatos);
oci_free_statement($stid_sueteres);

oci_close($conexion);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Product Information</title>
</head>
<body>
    <div class="container">
 
    </div>
</body>
</html>




<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
}

.container {
    max-width: 800px;
    margin: 20px auto;
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

th, td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
}
</style>