using System;
using System.Text;
using System.Web;
using System.Web.UI;

public partial class Main : System.Web.UI.MasterPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		Page.Title = GetPageTitle();
	}

	protected bool IsSelected(SiteMapNode node)
	{
		return SiteMap.CurrentNode == node || SiteMap.CurrentNode.IsDescendantOf(node);
	}

	public string GetPageTitle()
	{
		StringBuilder sb = new StringBuilder();

		SiteMapNode node = SiteMap.CurrentNode;
		do
		{
			SiteMapNode parentNode = node.ParentNode;

			// Exclude category names from title
			if (!string.IsNullOrEmpty(node.Url))
			{
				sb.Insert(0, node.Title);

				// Add dash between nodes
				if (parentNode != null)
				{
					sb.Insert(0, "&nbsp;&mdash;&nbsp;");
				}
			}
			node = parentNode;
		}
		while (node != null);

		return sb.ToString();
	}

	public string GetSecondHeader()
	{
		int level = 0;
		SiteMapNode currentNode = SiteMap.CurrentNode;
		SiteMapNode node = currentNode;
		while (node != null)
		{
			level++;
			node = node.ParentNode;
		}

		if (level == 3)
		{
			return string.Format("<h1 class=\"header2\">{0}</h1>", currentNode.Title);
		}
		else if (level == 4)
		{
			return string.Format("<h1 class=\"header2\"><a href=\"{0}\">{1}</a><span class=\"delimiter\">&nbsp;/&nbsp;</span>{2}</h1>",
				ResolveClientUrl(currentNode.ParentNode.Url), currentNode.ParentNode.Title, currentNode.Title);
		}
		return "";
	}
}
