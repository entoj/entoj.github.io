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
    <c:set var="text_u1" value="${ text }" />
    <c:set var="classes_u1" value="${ moduleClass.concat('__text') }" />

    <c:set var="moduleClass_u1" value="${ 'a-text' }" />

    <p class="${ moduleClass_u1 } ${ classes_u1 }">
        ${ text_u1 }
    </p>

</div>

<!-- /macro m_teaser body -->