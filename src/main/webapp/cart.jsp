<%@ page import="java.util.*,java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Cart</title>
    <style>
        table { border-collapse: collapse; width: 70%; margin: 20px auto; }
        th, td { border: 1px solid #000; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        h2 { color: darkcyan; text-align: center; }
        button { padding: 5px 10px; }
        .actions { width:70%; margin: 20px auto; text-align: right; }
    </style>
</head>
<body>
<%
    HttpSession sessionCart = request.getSession();
    List<Map<String, Object>> cart = (List<Map<String, Object>>) sessionCart.getAttribute("cart");
    DecimalFormat df = new DecimalFormat("#.00");
%>

<h2>Your cart</h2>
<table>
    <tr>
        <th>Quantity</th>
        <th>Description</th>
        <th>Price</th>
        <th>Amount</th>
        <th></th>
    </tr>
    <%
        double total = 0;
        if (cart != null && !cart.isEmpty()) {
            for (int i = 0; i < cart.size(); i++) {
                Map<String, Object> item = cart.get(i);
                String name = (String) item.get("name");
                double price = (double) item.get("price");
                int quantity = (int) item.get("quantity");
                double amount = price * quantity;
                total += amount;
    %>
    <tr>
        <td>
            <form action="cart" method="post" style="display:inline;">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="index" value="<%= i %>">
                <input type="number" name="quantity" value="<%= quantity %>" min="1" style="width:50px;">
                <button type="submit">Update</button>
            </form>
        </td>
        <td><%= name %></td>
        <td>$<%= df.format(price) %></td>
        <td>$<%= df.format(amount) %></td>
        <td>
            <form action="cart" method="post" style="display:inline;">
                <input type="hidden" name="action" value="remove">
                <input type="hidden" name="index" value="<%= i %>">
                <button type="submit">Remove Item</button>
            </form>
        </td>
    </tr>
    <% } } else { %>
    <tr>
        <td colspan="5">Your cart is empty</td>
    </tr>
    <% } %>
</table>

<div class="actions">
    <p><strong>Total: $<%= df.format(total) %></strong></p>
    <button onclick="window.location='index.jsp'">Continue Shopping</button>
    <button onclick="alert('Checkout process here!')">Checkout</button>
</div>
</body>
</html>
