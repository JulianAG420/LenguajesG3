<?php
$usuario = "Proyecto";
$contrasena = "Grupo3";
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


if (isset($_POST['btnVistaTodasPrendas'])) {
    $consulta_vista = "SELECT * FROM vista_todas_prendas";
} elseif (isset($_POST['btnVistaPrecioAlto'])) {
    $consulta_vista = "SELECT * FROM vista_prendas_precio_alto";
} elseif (isset($_POST['btnVistaStockBajo'])) {
    $consulta_vista = "SELECT * FROM vista_stock_bajo";

} elseif (isset($_POST['btnVistaPrendasAgotadas'])) {
    $consulta_vista = "SELECT * FROM vista_prendas_agotadas";
} 
 elseif (isset($_POST['btnVistaPrendasDescuento'])) {
    $consulta_vista = "SELECT * FROM vista_prendas_descuento";
} elseif (isset($_POST['btnVistaPrendasPrecioDesc'])) {
    $consulta_vista = "SELECT * FROM vista_prendas_precio_desc";
} 

if (isset($consulta_vista)) {
    $stid_vista = oci_parse($conexion, $consulta_vista);
    oci_execute($stid_vista);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda de Ropa</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 1em;
        }

        section {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin: 20px;
        }

        .product-container {
            width: 300px;
            margin: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            margin-top: 15px;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        .button-container {
            margin-top: 20px;
        }

        button {
            padding: 10px;
            font-size: 16px;
            margin: 5px;
        }
    </style>
</head>
<body>

    <header>
        <h1>Tienda de Ropa</h1>
    </header>

    <section>
        <?php
        function displayProducts($title, $stid) {
            echo "<div class='product-container'>";
            echo "<h2>$title</h2>";
            echo '<table border="0">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Talla</th>
                        <th>Color</th>
                        <th>Precio</th>
                        <th>Cantidad en Stock</th>
                    </tr>';

            while ($row = oci_fetch_assoc($stid)) {
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
            echo "</div>";
        }

        displayProducts("Camisas", $stid_camisas);
        displayProducts("Pantalones", $stid_pantalones);
        displayProducts("Zapatos", $stid_zapatos);
        displayProducts("Suéteres", $stid_sueteres);


        if (isset($stid_vista)) {
            echo "<div class='product-container'>";
            echo "<h2>Resultados de la Consulta de Vista</h2>";
            echo '<table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Talla</th>
                        <th>Color</th>
                        <th>Precio</th>
                        <th>Cantidad en Stock</th>
                    </tr>';

            while ($row = oci_fetch_assoc($stid_vista)) {
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
            echo "</div>";
            oci_free_statement($stid_vista);
        }
        ?>
    </section>

    <div class="button-container">
        <form method="post" action="">
            <button type="submit" name="btnVistaTodasPrendas">Ver Todas las Prendas</button>
            <button type="submit" name="btnVistaPrecioAlto">Ver Prendas de Precio Alto</button>
            <button type="submit" name="btnVistaStockBajo">Ver Prendas con Stock Bajo</button>
            <button type="submit" name="btnVistaPrendasAgotadas">Ver Prendas Agotadas</button>
            <button type="submit" name="btnVistaPrendasDescuento">Ver Prendas en Descuento</button>
            <button type="submit" name="btnVistaPrendasPrecioDesc">Ver Prendas por Precio Descendente</button>
        </form>
    </div>

    <?php
    oci_free_statement($stid_camisas);
    oci_free_statement($stid_pantalones);
    oci_free_statement($stid_zapatos);
    oci_free_statement($stid_sueteres);

    oci_close($conexion);
    ?>
</body>
</html>

    <?php