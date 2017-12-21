$().ready(function () {
    validateRule();
});

$.validator.setDefaults({
    submitHandler: function () {
        update();
    }
});

function update() {
    $.ajax({
        cache: true,
        type: "POST",
        url: "/system/sysDept/update",
        data: $('#signupForm').serialize(),// 你的formid
        async: false,
        error: function (request) {
            parent.layer.alert("Connection error");
        },
        success: function (data) {
            if (data.code == 0) {
                parent.layer.msg("操作成功");
                parent.reLoad();
                var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                parent.layer.close(index);

            } else {
                parent.layer.alert(data.msg)
            }

        }
    });

}

function validateRule() {
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#signupForm").validate({
        rules: {
            name: {
                required: true
            },
            srcName: {
                required: true
            }
        },
        messages: {
            name: {
                required: icon + "请输入分类名"
            },
            srcName: {
                required: icon + "请选择所属公司"
            }
        }
    })
}

//打开公司列表
function openSrc() {
    layer.open({
        type: 2,
        title: '公司列表',
        content: '/system/sysDept/deptSrc',
        area: ['480px', '90%'],
        success: function (layero, index) {
            //var body = layer.getChildFrame('.ico-list', index);
            console.log(layero, index);
        }
    });
}