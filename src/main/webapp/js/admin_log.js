function click_accounts(){
	var text_log_on_block1 = document.getElementById("text_log_on_block1");
	text_log_on_block1.style.display = "block";
	var text_log_on_block2 = document.getElementById("text_log_on_block2");
	text_log_on_block2.style.display = "none";
	var text_log_on1_left = document.getElementById("text_log_on1_left");
	text_log_on1_left.style.color = "#FF6700";
	var text_log_on1_right = document.getElementById("text_log_on1_right");
	text_log_on1_right.style.color = "gray";
}
function click_QR(){
	var text_log_on_block2 = document.getElementById("text_log_on_block2");
	text_log_on_block2.style.display = "block";
	var text_log_on_block1 = document.getElementById("text_log_on_block1");
	text_log_on_block1.style.display = "none";
	var text_log_on1_left = document.getElementById("text_log_on1_left");
	text_log_on1_left.style.color = "gray";
	var text_log_on1_right = document.getElementById("text_log_on1_right");
	text_log_on1_right.style.color = "#FF6700";
}