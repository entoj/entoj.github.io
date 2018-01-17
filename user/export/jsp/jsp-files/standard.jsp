<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="entoj" uri="https://entoj.io/entoj"%>

<!-- macro a_text parameters -->
<c:set
    var="classes"
    value="${ not empty param.classes ? param.classes : '' }" />

<!-- /macro a_text parameters -->

<!-- macro a_text body -->

<c:set var="moduleClass" value="${ 'a-text' }" />

<p class="${ moduleClass } ${ classes }">
    ${ text }
</p>

<!-- /macro a_text body -->