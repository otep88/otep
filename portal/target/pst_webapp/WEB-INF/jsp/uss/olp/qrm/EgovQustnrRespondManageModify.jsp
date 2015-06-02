<%--
  Class Name : EgovQustnrRespondManageModify.jsp
  Description : 응답자정보 수정 페이지
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
   
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/uss/olp/qrm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%pageContext.setAttribute("crlf", "\r\n"); %>
<html>
<head>
<title>응답자정보 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrRespondManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrRespondManage(){
	
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrRespondManage(){
	location.href = "<c:url value='/uss/olp/qrm/EgovQustnrRespondManageList.do'/>";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrRespondManage(){
	var varFrom = document.qustnrRespondManageVO;

	if(confirm("<spring:message code="common.save.msg" />")){
		varFrom.action =  "<c:url value='/uss/olp/qrm/EgovQustnrRespondManageModify.do'/>";

		varFrom.brth.value = fn_egov_SelectBoxValue('brthYYYY') + "" + fn_egov_SelectBoxValue('brthMM') + "" + fn_egov_SelectBoxValue('brthDD');
		
		if(!validateQustnrRespondManageVO(varFrom)){ 			
			return;
		}else{
			varFrom.submit();
		} 
	}
}
/* ********************************************************
 * 설문지정보 팝업창열기
 ******************************************************** */
 function fn_egov_QustnrManageListPopup_QustnrItemManage(){

 	window.showModalDialog("<c:url value='/uss/olp/qmc/EgovQustnrManageListPopup.do'/>", self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
 	
 }
 /* ********************************************************
  * 설문지문항정보 팝업창열기
  ******************************************************** */
  function fn_egov_QustnrQestnManageListPopup_QustnrItemManage(){

	var sParam = "";
	sParam = sParam + "searchCondition=QESTNR_ID";
	sParam = sParam + "&searchKeyword=" + document.getElementById("qestnrId").value;

  	window.showModalDialog("<c:url value='/uss/olp/qrm/EgovQustnrQestnManageListPopup.do'/>?" + sParam, self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
  	
  }
/* ********************************************************
 * 설문항목정보 팝업창열기
 ******************************************************** */
function fn_egov_QustnrItemManageListPopup_QustnrItemManage(){

	var sParam = "";
	sParam = sParam + "searchCondition=QUSTNR_QESITM_ID";
	sParam = sParam + "&searchKeyword=" + document.getElementById("qestnrQesitmId").value;

  	window.showModalDialog("<c:url value='/uss/olp/qim/EgovQustnrItemManageListPopup.do'/>?" + sParam, self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	
}
/************************************************************************
//셀렉트박스 값 컨트롤 함수
************************************************************************/
function fn_egov_SelectBoxValue(sbName)
{
var FValue = "";
for(var i=0; i < document.getElementById(sbName).length; i++)
{
if(document.getElementById(sbName).options[i].selected == true){

FValue=document.getElementById(sbName).options[i].value;
}
}

return  FValue;
}
</script>
</head>
<body onLoad="fn_egov_init_QustnrRespondManage();">
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- login status start -->
<div id="login_area"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" /></div>
<!-- //login status end -->
<!-- wrap start -->
<div id="wrap"> 
    <!-- header start -->
    <div id="subheader"><c:import url="/sym/mms/EgovMainMenuHead.do" /></div>  
    <!-- //header end -->
    <!--  타이틀 이미지 시작 -->
    <div id="title_img_div"><img src="<c:url value='/'/>images/title_image/img_title05.gif" alt="" /></div>
    <!--  //타이틀 이미지 끝 -->
    <div id="bodywrap">
        <div id="leftmenu_div"><c:import url="/sym/mms/EgovMainMenuLeft.do" /></div>
        <div id="middle_content">
            <!-- 현재위치 네비게이션 시작 -->
            <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>포털서비스관리</li>
                            <li>&gt;</li>
                            <li>설문관리</li>
                            <li>&gt;</li>
                            <li><strong>설문응답결과</strong></li>
                        </ul>
                    </div>
            </div>
            <div id="content_field"><!--contents start-->

			<form:form commandName="qustnrRespondManageVO" name="qustnrRespondManageVO" action="" method="post">
			
			<!-- sub title start -->
            <div><h2>응답자정보 수정</h2></div>
            <!-- sub title end -->


            <!--detail area start -->
            <div class="search_service">
                <div class="search_top_table">
					<table summary="이 표는 응답자정보를 제공하며, 설문관리정보, 성별, 직업, 생년월일, 응답자명, 전화번호 정보로 구성되어 있습니다 .">
					  <tr> 
					    <td class="td_width">설문관리정보<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
					    <c:out value="${fn:replace(resultList[0].qestnrSj , crlf , '<br/>')}" escapeXml="false" />
					    </td>
					  </tr>
					  <tr> 
					    <td class="td_width">성별<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
							<select name="sexdstnCode" title="성별 선택">
							    <option value="">선택</option>
							    <c:forEach items="${comCode014}" var="comCodeList" varStatus="status">
							        <option value="${comCodeList.code}" <c:if test="${comCodeList.code eq resultList[0].sexdstnCode}">selected</c:if>>${comCodeList.codeNm}</option>
							    </c:forEach>  
							</select>
					    </td>
					  </tr>
					  <tr> 
					    <td class="td_width">직업<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
							<select name="occpTyCode" title="직업 선택">
							    <option value="">선택</option>
							    <c:forEach items="${comCode034}" var="comCodeList" varStatus="status">
							        <option value="${comCodeList.code}" <c:if test="${comCodeList.code eq resultList[0].occpTyCode}">selected</c:if>>${comCodeList.codeNm}</option>
							    </c:forEach>  
							</select>
					    </td>
					  </tr>
					  <tr> 
					    <td class="td_width">생년월일<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
					       <select name="brthYYYY" id="brthYYYY" title="년도 선택">
					         <c:forEach var="h" begin="1960" end="2009" step="1">
					            <option value="${h}" <c:if test="${fn:substring(resultList[0].brth, 0, 4) ==  h}">selected</c:if>>${h}</option>
					          </c:forEach>
					       </select>년
					       <select name="brthMM" id="brthMM" title="월 선택">
					         <c:forEach var="h" begin="1" end="12" step="1">
					            <c:choose>
					                <c:when test="${h < 10}">
					                <c:set var="brthMM" value="0${h}"/>
					                </c:when>
					                <c:otherwise>
					                <c:set var="brthMM" value="${h}"/>
					                </c:otherwise>
					            </c:choose>
					            <option value="<c:if test="${h < 10}">0</c:if>${h}" <c:if test="${fn:substring(resultList[0].brth, 4, 6) ==  brthMM}">selected</c:if>><c:if test="${h < 10}">0</c:if>${h}</option>
					          </c:forEach>
					       </select>월
					       <select name="brthDD" id="brthDD" title="일 선택">
					         <c:forEach var="h" begin="1" end="31" step="1">
					            <c:choose>
					                <c:when test="${h < 10}">
					                <c:set var="brthDD" value="0${h}"/>
					                </c:when>
					                <c:otherwise>
					                <c:set var="brthDD" value="${h}"/>
					                </c:otherwise>
					            </c:choose>
					            <option value="<c:if test="${h < 10}">0</c:if>${h}" <c:if test="${fn:substring(resultList[0].brth, 6, 8) ==  brthDD}">selected</c:if>><c:if test="${h < 10}">0</c:if>${h}</option>
					          </c:forEach>
					       </select>일
					       <input name="brth" id="brth" type="hidden" value="">
					    </td>
					  </tr> 
					  <tr> 
					    <td class="td_width">응답자명<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
					        <input name="respondNm" type="text" title="응답자명 입력" size="73" value="${resultList[0].respondNm}" maxlength="50" style="width:120px;">
					        <div><form:errors path="respondNm" cssClass="error" /></div>
					    </td>
					  </tr>
					  <tr> 
					    <td class="td_width">전화번호<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
					      <input name="areaNo" type="text" title="지역번호 입력" size="4" value="${resultList[0].areaNo}" maxlength="4">-
					      <input name="middleTelno" type="text" title="국번 입력" size="4" value="${resultList[0].middleTelno}" maxlength="4">-
					      <input name="endTelno" type="text" size="4" title="번호 입력" value="${resultList[0].endTelno}" maxlength="4">
					      <div><form:errors path="areaNo" cssClass="error" /></div>
					      <div><form:errors path="middleTelno" cssClass="error" /></div>
					      <div><form:errors path="endTelno" cssClass="error" /></div>
					    </td>
					  </tr>
					</table>          
                </div>
            </div>
            <!--detail area end -->
                
            <!-- 목록/저장버튼  시작-->
            <table border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>
            <div class="buttons" align="center" style="margin-bottom:100px">
                <a href="<c:url value='/uss/olp/qrm/EgovQustnrRespondManageList.do'/>">목록</a>
                <input type="submit" value="저장" onclick="fn_egov_save_QustnrRespondManage(document.forms[0]); return false;"/>
            </div>
            </td></tr></table>
            <!-- 목록/저장버튼  끝-->

			<input name="qestnrRespondId" type="hidden" value="${resultList[0].qestnrRespondId}">
			<input name="cmd" type="hidden" value="<c:out value='save'/>">
			</form:form>

            </div><!-- contents end -->
        </div>
    </div>
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //wrap end -->

</body>
</html>