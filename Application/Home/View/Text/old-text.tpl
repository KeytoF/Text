<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
        <title>真题测试</title>
        <meta name="keywords" content="在线测试" />
        <!-- <link rel="stylesheet" type="text/css" href="http://www.sucaihuo.com/jquery/css/common.css" /> -->
        <link rel="stylesheet" type="text/css" href="__CSS__/style.css" />
        <style>
            .demo{width:760px; margin:60px auto 10px auto}
        </style>
        <script type="text/javascript" src="__JS__/jqtext.js"></script> 
        <script type="text/javascript" src="__JS__/quizs.js"></script>
        <script type="text/javascript">
            $(function() {
                $.ajax({
                    url:"__APP__/Text/question",
                    dataType:"json",
                    cache:false,
                    success: function(json) {
                        $('#quiz-container').jquizzy({
                    questions: json,
                    sendResultsURL: '__APP__/Text/result'
                }); 
                    }
                });
                // $('#quiz-container').jquizzy({
                //     questions: <?php echo $json; ?>,
                //     sendResultsURL: '__APP__/Text/result'
                // });
            });
        </script>
    </head>
    <body>
            <div class="demo">
                <div id='quiz-container'></div>
            </div>
    </body>
</html>
