<?php
return array(
	//'配置项'=>'配置值'
	'URL_PATHINFO_DEPR' => '/',								//修改分隔符
	'URL_ROUTER_ON' => true,								//开启路由功能
	'URL_CASE_INSENSITIVE' =>true,
	'TMPL_L_DELIM' => '<{',									//修改左右定界符
	'TMPL_R_DELIM' => '}>',
	'DEFAULT_CHARSET'=> 'utf-8',							//编码设置
	'SESSION_AUTO_START' => true,							//开启SESSION
	// 'URL_HTML_SUFFIX' => 'html',							//伪静态默认为html
	// 'URL_HTML_SUFFIX' => 'html|shmtl|xml', 				//多个用 | 分割伪静态配置
	'VAR_PAGE'=>'page',										//分页变量
	//字段自动进行模糊查询
	'DB_LIKE_FIELDS'=>'Username|Ip|CompanyName|ContactName',
	// 'LOAD_EXT_CONFIG' => 'setting,core,db,webconfig',	//载入额外配置项文件
	'LOAD_EXT_CONFIG' => 'db',								//载入额外配置项文件
	'TOKEN_NAME' => '__hash__',  							// 令牌验证的表单隐藏字段名称
	'TOKEN_TYPE' => 'md5', 									//令牌哈希验证规则 默认为MD5

	'TMPL_TEMPLATE_SUFFIX' => '.tpl',						//模板文件后缀

	// 'SHOW_ERROR_MSG'        =>  false,						//错误提示

	'TMPL_PARSE_STRING' => array(
		'__APP__' => __ROOT__,								// 更改默认的__APP__替换规则
		'__JS__' => __ROOT__.'/Public/js',
		'__CSS__' => __ROOT__.'/Public/css',
		'__IMAGE__' => __ROOT__.'/Public/image',
		'__FOUNDATION__' => __ROOT__.'/Public/foundation-5',
		'__PURE__' => __ROOT__.'/Public/pure-release-0.5.0',
		'__UPLOAD__' => __ROOT__.'/upload',
	),
	'AUTOLOAD_NAMESPACE' => array(    'mod'     => __ROOT__.'mod',),

	'URL_MODEL'=>'2',										//url访问模式为rewrite模式

	'DATA_CACHE_TYPE' => 'File',							//数据缓存类型,支持:File|Db|Apc|Memcache|Shmop|Sqlite|Xcache|Apachenote|Eaccelerator

	'DB_PARAMS' => array(\PDO::ATTR_CASE => \PDO::CASE_NATURAL),
	
	//测试/考试标记
	'Text' => '0',
	'Eext' => '1',

);
?>