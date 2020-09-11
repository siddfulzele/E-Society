<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top" style="text-transform: uppercase;">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">E-SOCIETY</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
              <li class="nav-item">
              <a class="nav-link" href="index.jsp">home</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="../#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Collection
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">

                <a class="dropdown-item" href="maintenancecollection.jsp">Maintenance</a>
                <a class="dropdown-item" href="othercollection.jsp">Others</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="../#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Create
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="newmember.jsp">Member</a>
                <a class="dropdown-item" href="newcommittee.jsp">Committee</a>
                <a class="dropdown-item" href="newmaintenance.jsp">Maintenance</a>
                <a class="dropdown-item" href="newevent.jsp">Events</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="../#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Report
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">

                <a class="dropdown-item" href="mainreport.jsp">Maintenance</a>
                <a class="dropdown-item" href="eventreport.jsp">Event</a>
              </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Welcome <%=session.getAttribute("admin_name")%></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logout.jsp">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>