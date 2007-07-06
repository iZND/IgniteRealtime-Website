<%@ page import="org.jivesoftware.site.Versions,com.jivesoftware.community.webservices.*"%>

<%@ taglib uri="oscache" prefix="cache" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<html>
<head>
<title>Smack API</title>
<meta name="body-id" content="projects" />
<meta name="panel-name" content="smack" />
<style type="text/css" media="screen">
	@import "/styles/interior.css";
</style>
</head>
<body>

	<div id="ignite_subnav">
		<ul>
			<li id="subnav01"><a href="index.jsp" class="ignite_subnav_project">Smack API</a></li>
			<!-- <li id="subnav02"><a href="screenshots.jsp">Screenshots</a></li> -->
			<!-- <li id="subnav03"><a href="plugins.jsp">Plugins</a></li> -->
			<li id="subnav04"><a href="documentation.jsp">Documentation</a></li>
			<li id="subnav05"><a href="http://www.igniterealtime.org/issues/browse/SMACK">Issue Tracker</a></li>
			<li id="subnav06"><a href="http://www.igniterealtime.org/builds/smack/docs/latest/javadoc/">JavaDocs</a></li>
			
		</ul>
	</div>

	<!-- BEGIN body area -->
	<div id="ignite_body">
		
		<!-- BEGIN left column (main content) -->
		<div id="ignite_body_leftcol">
			
			<!-- BEGIN large panel -->
			<!-- 
				if there is no cookie, show this panel
				(there is an 'onload' in the decorator that runs a script from 
				/scripts/ignite.js, may want to change that).
				the cookie is defined by the meta 'panel-name' in the head, and
				set with the onclick of the links below, closePanel().
			-->
			<% boolean panelCookieSet = false;
			   Cookie [] cookies = request.getCookies();
				 if (cookies != null) {
			       for (Cookie cookie: request.getCookies()) {
                if (cookie.getName().equals("smack")) { 
						      panelCookieSet = true;
					      }
				     }
			   }
			%>
			<div id="ignite_bigpanel" <% if (!panelCookieSet) { %> style="display:block" <% } %>>
				<div id="ignite_bigpanel_content" style="width: 630px;">
					<h1 class="smack">Smack API <span><%= Versions.getVersion("smack") %></span></h1>
					<p>
                        Smack is an Open Source XMPP (Jabber) client library for instant messaging and presence.
                        A pure Java library, it can be embedded into your applications to create anything from
                        a full XMPP client to simple XMPP integrations such as sending notification messages
                        and presence-enabling devices.
                    </p>
				</div>
				
				<div id="ignite_bigpanel_close">
					<a href="#" onClick="closePanel('smack'); return false;"></a>
				</div>
				
				<!-- <div id="ignite_bigpanel_screenshot"> -->
					<!-- <img src="/images/ignite_screenshot_openfire.gif" width="210" height="210" alt="" /> -->
					<!-- <a href="screenshots.jsp">More screens</a> -->
				<!-- </div> -->
				
				<div id="ignite_bigpanel_download">
					<a href="/downloads/index.jsp#smack">Download</a> 
					<span>
						<strong>Smack API <%= Versions.getVersion("smack") %></strong> Latest build: June 12, 2006
					</span>
				</div>
				
			</div>
			<!-- END large panel -->
			
			<!-- BEGIN small panel -->
			<!-- 
				if there is a cookie, show this panel
				(same details as above for 'large panel')
			-->
			<div id="ignite_smallpanel" <% if (panelCookieSet) { %> style="display:block" <% } %>>
				<h1 class="smack">Smack API <span><%= Versions.getVersion("smack") %></span></h1>
				<div id="ignite_smallpanel_open">
					<a href="#" onClick="closePanel('smack'); return false;"></a>
				</div>
			</div>
			<!-- END small panel -->
			
			
			<!-- BEGIN home page body content area -->
			<div id="ignite_int_body">

                <% String blogFeedRSS = "/community/blogs/ignite/feeds/tags/smack"; %>
                <!-- BEGIN 'latest blog entries' column -->
				<div id="ignite_int_body_widecol">
					<!-- BEGIN blog header -->
					<div id="ignite_blog_header">
						<span id="ignite_blog_header_label">
							Latest Blog Entries
						</span>
						<div style="float: right;">
                            <span id="ignite_blog_header_rss">
							 	<a href="<%= blogFeedRSS %>"><img src="/images/rss.gif" width="16" height="16" border="0" alt="" /></a>
							</span>
						</div>
					</div>
					<!-- END blog header -->

                    <%-- Show blog feed --%>
                    <cache:cache time="600" key="<%= blogFeedRSS %>">
					<%
					ServiceLocator locator = new ServiceLocator("http://beta.igniterealtime.org/community", "webservices", "webservicesadmin");
					BlogService blogService = locator.getBlogService();
					BlogPostResultFilter bprf = BlogPostResultFilter.createDefaultFilter();
					bprf.setNumResults(5);
					bprf.setTags(new String[] {"smack"});
					BlogPost[] posts = blogService.getBlogPosts(bprf);
					%>
					<% request.setAttribute("posts", posts); %>
					<jsp:include page="/includes/blogposts.jsp" />
                    </cache:cache>
				</div>
				<!-- END 'latest blog entries' column -->
				
			</div>
			<!-- END home page body content area -->
			
		</div>
		<!-- END left column (main content) -->
		
		<!-- BEGIN right column (sidebar) -->
		<div id="ignite_body_rightcol">
			
            <jsp:include page="/includes/sidebar_projectside.jsp">
                <jsp:param name="project" value="smack"/>
            </jsp:include>
			
		</div>
		<!-- END right column (sidebar) -->
	
	</div>
	<!-- END body area -->



</body>
</html>