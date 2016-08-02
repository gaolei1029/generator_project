package com.up72.framework.generator;

/**
 * 
 * @author gaolei
 * @email gaolei@btbu.edu.cn
 */

public class GeneratorMain {
	/**
	 * 请直接修改以下代码调用不同的方法以执行相关生成任务.
	 */
	public static void main(String[] args) throws Exception {
		GeneratorFacade g = new GeneratorFacade();
//		 g.printAllTableNames(); //打印数据库中的表名称

		g.deleteOutRootDir(); // 删除生成器的输出目录
//		 通过数据库表名前缀生成,template为模板的根目录
//		g.generateByTableStart("TEST_","模板/新平台");
//
//
//
		// 自动搜索数据库中的所有表并生成文件,template为模板的根目录
//		g.generateByAllTable("模板/新平台-项目");

		// 根据class类，反向生成
		// g.generateByClass(Blog.class,"template_clazz");
		// 删除生成的文件
//		g.deleteByTable("sample_user", "template_mybatis");

		// 通过数据库表名生成,template为模板的根目录
//		g.generateByTable("SAMPLE_Blog", "template_project");
//		g.generateByTable("member_temp", "模板/新平台");
//		g.generateByTable("ZX_FREIGHT_TMPL", "模板/新平台");
//		g.generateByTable("ZX_ORDER_SHIPPING", "模板/新平台");
		g.generateByTable("TEST_STUDENT", "模板/新平台-项目");
		g.generateByTable("TEST_CLAZZ", "模板/新平台-项目");

		// 打开文件夹
		Runtime.getRuntime().exec(
				"cmd.exe /c start "
						+ GeneratorProperties.getRequiredProperty("outRoot"));

		/**
		 * 将静态资源文件拷贝到代码生成的目录中
		 * @author:menbaoxin
		 * @date:2015-05-20
		 */
		// 用户的当前项目目录
		String customerProductPath = System.getProperty("user.dir")+"\\static\\";

		String mainOutRoot = GeneratorProperties.getRequiredProperty("outRoot") + "\\";
		String projectName = GeneratorProperties.getRequiredProperty("project_name");
		String generatorProductPath = mainOutRoot + projectName+"-parent\\" + projectName + "-web\\src\\main\\webapp\\";
		
		System.out.println("文件原目录：" + customerProductPath);
		System.out.println("拷贝到目录：" + generatorProductPath);

		String stylesCommand = "xcopy " + customerProductPath + "adminStyles " + generatorProductPath + "adminStyles /e";
		String scriptsCommand = "xcopy " + customerProductPath + "scripts " + generatorProductPath + "scripts /e";

		Runtime.getRuntime().exec("cmd /c " + stylesCommand);
		Runtime.getRuntime().exec("cmd /c " + scriptsCommand);
	}
}
