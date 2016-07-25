<!-- <link rel="stylesheet" type="text/css" href="__PURE__/grids-min.css"> -->
<script>
	$(document).ready(function() {
		$('.mcd-menu li').click(function() {
			$('.mcd-menu li').removeClass();
			$(this).addClass('active');
		});
	});
</script>
<nav class='left'>
	<ul class="mcd-menu">
		<foreach name="sidebarList" item="sL">
			<li><a <if condition="$sL['sub_id']==$id">class="active"<else />class='a'</if>
				href="?id=<{$sL.sub_id}>"><strong><{$sL.sub_name}></strong></a>
			</li>
		</foreach>
	</ul>
</nav>
<!-- <div id='left'>
    <nav id='left'>
        <ul class="mcd-menu">
            <foreach name="sidebarList" item="sL">
                <li><a <if condition="isset($sL['class'])">class="<{$sL.class}>"<else />class='a'</if>
                   href="__APP__/<{$sL.URL}>"><strong><{$sL.sub_name}></strong></a>
                </li>
            </foreach>
        </ul>
    </nav>
</div> -->