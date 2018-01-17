<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="entoj" uri="https://entoj.io/entoj"%>

<!-- macro m_teaser parameters -->
<c:set var="classes" value="${ not empty param.classes ? param.classes : '' }" />
<c:set var="text" value="${ not empty param.text ? param.text : '' }" />

<!-- /macro m_teaser parameters -->

<!-- macro m_teaser body -->

<c:set var="moduleClass" value="${ 'm-modal' }" />

<div class="${ moduleClass } ${ classes }">
    <jsp:include page="/includes/atoms/a-text.jsp">
        <jsp:param name="text" value="${ text }" />
        <jsp:param name="classes" value="${ moduleClass.concat('__text') }" />
    </jsp:include>
</div>

<!-- /macro m_teaser body -->