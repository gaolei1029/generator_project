<#include "/macro.include"/> 
<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<#assign pkJavaType = table.idColumn.javaType>   

package ${basepackage}.controller;

import static com.up72.common.CommonUtils.*;
import com.up72.common.CommonConstants;
import java.util.Map;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.up72.framework.base.BaseRestSpringController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.up72.framework.page.Page;
import com.up72.framework.web.scope.Flash;

<#include "/java_imports.include">
<@remarks value="数据提取跳转"/>
@Controller
@RequestMapping("/admin/${component}/${classNameFirstLower}")
public class Admin${className}Controller extends BaseRestSpringController<${className},${pkJavaType}>{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	private ${className}Manager ${classNameFirstLower}Manager;
	
	private final String LIST_ACTION = "redirect:/admin/${component}/${classNameFirstLower}";
	
	/** 
	 * 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写
	 **/
	public void set${className}Manager(${className}Manager manager) {
		this.${classNameFirstLower}Manager = manager;
	}
	
	/** binder用于bean属性的设置 */
	@InitBinder  
	public void initBinder(WebDataBinder binder) {  
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));  
	}
	   
	/**
	 * 增加了@ModelAttribute的方法可以在本controller方法调用前执行,可以存放一些共享变量,如枚举值,或是一些初始化操作
	 */
	@ModelAttribute
	public void init(ModelMap model) {
		//model.put("now", new java.sql.Timestamp(System.currentTimeMillis()));
	}
	
	/** 列表  
	  * @throws IOException */
	@RequestMapping
	@SuppressWarnings({ "unchecked" })
	public String index(ModelMap model,${className}Query query,HttpServletRequest request,HttpServletResponse response) throws IOException {
		Page page = this.${classNameFirstLower}Manager.findPage(query);
		
		 this.addShowLabelAttrbite("/admin/${component}/${classNameFirstLower}", request, response);
		
		model.addAllAttributes(toModelMap(page, query));
		return "/admin/${component}/${classNameFirstLower}/index";
	}
	
	/** 显示 */
	@RequestMapping(value="/{id}")
	public String show(ModelMap model,@PathVariable ${pkJavaType} id) throws Exception {
		${className} ${classNameFirstLower} = (${className})${classNameFirstLower}Manager.getById(id);
		model.addAttribute("${classNameFirstLower}",${classNameFirstLower});
		return "/admin/${component}/${classNameFirstLower}/show";
	}

	/** 进入新增 */
	@RequestMapping(value="/new")
	public String _new(ModelMap model,${className} ${classNameFirstLower},HttpServletRequest request,HttpServletResponse response) throws Exception {
		model.addAttribute("${classNameFirstLower}",${classNameFirstLower});
		return "/admin/${component}/${classNameFirstLower}/new";
	}
	
	/** 保存新增,@Valid标注spirng在绑定对象时自动为我们验证对象属性并存放errors在BindingResult  */
	@RequestMapping(method=RequestMethod.POST)
	public String create(ModelMap model,@Valid ${className} ${classNameFirstLower},BindingResult errors,HttpServletRequest request,HttpServletResponse response) throws Exception {
		if(errors.hasErrors()) {
			return  "/admin/${component}/${classNameFirstLower}/new";
		}
		
		${classNameFirstLower}Manager.save(${classNameFirstLower});
		Flash.current().success(CREATED_SUCCESS); //存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}
	
	/** 编辑 */
	@RequestMapping(value="/{id}/edit")
	public String edit(ModelMap model,@PathVariable ${pkJavaType} id) throws Exception {
		${className} ${classNameFirstLower} = (${className})${classNameFirstLower}Manager.getById(id);
		model.addAttribute("${classNameFirstLower}",${classNameFirstLower});
		return "/admin/${component}/${classNameFirstLower}/edit";
	}
	
	/** 选项卡编辑 */
	@RequestMapping(value="/{id}/tabEdit")
	public String tabEdit(ModelMap model,@PathVariable ${pkJavaType} id) throws Exception {
		${className} ${classNameFirstLower} = (${className})${classNameFirstLower}Manager.getById(id);
		model.addAttribute("${classNameFirstLower}",${classNameFirstLower});
		return "/admin/${component}/${classNameFirstLower}/tab_edit";
	}
	
	
	/** 选项卡显示 */
	@RequestMapping(value="/{id}/tabShow")
	public String tabShow(ModelMap model,@PathVariable ${pkJavaType} id) throws Exception {
		${className} ${classNameFirstLower} = (${className})${classNameFirstLower}Manager.getById(id);
		model.addAttribute("${classNameFirstLower}",${classNameFirstLower});
		return "/admin/${component}/${classNameFirstLower}/tab_show";
	}
	
	/** 保存更新,@Valid标注spirng在绑定对象时自动为我们验证对象属性并存放errors在BindingResult  */
	@RequestMapping(value="/{id}",method=RequestMethod.PUT)
	public String update(ModelMap model,@PathVariable ${pkJavaType} id,@Valid ${className} ${classNameFirstLower},BindingResult errors,HttpServletRequest request,HttpServletResponse response) throws Exception {
		if(errors.hasErrors()) {
			return "/admin/${component}/${classNameFirstLower}/edit";
		}
		
		${classNameFirstLower}Manager.update(${classNameFirstLower});
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}
	
	/** 删除 */
	@RequestMapping(value="/{id}",method=RequestMethod.DELETE)
	public String delete(ModelMap model,@PathVariable ${pkJavaType} id) {
		${classNameFirstLower}Manager.removeById(id);
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

	/** 批量删除 */
	@RequestMapping(method=RequestMethod.DELETE)
	public String batchDelete(ModelMap model,@RequestParam("items") ${pkJavaType}[] items) {
		for(int i = 0; i < items.length; i++) {
			${classNameFirstLower}Manager.removeById(items[i]);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}
	
}

