<include file='Index/main'/>
<include file='Index/sidebar'/>
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
<div id='right'>
    <div class="demo">
        <div id='quiz-container'></div>
    </div>
</div>
<include file='Index/footer'/>

