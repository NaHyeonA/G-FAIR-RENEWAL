<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>회원탈퇴</title>

    <link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/sub.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/mypage_beforefire.css" rel="stylesheet"  type="text/css">
   
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="/resources/js/fullnav.js"></script>
	<script src="/resources/js/top.js"></script>
	
</head>

<script>
    $(function(){
    	var tmp;
    	
        var subName = $('.subName').text();
        
        $('.chk').each(function(index,obj){
            var t = index;
            var o = $(this).text();
            console.log(t + ':' + o)
            if(o == subName) {
            	tmp = t;
            }
        });

        console.log(tmp)
        
        $('#parent').children().eq(tmp).children().css({
            'font-size': '18px',
            'font-weight':'bold',
            'background':'url(/resources/img/side_li_bg.jpg) no-repeat',
            'background-position': 'right center'
        });
        

    })//end jq
</script>
<script>
    $(function(){
        $('#fireBtn').on('click',function(){
            let form =$('#fireForm');

            form.submit();
        });//onclick

        $('#cancelBtn').on('click',function () {
            location.href="/";
        });//onclick

    })//.jq
</script>

<body>
    <div id="wrap">
 	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div id="container">
            <div id="aside">
                <h2 class="asideMenu">마이페이지</h2>
                <ul id="parent">
                    <li><a class="chk" href="/mypage/myInfo">회원정보변경</a></li>
                    <li><a class="chk" href="/mypage/modifypassword">비밀번호변경</a></li>
                    <li><a class="chk" href="/myBoard/list?memberid=${__LOGIN__.memberid}">내가쓴글</a></li>
                    <li><a class="chk" href="/mypage/replymanage">내가쓴댓글</a></li>
                    <li><a class="chk" href="/mypage/dropauth">회원탈퇴</a></li>
                </ul>

            </div>
            <div id="content">
                <div class="title">
                    <div class="map">home > 마이페이지 > 회원탈퇴</div>
                    <h2 class="subName">회원탈퇴</h2>
                </div>

                <div class="contentIn">
                    <div id="wrapper">
                        <form action="/mypage/fire" method="POST" id="fireForm">
                            <div id="con1">
                                <h3>정말 <strong>탈퇴</strong>하시겠습니까?</h3>
                            </div>
                            <div id="con2">
                                <button type="button" id="fireBtn">탈퇴</button>
                                <button type="button" id="cancelBtn">취소</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>

   	<span id="top_btn">top</span> 
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div> <!--wrap-->
</body>
</html>