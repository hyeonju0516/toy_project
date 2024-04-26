document.addEventListener("DOMContentLoaded", function() {

	let userId = document.getElementById("userId");
	let userPw = document.getElementById("userPw");
	let userPw2 = document.getElementById("userPw2");
	let userName = document.getElementById("userName");
	let userNick = document.getElementById("userNick");
	let userPhone = document.getElementById("userPhone");
	let userEmail = document.getElementById("userEmail");
	let idCheckResult = false;
	
	// id
	userId.onkeyup = function () {
		let checkBtn = document.getElementById("idCheck");
		
		let message = document.getElementById("idMessage");
		let reg = /^[A-Za-z0-9]{3,13}$/;
		
		if(!reg.test(userId.value)) {
			message.innerHTML = "영문 + 숫자 조합으로 3~13자 이내로 작성해 주세요.";
			checkBtn.disabled = true;
			return false;
		} else{
			message.innerHTML = "중복확인을 진행해 주세요.";
			checkBtn.disabled = false;
			return true;
		}
	}
	
	// id 중복확인
	if (document.getElementById("idCheck")) {
		document.getElementById("idCheck").addEventListener("click", function(e) {
			e.preventDefault();
		    if (userId.onkeyup()) {
		        axios
		            .get('/api/user/idCheck?id=' + userId.value)
		            .then((response) => {
		                console.log(response.data);
						let message = document.getElementById("idMessage");
		                if (response.data === "ok") {
		                    message.innerHTML = "사용 가능합니다.";
		                    idCheckResult = true;
							userId.readOnly = true;
							
		                    return true;
		                } else if (response.data === "no") {
		                    message.innerHTML = "이미 사용중인 아이디입니다.";
		                    idCheckResult = false;
						console.log(idCheckResult);
		                    return false;
		                }
	
	
		            }).catch((err) => {
		                alert(`** checkdata 서버연결 실패 => ${err.message}`);
		            });
		    }
		});
	}
	
	// pw
	if(userPw){
		userPw.onkeyup = function () {
			let message = document.getElementById("pwMessage");
			let reg = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=])(?!.*\s).{8,15}$/
		    
			if(!reg.test(userPw.value)) {
				message.innerHTML = "공백 없이 영문 + 숫자 + 특수문자 조합으로 8~15자 이내로 작성해 주세요.";
				return false;
			} else{
				message.innerHTML = "";
				return true;
			}
		}
	}
	
	// pw2
	if(userPw2){
		userPw2.onkeyup = function () {
			let message = document.getElementById("pw2Message");
		    
			if(userPw.value !== userPw2.value) {
				message.innerHTML = "비밀번호가 일치하지 않습니다.";
				return false;
			} else{
				message.innerHTML = "";
				return true;
			}
		}
	}
	
	// name
	userName.onkeyup = function () {
		let message = document.getElementById("nameMessage");
		let reg = /^[a-zA-Z가-힣]{2,20}$/;
	    
		if(!reg.test(userName.value)) {
			message.innerHTML = "2자 이상의 한글 또는 영문으로 작성해 주세요.";
			return false;
		} else{
			message.innerHTML = "";
			return true;
		}
	}
	
	// nickname
	userNick.onkeyup = function () {
		let message = document.getElementById("nickMessage");
		let reg = /^[a-zA-Z가-힣]{3,10}$/;
		
		if(userNick.value.length===0){
			message.innerHTML = "";
			return true;
		}
	    
		if(!reg.test(userNick.value)) {
			message.innerHTML = "3~10 이내의 한글 또는 영문으로 작성해 주세요.";
			return false;
		} else{
			message.innerHTML = "";
			return true;
		}
		
	}
	
	//phone
	userPhone.onkeyup = function () {
		let message = document.getElementById("phoneMessage");
		let reg = /^\d{3}-\d{3,4}-\d{4}$/;
	    
		if(!reg.test(userPhone.value)) {
			message.innerHTML = "하이픈(-)을 포함하여 휴대폰 번호를 작성해 주세요. ex)010-1234-1234";
			return false;
		} else{
			message.innerHTML = "";
			return true;
		}
	}
	
	//email
	userEmail.onkeyup = function () {
		let message = document.getElementById("emailMessage");
		let reg = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
	    
		if(userEmail.value.length===0){
			message.innerHTML = "";
			return true;
		}
		
		if(!reg.test(userEmail.value)) {
			message.innerHTML = "이메일 형식에 맞게 작성해 주세요.";
			return false;
		} else{
			message.innerHTML = "";
			return true;
		}
	}
	
	if (document.getElementById("userJoin")) {
	    document.getElementById("userJoin").onsubmit = function() {
	        if (!userId.onkeyup() || !userPw.onkeyup() || !userPw2.onkeyup() || !userName.onkeyup() ||
	            !userNick.onkeyup() || !userPhone.onkeyup() || !userEmail.onkeyup() || !idCheckResult) {
	            alert("유효성 검사를 확인해 주세요.");
	            return false;
	        } else{
	            return true;
	        }
    	}
	} else if (document.getElementById("userUpdate")) {
	    document.getElementById("userUpdate").onsubmit = function() {
	        if (!userName.onkeyup() || !userNick.onkeyup() || !userPhone.onkeyup() || !userEmail.onkeyup()) {
	            alert("입력값을 확인해 주세요.");
	            return false;
	        } else {
	            return true;
	        }
	    }
	}
	
});