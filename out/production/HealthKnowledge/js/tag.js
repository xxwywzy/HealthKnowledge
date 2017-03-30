$(function() {
	var btn = $(".kno-select");// 用class最后一个单词就行了？
	btn.click(function() {
		var par = $(this).parent();
		var head = par.prev();
		var name = head.children(".kno_name").text();
		var time = par.children(".kno_time").text();
		var dis = par.children(".kno_dis").text();
		var link = par.children(".kno_pic").attr("src");
		if ($(this).hasClass("btn-reset")) {
			$(".selected").removeClass("btn-primary");
			$(".selected").addClass("btn-reset");
			$(".selected").text("选择");
			$(".selected").removeClass("selected");
			$(this).removeClass("btn-reset");
			$(this).addClass("selected");
			$(this).addClass("btn-primary");
			$(this).text("已选");
			$("#kno_selected_name").text(name);
			$("#kno_selected_time").text(time);
			$("#kno_selected_pic").attr("src", link);
			$("#kno_selected_dis").text(dis);
			$("#kno_selected").show();
		} else if ($(this).hasClass("btn-primary")) {
			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$(this).text("选择");
			$("#kno_selected").hide();
		}
		$("input[name='name_saved']").val(name);
	});
});
$(function() {
	var btn = $("#tag_select_complete");
	btn.click(function() {
		$("#tag_selected").show();
		if (!$("#tag1").is(":hidden")) {
			if ($("#male_selected").hasClass("btn-primary")) {
				$("input[name='tag1_to_be_send']").val("男性");
			} else if ($("#female_selected").hasClass("btn-primary")) {
				$("input[name='tag1_to_be_send']").val("女性");
			}
			$("input[name='tag1_to_be_send']").show();
		} else {
			$("input[name='tag1_to_be_send']").hide();
			$("input[name='tag1_to_be_send']").val("");
		}
		if (!$("#tag2").is(":hidden")) {
			if ($("#young_selected").hasClass("btn-primary")) {
				$("input[name='tag2_to_be_send']").val("青年");
			} else if ($("#mid-life_selected").hasClass("btn-primary")) {
				$("input[name='tag2_to_be_send']").val("中年");
			} else if ($("#old_selected").hasClass("btn-primary")) {
				$("input[name='tag2_to_be_send']").val("老年");
			}
			$("input[name='tag2_to_be_send']").show();
		} else {
			$("input[name='tag2_to_be_send']").hide();
			$("input[name='tag2_to_be_send']").val("");
		}
		if (!$("#tag3").is(":hidden")) {
			if ($("#normal_selected").hasClass("btn-primary")) {
				$("input[name='tag3_to_be_send']").val("正常");
			} else if ($("#light_selected").hasClass("btn-primary")) {
				$("input[name='tag3_to_be_send']").val("过轻");
			} else if ($("#fat_selected").hasClass("btn-primary")) {
				$("input[name='tag3_to_be_send']").val("肥胖");
			}
			$("input[name='tag3_to_be_send']").show();
		} else {
			$("input[name='tag3_to_be_send']").hide();
			$("input[name='tag3_to_be_send']").val("");
		}
		if (!$("#tag4").is(":hidden")) {
			if ($("#hypertension_selected").hasClass("btn-primary")) {
				$("input[name='tag4_to_be_send']").val("高血压");
			} else if ($("#diabetes_selected").hasClass("btn-primary")) {
				$("input[name='tag4_to_be_send']").val("糖尿病");
			} else if ($("#hyperlipidemia_selected").hasClass("btn-primary")) {
				$("input[name='tag4_to_be_send']").val("高血脂");
			} else if ($("#stroke_selected").hasClass("btn-primary")) {
				$("input[name='tag4_to_be_send']").val("脑卒中");
			} else if ($("#chd_selected").hasClass("btn-primary")) {
				$("input[name='tag4_to_be_send']").val("冠心病");
			}
			$("input[name='tag4_to_be_send']").show();
		} else {
			$("input[name='tag4_to_be_send']").hide();
			$("input[name='tag4_to_be_send']").val("");
		}
		var tag1 = $("input[name='tag1_to_be_send']").val();
		var tag2 = $("input[name='tag2_to_be_send']").val();
		var tag3 = $("input[name='tag3_to_be_send']").val();
		var tag4 = $("input[name='tag4_to_be_send']").val();
		$("input[name='tag1_saved']").val(tag1);
		$("input[name='tag2_saved']").val(tag2);
		$("input[name='tag3_saved']").val(tag3);
		$("input[name='tag4_saved']").val(tag4);
	});
});
$(function() {
	var btn_male = $("#male_selected");
	btn_male.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#female_selected").hasClass("btn-primary")) {
				$("#female_selected").removeClass("btn-primary");
				$("#female_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag1").show();
			$("#tag1").val("性别：男性");

		} else if ($(this).hasClass("btn-primary")) {

			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag1").hide();
		}
		tag_amount();
	});
	var btn_female = $("#female_selected");
	btn_female.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#male_selected").hasClass("btn-primary")) {
				$("#male_selected").removeClass("btn-primary");
				$("#male_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag1").show();
			$("#tag1").val("性别：女性");

		} else if ($(this).hasClass("btn-primary")) {
			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag1").hide();
		}
		tag_amount();
	});
});
$(function() {
	var btn_young = $("#young_selected");
	btn_young.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#mid-life_selected").hasClass("btn-primary")) {
				$("#mid-life_selected").removeClass("btn-primary");
				$("#mid-life_selected").addClass("btn-reset");
			} else if ($("#old_selected").hasClass("btn-primary")) {
				$("#old_selected").removeClass("btn-primary");
				$("#old_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag2").show();
			$("#tag2").val("年龄：青年");

		} else if ($(this).hasClass("btn-primary")) {

			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag2").hide();
		}
		tag_amount();
	});
	var btn_mid = $("#mid-life_selected");
	btn_mid.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#young_selected").hasClass("btn-primary")) {
				$("#young_selected").removeClass("btn-primary");
				$("#young_selected").addClass("btn-reset");
			} else if ($("#old_selected").hasClass("btn-primary")) {
				$("#old_selected").removeClass("btn-primary");
				$("#old_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag2").show();
			$("#tag2").val("年龄：中年");

		} else if ($(this).hasClass("btn-primary")) {

			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag2").hide();
		}
		tag_amount();
	});

	var btn_old = $("#old_selected");
	btn_old.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#mid-life_selected").hasClass("btn-primary")) {
				$("#mid-life_selected").removeClass("btn-primary");
				$("#mid-life_selected").addClass("btn-reset");
			} else if ($("#young_selected").hasClass("btn-primary")) {
				$("#young_selected").removeClass("btn-primary");
				$("#young_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag2").show();
			$("#tag2").val("年龄：老年");

		} else if ($(this).hasClass("btn-primary")) {

			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag2").hide();
		}
		tag_amount();
	});
});
$(function() {
	var btn_normal = $("#normal_selected");
	btn_normal.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#light_selected").hasClass("btn-primary")) {
				$("#light_selected").removeClass("btn-primary");
				$("#light_selected").addClass("btn-reset");
			} else if ($("#fat_selected").hasClass("btn-primary")) {
				$("#fat_selected").removeClass("btn-primary");
				$("#fat_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag3").show();
			$("#tag3").val("体重：正常");

		} else if ($(this).hasClass("btn-primary")) {

			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag3").hide();
		}
		tag_amount();
	});
	var btn_light = $("#light_selected");
	btn_light.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#normal_selected").hasClass("btn-primary")) {
				$("#normal_selected").removeClass("btn-primary");
				$("#normal_selected").addClass("btn-reset");
			} else if ($("#fat_selected").hasClass("btn-primary")) {
				$("#fat_selected").removeClass("btn-primary");
				$("#fat_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag3").show();
			$("#tag3").val("体重：过轻");

		} else if ($(this).hasClass("btn-primary")) {

			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag3").hide();
		}
		tag_amount();
	});

	var btn_fat = $("#fat_selected");
	btn_fat.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#normal_selected").hasClass("btn-primary")) {
				$("#normal_selected").removeClass("btn-primary");
				$("#normal_selected").addClass("btn-reset");
			} else if ($("#light_selected").hasClass("btn-primary")) {
				$("#light_selected").removeClass("btn-primary");
				$("#light_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag3").show();
			$("#tag3").val("体重：肥胖");

		} else if ($(this).hasClass("btn-primary")) {

			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag3").hide();
		}
		tag_amount();
	});
});
$(function() {
	var btn_hypertension = $("#hypertension_selected");
	btn_hypertension.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#diabetes_selected").hasClass("btn-primary")) {
				$("#diabetes_selected").removeClass("btn-primary");
				$("#diabetes_selected").addClass("btn-reset");
			} else if ($("#hyperlipidemia_selected").hasClass("btn-primary")) {
				$("#hyperlipidemia_selected").removeClass("btn-primary");
				$("#hyperlipidemia_selected").addClass("btn-reset");
			}else if ($("#stroke_selected").hasClass("btn-primary")) {
				$("#stroke_selected").removeClass("btn-primary");
				$("#stroke_selected").addClass("btn-reset");
			}else if ($("#chd_selected").hasClass("btn-primary")) {
				$("#chd_selected").removeClass("btn-primary");
				$("#chd_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag4").show();
			$("#tag4").val("疾病：高血压");

		} else if ($(this).hasClass("btn-primary")) {

			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag4").hide();
		}
		tag_amount();
	});
	
	var btn_diabetes = $("#diabetes_selected");
	btn_diabetes.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#hypertension_selected").hasClass("btn-primary")) {
				$("#hypertension_selected").removeClass("btn-primary");
				$("#hypertension_selected").addClass("btn-reset");
			} else if ($("#hyperlipidemia_selected").hasClass("btn-primary")) {
				$("#hyperlipidemia_selected").removeClass("btn-primary");
				$("#hyperlipidemia_selected").addClass("btn-reset");
			}else if ($("#stroke_selected").hasClass("btn-primary")) {
				$("#stroke_selected").removeClass("btn-primary");
				$("#stroke_selected").addClass("btn-reset");
			}else if ($("#chd_selected").hasClass("btn-primary")) {
				$("#chd_selected").removeClass("btn-primary");
				$("#chd_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag4").show();
			$("#tag4").val("疾病：糖尿病");

		}else if ($(this).hasClass("btn-primary")) {

			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag4").hide();
		}
		tag_amount();
	});
	
	var btn_hyperlipidemia = $("#hyperlipidemia_selected");
	btn_hyperlipidemia.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#hypertension_selected").hasClass("btn-primary")) {
				$("#hypertension_selected").removeClass("btn-primary");
				$("#hypertension_selected").addClass("btn-reset");
			} else if ($("#diabetes_selected").hasClass("btn-primary")) {
				$("#diabetes_selected").removeClass("btn-primary");
				$("#diabetes_selected").addClass("btn-reset");
			}else if ($("#stroke_selected").hasClass("btn-primary")) {
				$("#stroke_selected").removeClass("btn-primary");
				$("#stroke_selected").addClass("btn-reset");
			}else if ($("#chd_selected").hasClass("btn-primary")) {
				$("#chd_selected").removeClass("btn-primary");
				$("#chd_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag4").show();
			$("#tag4").val("疾病：高血脂");

		}else if ($(this).hasClass("btn-primary")) {

			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag4").hide();
		}
		tag_amount();
	});
	
	var btn_stroke = $("#stroke_selected");
	btn_stroke.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#hypertension_selected").hasClass("btn-primary")) {
				$("#hypertension_selected").removeClass("btn-primary");
				$("#hypertension_selected").addClass("btn-reset");
			} else if ($("#diabetes_selected").hasClass("btn-primary")) {
				$("#diabetes_selected").removeClass("btn-primary");
				$("#diabetes_selected").addClass("btn-reset");
			}else if ($("#hyperlipidemia_selected").hasClass("btn-primary")) {
				$("#hyperlipidemia_selected").removeClass("btn-primary");
				$("#hyperlipidemia_selected").addClass("btn-reset");
			}else if ($("#chd_selected").hasClass("btn-primary")) {
				$("#chd_selected").removeClass("btn-primary");
				$("#chd_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag4").show();
			$("#tag4").val("疾病：脑卒中");

		}else if ($(this).hasClass("btn-primary")) {

			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag4").hide();
		}
		tag_amount();
	});
	
	var btn_chd = $("#chd_selected");
	btn_chd.click(function() {
		if ($(this).hasClass("btn-reset")) {
			if ($("#hypertension_selected").hasClass("btn-primary")) {
				$("#hypertension_selected").removeClass("btn-primary");
				$("#hypertension_selected").addClass("btn-reset");
			} else if ($("#diabetes_selected").hasClass("btn-primary")) {
				$("#diabetes_selected").removeClass("btn-primary");
				$("#diabetes_selected").addClass("btn-reset");
			}else if ($("#stroke_selected").hasClass("btn-primary")) {
				$("#stroke_selected").removeClass("btn-primary");
				$("#stroke_selected").addClass("btn-reset");
			}else if ($("#hyperlipidemia_selected").hasClass("btn-primary")) {
				$("#hyperlipidemia_selected").removeClass("btn-primary");
				$("#hyperlipidemia_selected").addClass("btn-reset");
			}
			$(this).removeClass("btn-reset");
			$(this).addClass("btn-primary");
			$("#tag4").show();
			$("#tag4").val("疾病：冠心病");

		}else if ($(this).hasClass("btn-primary")) {

			$(this).removeClass("btn-primary");
			$(this).addClass("btn-reset");
			$("#tag4").hide();
		}
		tag_amount();
	});
});
function tag_amount() {
	var amount = 0;
	var a = 1;
	if (!$("#tag1").is(":hidden")) {
		// $("#tag_amount").text("已选"+amount+"/3");
		amount += a;
	}
	if (!$("#tag2").is(":hidden")) {
		amount += a;
	}
	if (!$("#tag3").is(":hidden")) {
		amount += a;
	}
	if (!$("#tag4").is(":hidden")) {
		amount += a;
	}
	$("#tag_amount").text("已选标签：" + amount + "/4");
}
function tag_selected_hide() {
	$("input[name='tag1_to_be_send']").val("");
	$("input[name='tag2_to_be_send']").val("");
	$("input[name='tag3_to_be_send']").val("");
	$("input[name='tag4_to_be_send']").val("");
	$("#tag_selected").hide();
	var tag1 = $("input[name='tag1_to_be_send']").val();
	var tag2 = $("input[name='tag2_to_be_send']").val();
	var tag3 = $("input[name='tag3_to_be_send']").val();
	var tag4 = $("input[name='tag4_to_be_send']").val();
	$("input[name='tag1_saved']").val(tag1);
	$("input[name='tag2_saved']").val(tag2);
	$("input[name='tag3_saved']").val(tag3);
	$("input[name='tag4_saved']").val(tag4);
}
function time_selected_hide() {
	$("#select_time").hide();
}
function time_selected_show() {
	$("#select_time").show();
}
$(function() {
	var btn = $("#kno_selected_delete");// 用class最后一个单词就行了？
	btn.click(function() {
		$("#kno_selected").hide();
		$("#kno_selected_name").text("");
		$("#kno_selected_time").text("");
		$("#kno_selected_pic").attr("src", "");
		$("#kno_selected_dis").text("");
		$("input[name='name_saved']").val("");
	});
});
