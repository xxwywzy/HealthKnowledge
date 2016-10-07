/**
 * Created by wangzheyu on 2016/9/22.
 */
$(function () {
    var btn = $("#tag_select_complete");
    btn
        .click(function () {
            $("#tag_selected").show();
            if (!$("#tag1").is(":hidden")) {
                if ($("#male_selected").hasClass("btn-primary")) {
                    $("input[name='tag1_to_be_send']").val("男性");
                } else if ($("#female_selected").hasClass(
                        "btn-primary")) {
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
                } else if ($("#mid-life_selected").hasClass(
                        "btn-primary")) {
                    $("input[name='tag2_to_be_send']").val("中年");
                } else if ($("#old_selected").hasClass(
                        "btn-primary")) {
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
                } else if ($("#light_selected").hasClass(
                        "btn-primary")) {
                    $("input[name='tag3_to_be_send']").val("过轻");
                } else if ($("#fat_selected").hasClass(
                        "btn-primary")) {
                    $("input[name='tag3_to_be_send']").val("肥胖");
                }
                $("input[name='tag3_to_be_send']").show();
            } else {
                $("input[name='tag3_to_be_send']").hide();
                $("input[name='tag3_to_be_send']").val("");
            }
            var tag1 = $("input[name='tag1_to_be_send']").val();
            var tag2 = $("input[name='tag2_to_be_send']").val();
            var tag3 = $("input[name='tag3_to_be_send']").val();
            $("input[name='tag1_saved']").val(tag1);
            $("input[name='tag2_saved']").val(tag2);
            $("input[name='tag3_saved']").val(tag3);
        });
});
$(function () {
    var btn_male = $("#male_selected");
    btn_male.click(function () {
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
    btn_female.click(function () {
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
$(function () {
    var btn_young = $("#young_selected");
    btn_young.click(function () {
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
    btn_mid.click(function () {
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
    btn_old.click(function () {
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
$(function () {
    var btn_normal = $("#normal_selected");
    btn_normal.click(function () {
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
    btn_light.click(function () {
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
    btn_fat.click(function () {
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
function tag_amount() {
    var amount = 0;
    var a = 1;
    if (!$("#tag1").is(":hidden")) {
        //$("#tag_amount").text("已选"+amount+"/3");
        amount += a;
    }
    if (!$("#tag2").is(":hidden")) {
        amount += a;
    }
    if (!$("#tag3").is(":hidden")) {
        amount += a;
    }
    $("#tag_amount").text("已选标签：" + amount + "/3");
}
function tag_selected_hide() {
    $("input[name='tag1_to_be_send']").val("");
    $("input[name='tag2_to_be_send']").val("");
    $("input[name='tag3_to_be_send']").val("");
    $("#tag_selected").hide();
    var tag1 = $("input[name='tag1_to_be_send']").val();
    var tag2 = $("input[name='tag2_to_be_send']").val();
    var tag3 = $("input[name='tag3_to_be_send']").val();
    $("input[name='tag1_saved']").val(tag1);
    $("input[name='tag2_saved']").val(tag2);
    $("input[name='tag3_saved']").val(tag3);
}