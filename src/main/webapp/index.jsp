<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CD List</title>
    <style>
        table {
            border-collapse: collapse;
            width: 60%;
            margin: 20px auto;
            font-family: Arial, sans-serif;
        }

        th, td {
            border: 1px solid #000;
            padding: 8px 12px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        h2 {
            color: darkcyan;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        button {
            padding: 5px 10px;
            background-color: #0097a7;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 0.9em;
        }

        button:hover {
            background-color: #007c91;
        }
    </style>
</head>
<body>
    <h2>CD List</h2>
    <form action="cart" method="post">
        <input type="hidden" name="action" value="add">
        <table>
            <tr>
                <th>Description</th>
                <th>Price</th>
                <th></th>
            </tr>
            <tr>
                <td>86 (the band) - True Life Songs and Pictures</td>
                <td>$14.95</td>
                <td>
                    <button type="submit" name="product" value="86:14.95">Add To Cart</button>
                </td>
            </tr>
            <tr>
                <td>Paddlefoot - The first CD</td>
                <td>$12.95</td>
                <td>
                    <button type="submit" name="product" value="Paddlefoot1:12.95">Add To Cart</button>
                </td>
            </tr>
            <tr>
                <td>Paddlefoot - The second CD</td>
                <td>$14.95</td>
                <td>
                    <button type="submit" name="product" value="Paddlefoot2:14.95">Add To Cart</button>
                </td>
            </tr>
            <tr>
                <td>Joe Rut - Genuine Wood Grained Finish</td>
                <td>$14.95</td>
                <td>
                    <button type="submit" name="product" value="JoeRut:14.95">Add To Cart</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
