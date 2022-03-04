<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Signin Template · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/bootstrap.min.css">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
          .email_ok{color:blue; display: none;}
.email_already{color:red; display: none;}
      .nick_ok{color:blue; display: none;}
.nick_already{color:red; display: none;}
      
    </style>

    
    <!-- Custom styles for this template -->
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/signin.css">
  </head>
  <body class="text-center">
 
    <!-- 롤판.dog 기본 이미지 및 폰트 -->
  
<main class="form-signin">
  <form>
    <img class="mb-4" src="${pageContext.request.contextPath}/resources/asset/image/login/dog.png" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">롤판.DOG</h1>

    <div style="float:left">
      <h5>기본정보입력</h5>
    </div>

    <div style="clear:left;">
      <textarea style="background-color:ivory; resize:none; width: 100%; height: 80px;  font: size 14px;">회원가입을 위해서 이메일 인증이 진행되며, 인증이 완료되기 전까지 회원가입이 완료가 되지 않습니다.</textarea>
    </div>
    
<div class="form-floating">
      <input type="email" class="form-control" id="mem_email_id" name="mem_email_id" placeholder="이메일 주소" required oninput = "emailcheck()" />
      <label  for="mem_email_id">이메일 주소</label>
    </div>
    <span class="email_ok">사용 가능한 이메일입니다.</span><br>
    <span class="email_already">이미 가입된 이메일입니다.</span>
    <div class="form-floating">
      <input type="text" class="form-control" id="mem_nickname" name="mem_nickname" placeholder="닉네임" required oninput = "nickcheck()">
      <label for="mem_nickname">닉네임</label>
    </div>
    <span class="nick_ok">사용 가능한 닉네임 입니다.</span><br>
    <span class="nick_already">이미 가입된 닉네임 입니다.</span>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
      <label for="floatingPassword">비밀번호</label>
    </div>
    
    <div class="capcha" id=capchacon style="display:inline;">
      <img src="/captcha"><br>

	<input type="text" id="userin" name="userin">
	<input type="button" id="capchavalid" value="전송">	
<input type="button" id="capchaRefresh" value="새로고침">	

    </div> 

<div style="padding-top: 10px;">
  <div style="width:50%; float:left;">
  <button class="btn btn-lg btn-primary" type="button" onclick = "location.href = 'login'" style="border-color:white; float:center; width: 80%; color: black; background-color: grey; ">취소</button>
</div>
<div style="width:50%; float:right;">    
<button class="btn btn-lg btn-primary" type="submit" style="float:center; width: 80%;" onclick = "location.href = 'join_certifyForm'">가입하기</button>
</div>
</div>  
  </form>
</main>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script>
	    $('#capchavalid').click(function () {
	    	if($('#userin').val()==""){
				alert("문자 또는 숫자를 입력하세요");
				
				return false;
			} 
			$.ajax({
				type:"post",
				dataType:"text",
				async:false,
				url:"http://localhost:8090/captchacheck",
				data:{id:$('#userin').val()},
				success: function(data, textStatus){
					if(result=="true"){
						alert("정상입니다");
						$('#capchacon').attr("display", 'inline');
					} else {
						alert("문자 또는 숫자를 다시 확인하세요");
						$('#capchacon').attr("display", 'none');
					}
				}
			});
		});
	    </script>

<script>
    function emailcheck(){
        var mem_email_id = $('#mem_email_id').val(); //id값이 "mem_email_id"인 입력란의 값을 저장
        $.ajax({
            url:"http://localhost:8090/emailCheck", //Controller에서 인식할 주소
            type:'post', //POST 방식으로 전달
            
            data:{mem_email_id:mem_email_id},
            success:function(data){ //컨트롤러에서 넘어온 data값을 받는다 
                if(data == "true"){ //true인 경우 사용불가
                    $('.email_ok').css("display","none"); 
                    $('.email_already').css("display", "inline-block");
                } else { // 사용가능
                	 $('.email_ok').css("display", "inline-block"); 
                     $('.email_already').css("display","none");
                }
            }
        });
    }
 </script>

 <script>
    function nickcheck(){
        var mem_nickname = $('#mem_nickname').val(); //id값이 "mem_nickname"인 입력란의 값을 저장
        $.ajax({
            url:"http://localhost:8090/nickCheck", //Controller에서 인식할 주소
            type:'post', //POST 방식으로 전달
            
            data:{mem_nickname:mem_nickname},
            success:function(data){ //컨트롤러에서 넘어온 data값을 받는다 
                if(data == "true"){ //true인 경우 사용불가
                    $('.nick_ok').css("display","none"); 
                    $('.nick_already').css("display", "inline-block");
                } else { // 사용가능
                	 $('.nick_ok').css("display", "inline-block"); 
                     $('.nick_already').css("display","none");
                }
            }
        });
    }
 </script>
</body>
</html>
