<%@ Page language="c#" AutoEventWireup="false" EnableViewState="false" Inherits="FangPage.WMS.Admin.userdisplay" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="FangPage.Common" %>
<%@ Import namespace="FangPage.MVC" %>
<%@ Import namespace="FangPage.WMS.Admin" %>
<%@ Import namespace="FangPage.WMS.Model" %>
<script runat="server">
protected override void View()
{
	/*方配软件技术有限责任公司(WMS框架)，官方网站：http://www.fangpage.com  QQ:12677206*/
	base.View();
	ViewBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
	ViewBuilder.Append("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
	ViewBuilder.Append("<head>\r\n");
	ViewBuilder.Append("<meta content=\"text/html; charset=utf-8\" http-equiv=\"content-type\">\r\n");
	ViewBuilder.Append("<title>用户部门排序</title>\r\n");
	ViewBuilder.Append("	" + echo(meta) + "\r\n");
	ViewBuilder.Append("<link rel=\"stylesheet\" type=\"text/css\" href=\"" + echo(webpath) + "" + echo(sitepath) + "/statics/css/admin.css\">\r\n");
	ViewBuilder.Append("<link rel=\"stylesheet\" type=\"text/css\" href=\"" + echo(webpath) + "" + echo(sitepath) + "/statics/css/datagrid.css\">\r\n");
	ViewBuilder.Append("<script type=\"text/javascript\" src=\"" + echo(plupath) + "jquery/jquery.js\"></");
	ViewBuilder.Append("script>\r\n");
	ViewBuilder.Append("<script type=\"text/javascript\" src=\"" + echo(webpath) + "" + echo(sitepath) + "/statics/js/admin.js\"></");
	ViewBuilder.Append("script>\r\n");
	ViewBuilder.Append("<script type=\"text/javascript\">\r\n");
	ViewBuilder.Append("    $(function () {\r\n");
	ViewBuilder.Append("        $(\"#submitsave\").click(function () {\r\n");
	ViewBuilder.Append("            $(\"#formpost\").submit();\r\n");
	ViewBuilder.Append("        })\r\n");
	ViewBuilder.Append("        PageNav(\"用户部门管理,user/departmentmanage.aspx|部门用户排序,user/" + echo(pagename) + "?departid=" + echo(departid) + "\");\r\n");
	ViewBuilder.Append("    })\r\n");
	ViewBuilder.Append("</");
	ViewBuilder.Append("script>\r\n");
	ViewBuilder.Append("</head>\r\n");
	ViewBuilder.Append("<body>\r\n");
	ViewBuilder.Append("<form id=\"formpost\" method=\"post\" name=\"formpost\" action=\"\">\r\n");
	ViewBuilder.Append("  <table class=\"ntcplist\">\r\n");
	ViewBuilder.Append("    <tr>\r\n");
	ViewBuilder.Append("      <td><div class=\"newslist\">\r\n");
	ViewBuilder.Append("          <div class=\"newsicon\">\r\n");
	ViewBuilder.Append("            <ul>\r\n");
	ViewBuilder.Append("              <li style=\"background: url(" + echo(webpath) + "" + echo(sitepath) + "/statics/images/save.gif) 2px 6px no-repeat\"><a id=\"submitsave\" href=\"#\">保存</a></li>\r\n");
	ViewBuilder.Append("              <li style=\"background: url(" + echo(webpath) + "" + echo(sitepath) + "/statics/images/refresh.gif) 2px 6px no-repeat\"><a href=\"userdisplay.aspx?departid=" + echo(departid) + "\">刷新</a> </li>\r\n");
	ViewBuilder.Append("              <li style=\"background: url(" + echo(webpath) + "" + echo(sitepath) + "/statics/images/return.gif) 2px 6px no-repeat\"><a href=\"departmentmanage.aspx\">返回</a> </li>\r\n");
	ViewBuilder.Append("              <li style=\"float:right; width:auto\"><strong>部门用户排序</strong></li>\r\n");
	ViewBuilder.Append("            </ul>\r\n");
	ViewBuilder.Append("          </div>\r\n");
	ViewBuilder.Append("        </div>\r\n");
	ViewBuilder.Append("      </td>\r\n");
	ViewBuilder.Append("    </tr>\r\n");
	ViewBuilder.Append("    <tr>\r\n");
	ViewBuilder.Append("      <td>\r\n");
	ViewBuilder.Append("        <table class=\"datalist\" border=\"1\" rules=\"all\" cellspacing=\"0\">\r\n");
	ViewBuilder.Append("          <tbody>\r\n");
	ViewBuilder.Append("            <tr class=\"thead\">\r\n");
	ViewBuilder.Append("              <td width=\"50%\"> 用户姓名 </td>\r\n");
	ViewBuilder.Append("              <td width=\"50%\"> 排序顺序 </td>\r\n");
	ViewBuilder.Append("            </tr>\r\n");

	loop__id=0;
	foreach(UserInfo item in userlist)
	{
	loop__id++;
	ViewBuilder.Append("            <tr class=\"tlist\" onmouseover=\"curcolor=this.style.backgroundColor;this.style.backgroundColor='#cbe3f4'\" onmouseout=\"this.style.backgroundColor=curcolor\">\r\n");
	ViewBuilder.Append("              <td align=\"left\">" + echo(item.realname) + "</td>\r\n");
	ViewBuilder.Append("              <td><input type=\"text\" style=\"width:200px;\" name=\"display_" + echo(item.id) + "\" id=\"display_" + echo(item.id) + "\" value=\"" + loop__id.ToString() + "\"></td>\r\n");
	ViewBuilder.Append("            </tr>\r\n");
	}//end loop
	ViewBuilder.Append("          </tbody>\r\n");
	ViewBuilder.Append("        </table>\r\n");
	ViewBuilder.Append("      </td>\r\n");
	ViewBuilder.Append("    </tr>\r\n");
	ViewBuilder.Append("  </table>\r\n");
	ViewBuilder.Append("</form>\r\n");
	ViewBuilder.Append("</body>\r\n");
	ViewBuilder.Append("</html>\r\n");
	Response.Write(ViewBuilder.ToString());
}
</script>
