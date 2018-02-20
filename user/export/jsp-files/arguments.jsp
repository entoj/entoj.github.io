<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="entoj" uri="https://entoj.io/entoj"%>

<!-- macro m_imagetext parameters -->
<c:set var="image" value="${ not empty param.image ? param.image : '' }" />
<c:set var="label" value="${ not empty param.label ? param.label : '' }" />
<c:set var="classes" value="${ not empty param.classes ? param.classes : '' }" />

<!-- /macro m_imagetext parameters -->

<!-- macro m_imagetext body -->

<div class="m-imagetext ${ classes }">
    <img src="${ image }" class="m-imagetext__image" />
    <jsp:include page="/includes/atoms/a-text.jsp">
        <jsp:param name="label" value="${ label }" />
        <jsp:param name="classes" value="${ 'custom' }" />
    </jsp:include>
</div>

<!-- /macro m_imagetext body -->