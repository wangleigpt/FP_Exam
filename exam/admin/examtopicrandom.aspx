<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="FP_Exam.Controller.examtopicrandom" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="FangPage.Common" %>
<%@ Import namespace="FangPage.MVC" %>
<%@ Import namespace="FP_Exam" %>
<%@ Import namespace="FP_Exam.Model" %>
<%@ Import namespace="FangPage.WMS.Model" %>
<script runat="server">
protected override void View()
{
	/*方配软件技术有限公司(WMS框架)，官方网站：http://www.fangpage.com  QQ:12677206*/
	base.View();
	ViewBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
	ViewBuilder.Append("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
	ViewBuilder.Append("<head>\r\n");
	ViewBuilder.Append("<meta content=\"text/html; charset=utf-8\" http-equiv=\"content-type\">\r\n");
	ViewBuilder.Append("<title>随机选题设置</title>\r\n");
	ViewBuilder.Append("	" + echo(meta) + "\r\n");
	ViewBuilder.Append("<link rel=\"stylesheet\" type=\"text/css\" href=\"" + echo(adminpath) + "statics/css/admin.css\">\r\n");
	ViewBuilder.Append("<link href=\"" + echo(adminpath) + "statics/css/datagrid.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
	ViewBuilder.Append("<script type=\"text/javascript\" src=\"" + echo(plupath) + "jquery/jquery-1.8.2.min.js\"></");
	ViewBuilder.Append("script>\r\n");
	ViewBuilder.Append("<link type=\"text/css\" href=\"" + echo(plupath) + "layer/skin/layer.css\" rel=\"stylesheet\" id=\"skinlayercss\">\r\n");
	ViewBuilder.Append("<script type=\"text/javascript\" src=\"" + echo(plupath) + "layer/layer.js\"></");
	ViewBuilder.Append("script>\r\n");
	ViewBuilder.Append("<script type=\"text/javascript\" src=\"" + echo(adminpath) + "statics/js/admin.js\"></");
	ViewBuilder.Append("script>\r\n");
	ViewBuilder.Append("<script type=\"text/javascript\">\r\n");
	ViewBuilder.Append("    $(function () {\r\n");
	ViewBuilder.Append("        $(\"#btnsava\").click(function () {\r\n");
	ViewBuilder.Append("            $(\"#action\").val(\"save\");\r\n");
	ViewBuilder.Append("            $(\"#frmpost\").submit();\r\n");
	ViewBuilder.Append("        })\r\n");
	ViewBuilder.Append("        $(\"#btncreate\").click(function () {\r\n");
	ViewBuilder.Append("            if (confirm(\"你确定要随机生成固定题吗？生成后将清除以下的随机设置\")) {\r\n");
	ViewBuilder.Append("                $(\"#action\").val(\"create\");\r\n");
	ViewBuilder.Append("                $(\"#frmpost\").submit();\r\n");
	ViewBuilder.Append("            }\r\n");
	ViewBuilder.Append("        })\r\n");
	string navurl = "exammanage.aspx";
	ViewBuilder.Append("        PageNav(\"" + GetSortNav(sortinfo,navurl).ToString() + "|试题设置," + echo(rawpath) + "examtopicmanage.aspx?examid=" + echo(examinfo.id) + "|随机选题," + echo(rawurl) + "\");\r\n");
	ViewBuilder.Append("    })\r\n");
	ViewBuilder.Append("</");
	ViewBuilder.Append("script>\r\n");
	ViewBuilder.Append("</head>\r\n");
	ViewBuilder.Append("<body>\r\n");
	ViewBuilder.Append("  <form id=\"frmpost\" method=\"post\" name=\"frmpost\" action=\"\">\r\n");
	ViewBuilder.Append("  <input id=\"action\" name=\"action\" value=\"\" type=\"hidden\">\r\n");
	ViewBuilder.Append("  <table class=\"ntcplist\">\r\n");
	ViewBuilder.Append("    <tr>\r\n");
	ViewBuilder.Append("      <td>\r\n");
	ViewBuilder.Append("       <div class=\"newslist\">\r\n");
	ViewBuilder.Append("          <div class=\"newsicon\">\r\n");
	ViewBuilder.Append("            <ul>\r\n");
	ViewBuilder.Append("              <li style=\"background: url(" + echo(adminpath) + "statics/images/save.gif) 2px 6px no-repeat\"><a id=\"btnsava\" href=\"javascript:void()\">保存随机设置</a></li>\r\n");
	ViewBuilder.Append("              <li style=\"background: url(" + echo(webpath) + "" + echo(sitepath) + "/admin/images/question.gif) 2px 6px no-repeat\"><a id=\"btncreate\" href=\"javascript:void()\">生成固定题</a></li>\r\n");
	ViewBuilder.Append("              <li style=\"background: url(" + echo(adminpath) + "statics/images/refresh.gif) 2px 6px no-repeat\"><a href=\"" + echo(rawurl) + "\">刷新</a> </li>\r\n");
	ViewBuilder.Append("              <li style=\"background: url(" + echo(adminpath) + "statics/images/return.gif) 2px 6px no-repeat\"><a href=\"examtopicmanage.aspx?examid=" + echo(examinfo.id) + "&paper=" + echo(paper) + "\">返回</a></li>\r\n");
	ViewBuilder.Append("              <li style=\"float:right; width:auto\"><strong>随机选题：[" + echo(examinfo.name) + "" + GetPaper(paper).ToString() + "]</strong></li>\r\n");
	ViewBuilder.Append("            </ul>\r\n");
	ViewBuilder.Append("          </div>\r\n");
	ViewBuilder.Append("        </div>\r\n");
	ViewBuilder.Append("       </td>\r\n");
	ViewBuilder.Append("    </tr>\r\n");
	ViewBuilder.Append("    <tr>\r\n");
	ViewBuilder.Append("      <td>\r\n");
	ViewBuilder.Append("      <table class=\"datalist\" border=\"1\" rules=\"all\" cellspacing=\"0\">\r\n");
	ViewBuilder.Append("          <tbody>\r\n");
	ViewBuilder.Append("            <tr class=\"thead\">\r\n");
	ViewBuilder.Append("        	  <td align=\"left\">" + echo(examtopic.title) + "(总题数<span style=\"color:Red\">" + echo(examtopic.questions) + "</span>题=固定题<span style=\"color:Red\" id=\"curquestions\">" + echo(examtopic.curquestions) + "</span>题+随机题<span style=\"color:Red\">" + echo((examtopic.questions-examtopic.curquestions)) + "</span>题)</td>\r\n");
	ViewBuilder.Append("              <td>固定题</td>\r\n");
	ViewBuilder.Append("              <td>已设随机题<span style=\"color:#ff0000\">" + echo(examtopic.randoms) + "</span>题</td>\r\n");
	ViewBuilder.Append("            </tr>\r\n");
	string tree = "├";

	loop__id=0;
	foreach(SortInfo sorts in sortlist)
	{
	loop__id++;

	if (ischecked(sorts.id,role.sorts)==false&&roleid!=1)
	{
	continue;
	}//end if
	ViewBuilder.Append("            <tr class=\"tlist\" onmouseover=\"curcolor=this.style.backgroundColor;this.style.backgroundColor='#cbe3f4'\" onmouseout=\"this.style.backgroundColor=curcolor\">\r\n");
	ViewBuilder.Append("              <td align=\"left\">├\r\n");

	if (sorts.icon!="")
	{
	ViewBuilder.Append("              <img src=\"" + echo(sorts.icon) + "\" width=\"16\" height=\"16\">\r\n");
	}
	else if (sorts.subcounts>0)
	{
	ViewBuilder.Append("              <img src=\"" + echo(adminpath) + "statics/images/folders.gif\" width=\"16\" height=\"16\">\r\n");
	}
	else
	{
	ViewBuilder.Append("              <img src=\"" + echo(adminpath) + "statics/images/folder.gif\" width=\"16\" height=\"16\">\r\n");
	}//end if
	ViewBuilder.Append("              " + echo(sorts.name) + "(" + GetQuestionCount(sorts.id).ToString() + ")</td>\r\n");
	ViewBuilder.Append("              <td>" + GetCurCount(sorts.id,0).ToString() + "</td>\r\n");
	ViewBuilder.Append("              <td>\r\n");
	ViewBuilder.Append("                  <input id=\"randomcount_" + echo(sorts.id) + "_0\" name=\"randomcount_" + echo(sorts.id) + "_0\" value=\"" + GetRandomCount(sorts.id,0).ToString() + "\" type=\"text\">  \r\n");
	ViewBuilder.Append("              </td>\r\n");
	ViewBuilder.Append("            </tr>\r\n");
	ViewBuilder.Append("            " + ShowChildSort(sorts.id,tree).ToString() + "\r\n");

	if (sorts.types!=""&&sorts.showtype==1)
	{

	loop__id=0;
	foreach(TypeInfo item in GetTypeList(sorts.types))
	{
	loop__id++;
	ViewBuilder.Append("              <tr class=\"tlist\" onmouseover=\"curcolor=this.style.backgroundColor;this.style.backgroundColor='#cbe3f4'\" onmouseout=\"this.style.backgroundColor=curcolor\">\r\n");
	ViewBuilder.Append("              <td align=\"left\">│  ├<img src=\"" + echo(adminpath) + "statics/images/type.gif\" width=\"16\" height=\"16\">" + echo(item.name) + "(" + GetQuestionCount(sorts.id,item.id).ToString() + ")</td>\r\n");
	ViewBuilder.Append("              <td>" + GetCurCount(sorts.id,item.id).ToString() + "</td>\r\n");
	ViewBuilder.Append("              <td>\r\n");
	ViewBuilder.Append("                  <input id=\"randomcount_" + echo(sorts.id) + "_" + echo(item.id) + "\" name=\"randomcount_" + echo(sorts.id) + "_" + echo(item.id) + "\" value=\"" + GetRandomCount(sorts.id,item.id).ToString() + "\" type=\"text\">  \r\n");
	ViewBuilder.Append("              </td>\r\n");
	ViewBuilder.Append("              </tr>\r\n");
	}//end loop
	}//end if
	}//end loop
	ViewBuilder.Append("          </tbody>\r\n");
	ViewBuilder.Append("        </table>\r\n");
	ViewBuilder.Append("        </td>\r\n");
	ViewBuilder.Append("    </tr>\r\n");
	ViewBuilder.Append("  </table>\r\n");
	ViewBuilder.Append("</form>\r\n");

	if (ispost)
	{
	ViewBuilder.Append("<script type=\"text/javascript\">\r\n");
	ViewBuilder.Append("    layer.msg('" + echo(msg) + "', 0, 1);\r\n");
	ViewBuilder.Append("    var bar = 0;\r\n");
	ViewBuilder.Append("    count();\r\n");
	ViewBuilder.Append("    function count() {\r\n");
	ViewBuilder.Append("        bar = bar + 4;\r\n");
	ViewBuilder.Append("        if (bar < 80) {\r\n");
	ViewBuilder.Append("            setTimeout(\"count()\", 100);\r\n");
	ViewBuilder.Append("        }\r\n");
	ViewBuilder.Append("        else {\r\n");
	ViewBuilder.Append("            window.location.href = \"" + echo(link) + "\";\r\n");
	ViewBuilder.Append("        }\r\n");
	ViewBuilder.Append("    }\r\n");
	ViewBuilder.Append("</");
	ViewBuilder.Append("script>\r\n");
	}//end if
	ViewBuilder.Append("</body>\r\n");
	ViewBuilder.Append("</html>\r\n");
	Response.Write(ViewBuilder.ToString());
}
</script>
