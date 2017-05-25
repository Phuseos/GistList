<%@ WebHandler Language="C#" Class="KeepSessionAlive" %>

using System;
using System.Web;
using System.Web.SessionState;

//Handler that checks the session, when called from the Master page (see below) it will keep the session from idle time-out.

public class KeepSessionAlive : IHttpHandler, IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        context.Session["KeepSessionAlive"] = DateTime.Now;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}

/*
JavaScript to put in the Site.Master 
<script lang="javascript" type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
    <script lang="javascript" type="text/javascript">
        $(function () {
            setInterval(KeepSessionAlive, 60000);
        });

        function KeepSessionAlive() {
            $.post("/KeepSessionAlive.ashx", null, function () {
            });
        }
    </script>
*/