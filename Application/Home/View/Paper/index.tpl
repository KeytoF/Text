<include file='Index/main'/>
<include file='Index/sidebar'/>
<div id='right'>
	<form action="Text/text.html" method="post" accept-charset="utf-8" style="height: 2000px">
		<div id='single'>
			<foreach name="data['single']" item='ds'>
				<strong><$ds.Sin_Ques></strong>
				<input type="radio" name="option" value="A"><$ds.Sin_OptA></radio>
				<input type="radio" name="option" value="B"><$ds.Sin_OptB></radio>
				<input type="radio" name="option" value="C"><$ds.Sin_OptC></radio>
				<input type="radio" name="option" value="D"><$ds.Sin_OptD></radio>
			</foreach>
		</div>
		<div id='multiple'>
			<foreach name="data['multiple']" item='dm'>
				<strong><$dm.Sin_Ques></strong>
				<input type="radio" name="option" value="A"><$dm.Sin_OptA></radio>
				<input type="radio" name="option" value="B"><$dm.Sin_OptB></radio>
				<input type="radio" name="option" value="C"><$dm.Sin_OptC></radio>
				<input type="radio" name="option" value="D"><$dm.Sin_OptD></radio>
				<input type="radio" name="option" value="E"><$dm.Sin_OptE></radio>
				<input type="radio" name="option" value="F"><$dm.Sin_OptF></radio>
				<input type="radio" name="option" value="G"><$dm.Sin_OptG></radio>
				<input type="radio" name="option" value="H"><$dm.Sin_OptH></radio>
			</foreach>
		</div>
		<div id='judge'>
			<foreach name="data['judge']" item='dj'>
				<strong><$dj.Sin_Ques></strong>
				<input type="radio" name="judge" value="1">√</radio>
				<input type="radio" name="judge" value="0">×</radio>
			</foreach>
		</div>
		<div id='cloze'>
			<foreach name="data['cloze']" item='dc'>
				<strong><$dc.Sin_Ques></strong>
				<input type="radio" name="cloze"><$dc.Sin_OptA></radio>
			</foreach>
		</div>
		<div id='answer'>
			<foreach name="data['answer']" item='da'>
				<strong><$da.Sin_Ques></strong>
				<textarea name="answer"></textarea>
			</foreach>
		</div>
		<div style="text-align: center;">
			<input type="submit" name="submit" id='submit' value="下一题">
		</div>
	</form>
</div>
<include file='Index/footer'/>
