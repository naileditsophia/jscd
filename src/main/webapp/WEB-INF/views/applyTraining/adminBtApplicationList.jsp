<%--
  Created by IntelliJ IDEA.
  User: george
  Date: 12/3/23
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Noto+Serif+KR:wght@900&display=swap"
          rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/reset.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/jscdReset.css"/>">
    <link rel="stylesheet" tyep="text/css" href="<c:url value="/css/admin/home.css"/>">
    <link rel="stylesheet" tyep="text/css" href="<c:url value="/css/regist.css"/>">
    <link rel="icon" href="/img/mainlogo.png"/>
    <link rel="apple-touch-icon" href="/img/mainlogo.png"/>
    <title>정석코딩 부트캠프 신청서 관리</title>
    <script>
        let msg = "${msg}";
        if(msg == "DEL_ERR") alert("삭제되었거나 없는 게시물입니다.");
        if(msg == "DEL_OK") alert("성공적으로 삭제되었습니다.");
        if(msg == "WRT_OK") alert("성공적으로 등록되었습니다.");
        if(msg == "MOD_OK") alert("해당 게시물을 정상적으로 수정하였습니다.");
    </script>
</head>
<body>
<header>
    <jsp:include page="../admin/header.jsp"/>
</header>
<div id="adminContent">
    <nav>
        <jsp:include page="../admin/sidebar.jsp"/>
    </nav>
    <main>
        <div id="lectureInfo">
            <div id="infoTitleBox">
                <h1>정석코딩 부트캠프 신청서 관리</h1>
            </div>
            <div id="main_content_controll">
                <div id="lectureSearchBox">
                    <form id="registHead" action="" method="get">
                        <select class="search-option" name="option">
                            <option value="all" ${ah.sa.option=='all' || ah.sa.option=='' ? "selected" : ""}>전체</option>
                            <option value="title" ${ah.sa.option=='title' ? "selected" : ""}>강의 이름</option>
                            <option value="id" ${ah.sa.option=='id' ? "selected" : ""}>신청자 계정</option>
                            <option value="approvalYN" ${ah.sa.option=='approvalYN' ? "selected" : ""}>승인 상태</option>
                        </select>
                        <input type="text" name="keyword" value="${ah.sa.keyword}" placeholder="검색어를 입력해주세요.">
                        <input type="submit" id="btApplicationListSearch" class="cancleBtn" value="검색">
                    </form>
                </div>
                <div id="lectureWriteBox">
                    <%--    <button id="writeBtn" class="btn-write" onclick="location.href='<c:url value="/onlyAdmin/lstRegist/addRegist"/>'">강의 추가하기</button>--%>
                    <input type="button" class="modifyBtn" value="강의 추가" onclick="location.href='<c:url value="/adminManage/lstRegist/addRegist"/>'">
                </div>

            </div>
            <div id="lectureListBox">
                <%--    게시판    --%>
                <table>
                    <tr class="applicationManageTr">
                        <th class="applicationManageTh">신청 번호</th>
                        <th class="applicationManageTh">신청한 강의 이름</th>
                        <th class="applicationManageTh">신청자 계정</th>
                        <th class="applicationManageTh">신청 일시</th>
                        <th class="applicationManageTh">승인 상태</th>
                    </tr>
                    <c:forEach var="btApplicationDto" items="${list}">
                        <tr class="applicationManageTr">
                            <td class="applicationManageTd">${btApplicationDto.stfmNo}</td>
                            <td class="applicationManageTd"><a href="<c:url value='/adminManage/adminBtTraining/read${ah.sa.queryString}&stfmNo=${btApplicationDto.stfmNo}'/>">${btApplicationDto.title}</a></td>
                            <td class="applicationManageTd">${btApplicationDto.id}</td>
                            <td class="applicationManageTd"><fmt:formatDate value="${btApplicationDto.regDate}" pattern="yyyy-MM-dd HH시 mm분 ss초"/></td>
                            <td class="applicationManageTd">${btApplicationDto.approvalYN}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div id="NaviBox">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div> 신청서가 없습니다.</div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ah.showPrev}">
                        <a href="<c:url value='/adminManage/adminBtTraining/list${ah.sa.getQueryString(ah.beginPage-1)}'/>">&lt;&lt;</a>
                    </c:if>

                    <c:forEach var="i" begin="${ah.beginPage}" end="${ah.endPage}">
                        <a href="<c:url value="/adminManage/adminBtTraining/list${ah.sa.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>

                    <c:if test="${ah.showNext}">
                        <a href="<c:url value='/adminManage/adminBtTraining/list${ah.sa.getQueryString(ah.endPage+1)}'/>">&gt;&gt;</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </main>
</div>
</body>
</html>
