// 鼠标移动到小米手机上 显示div
function show_nav() {
	// console.log("鼠标悬浮之上");
	var nav_div = document.getElementById("nav_div");
	nav_div.style.display = "block";
}
// 鼠标移走，隐藏nav_div
function hid_nav() {
	var nav_div = document.getElementById("nav_div");
	nav_div.style.display = "none";
}
var i = 0;
setInterval(function() {
	// console.log('定时器')
	var lb_div = document.getElementById("lb_div_list");
	i++;
	if (i == 5) {
		lb_div_list.style.left = "1600px";
		i = 0;
	}
	lb_div_list.style.left = lb_div_list.offsetLeft - 1700 + "px";
}, 5000)

function show_phone(e) {
	var id = e.id;
	$("#nav_i" + id).css("display", "block");
	// var nav_i = document.getElementById("nav_i");
	// nav_i.style.display = "block";
}
function out_phone(e) {
	var id = e.id;
	$("#nav_i" + id).css("display", "none");
	// var nav_i = document.getElementById("nav_i");
	// nav_i.style.display = "none";
}

function show_phone1(e) {
	var id = e.id;
	$("#" + id).css("display", "block");

}
function out_phone1(e) {
	var id = e.id;
	$("#" + id).css("display", "none");

}
// var i=0;
// setInterval(function(){
// // console.log('定时器')
// var shangou = document.getElementById("lb_sgxh");
// i++;
// if(i==4){
// lb_sgxh.style.left="1270px";
// i=0;
// }
// lb_sgxh.style.left = lb_sgxh.offsetLeft-1690+"px";
// }
// ,2000)

// var i=0;
// setInterval(function(){
// // console.log('定时器')
// var lb_dianyuan = document.getElementById("lb_sgxh_1");
// i++;
// if(i==5){
// lb_sgxh_1.style.left="2166px";
// i=0;
// }
// lb_sgxh_1.style.left = lb_sgxh_1.offsetLeft-2967+"px";
// }
// ,4000)
