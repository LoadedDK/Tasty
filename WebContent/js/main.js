function list_up(){
	var ru_num = $("#report_table").attr("list_num");
	if (ru_num > 0) {
		$("#r_list_" + ru_num).attr("class", "list_hide");
		$("#r_list_" + ru_num).slideUp();
		ru_num--;
		$("#r_list_" + ru_num).attr("class", "list_show");
		$("#report_table").attr("list_num", ru_num);
	}
	else{
		$("#r_list_0").attr("class", "list_hide");
		$("#r_list_0").slideUp();
		$("#r_list_5").attr("class", "list_show");
		$("#report_table").attr("list_num", 5);
	}
}

function list_down(){
	var rd_num = $("#report_table").attr("list_num");

	if (rd_num < 5) {
		$("#r_list_" + rd_num).attr("class", "list_hide");
		$("#r_list_" + rd_num).slideUp();
		rd_num++;
		$("#r_list_" + rd_num).attr("class", "list_show");
		$("#report_table").attr("list_num", rd_num);
	}
	else{
		$("#r_list_5").attr("class", "list_hide");
		$("#r_list_5").slideUp();
		$("#r_list_0").attr("class", "list_show");
		$("#report_table").attr("list_num", 0);
	}
}