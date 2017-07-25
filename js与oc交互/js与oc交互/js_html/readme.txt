

最好的方法是：
将压缩包文件解压到某个文件夹。
1.直接使用webview，启用js引擎，来加载ui.html文件，不用修改该文件。
2.使用java代码，调用js的refresh_show_trigger方法，参数即为我们接口返回的json数据。




其他比较麻烦的方法：
1.读取ui.html文件到内存，修改内存里面的内容：
	var json_result = xxxxxx
	将上面这一行的代码修改为
	var json_result = 这里填写我们接口返回的json数据。

2.使用webview，启用js引擎，加载ui.html文件。

现阶段只支持weather，其他类型的数据，只会显示一段文字。

3.页面应该会自动根据数据来呈现(这种方法，只能每次都加载一次html文件才可以，即刷新网页才可以)
	更好的方法是：加载完ui.html文件后，使用代码，调用js的refresh_show_trigger方法。
	这样就不用重新加载页面了。
