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
	<form action="#" method="post">
    <div class="container">
        <div class="item1">
            <div><img src="img/sns38.jpg" id="img_section"></div>
        </div>
        <div class="item2">
            <div class="item3">
				<a href="#" clase="profile_img"><img src="img/sns6.jpg"></a>
				<a href="#" class="user_nick">user_nick</a>
				<a href="#" class="travel_plan">travel_plan</a>
			</div>
			<div class="item4">
				<input type="text" placeholder="제목을 입력해주세요">
			</div>
            <div class="item5">
				<textarea name="" id="" cols="80" rows="18" placeholder="내용을 입력해주세요"></textarea>
			</div>
            <div class="item6">
				<div><input type="file" id="upload_file" accept="image/*" required=true value="upload" multiple/>
				</div><br>
            </div>
			<div class="item7">
				공개여부 
				<input type="radio" name="reveal_or_private" value="reveal">공개
				<input type="radio" name="reveal_or_private" value="private">비공개
			</div>
            <div class="item8">
				<button>만들기</button>
			</div>
        </div>
    </div>
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