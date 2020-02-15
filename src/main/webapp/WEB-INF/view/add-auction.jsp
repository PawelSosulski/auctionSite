<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h3>Add new auction</h3>
<sf:form method="post" action="/auction-add" modelAttribute="newAuction">

    <table>
        <tr><td></td><td></td></tr>
        <tr><td><sf:errors path="title"/></td></tr>
        <tr>
            <td>Title:</td>
            <td><sf:input path="title"/></td>
        </tr>
        <tr><td><sf:errors path="description"/></td></tr>
        <tr>
            <td>Description:</td>
            <td><sf:textarea cols="70" rows="15" path="description"/></td>
        </tr>
        <tr><td><sf:errors path="startPrice"/></td></tr>
        <tr>
            <td>Start price:</td>
            <td><sf:input path="startPrice"/></td>
        </tr>
        <tr><td><sf:errors path="buyNowPrice"/></td></tr>
        <tr>
            <td>Buy now price:</td>
            <td><sf:input path="buyNowPrice"/></td>
        </tr>

        <tr>
            <td>Category:</td>
            <td>
                <sf:select path="categoryId">
                    <sf:options items="${categories}"/>
                </sf:select>
            </td>
        </tr>
        <tr>
            <td>Days to end:</td>
            <td>
                <sf:select path="days">
                    <sf:options items="${daysList}"/>
                </sf:select>
            </td>
        </tr>
    </table>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Add</button>
</sf:form>

