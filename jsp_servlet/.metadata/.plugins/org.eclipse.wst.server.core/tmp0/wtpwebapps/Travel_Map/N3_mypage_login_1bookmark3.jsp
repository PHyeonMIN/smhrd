<%@page import="com.memberDTO.tm_memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./assets/css/New_UploadPost2.css">
</head>
<body>
	<%
		tm_memberDTO dto = (tm_memberDTO)session.getAttribute("dto");
	
	
	%>
	<form action="boardInsert" method="post" enctype="multipart/form-data"> 
	    <div class="container">
	        <div class="item1">
	            <div><img src="phm_img/No_Image.png" id="img_section"></div>
	        </div>
	        <div class="item2">
	            <div class="item3">
					<a href="#" clase="profile_img"><img src="tm_upload/<%=dto.getMb_img()%>"></a>
					<a href="#" class="user_nick"><%=dto.getMb_nickname() %></a>
					<div style="float:right; margin:20px; margin-top:40px; margin-bottom:0px">
						<a href="#" class="travel_plan" style="font-size:15px; color:cornflowerblue;">travel_plan</a>
					</div>
				</div>
				<div class="item4">
					<input type="text" name="tb_titles" placeholder="제목을 입력해주세요">
				</div>
	            <div class="item5">
					<textarea name="tb_content" cols="80" rows="18" placeholder="내용을 입력해주세요"></textarea>
				</div>
	            <div class="item6">
					<div><input type="file" name="tb_file" id="upload_file" accept="image/*" required=true value="upload" multiple/>
					</div><br>
	            </div>
				<div class="item7">
					공개여부 
					<input type="radio" name="tb_open" value="reveal">공개
					<input type="radio" name="tb_open" value="private">비공개
				</div>
	            <div class="item8">
					<button type="submit">만들기</button>
				</div>
	        </div>
	    </div>
    </form>
    
    
    
    
    <script>
        const reader = new FileReader();

        reader.onload = (readerEvent) => {
            document.querySelector("#img_section").setAttribute("src", readerEvent.target.result);
            //파일을 읽는 이벤트가 발생하면 img_section의 src 속성을 readerEvent의 결과물로 대체함
        };

        document.querySelector("#upload_file").addEventListener("change", (changeEvent) => {
            //upload_file 에 이벤트리스너를 장착

            const imgFile = changeEvent.target.files[0];
            reader.readAsDataURL(imgFile);
            //업로드한 이미지의 URL을 reader에 등록
        })
    </script>
</body>
</html>