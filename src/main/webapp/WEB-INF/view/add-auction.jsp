<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<h3>Add new auction</h3>
<form:form method="post" action="/auction-add" modelAttribute="newAuction">

    <table>
        <tr><td></td><td></td></tr>
        <tr><td><form:errors path="title"/></td></tr>
        <tr>
            <td>Title:</td>
            <td><form:input path="title"/></td>
        </tr>
        <tr><td><form:errors path="description"/></td></tr>
        <tr>
            <td>Description:</td>
            <td><form:textarea cols="70" rows="15" path="description"/></td>
        </tr>
        <tr><td><form:errors path="startPrice"/></td></tr>
        <tr>
            <td>Start price:</td>
            <td><form:input path="startPrice"/></td>
        </tr>
        <tr><td><form:errors path="buyNowPrice"/></td></tr>
        <tr>
            <td>Buy now price:</td>
            <td><form:input path="buyNowPrice"/></td>
        </tr>

        <tr>
            <td>Category:</td>
            <td>
                <form:select path="categoryId">
                    <form:options items="${categories}"/>
                </form:select>
            </td>
        </tr>
        <tr>
            <td>Days to end:</td>
            <td>
                <form:select path="days">
                    <form:options items="${daysList}"/>
                </form:select>
            </td>
        </tr>
    </table>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Add</button>
</form:form>

