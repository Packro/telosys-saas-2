package org.telosys.saas.servlet;

import org.pac4j.core.context.J2EContext;
import org.pac4j.core.profile.ProfileManager;
import org.pac4j.core.profile.UserProfile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet to manage the log process
 */
@WebServlet("/login/*")
public class login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        J2EContext context = new J2EContext(request, response);
        ProfileManager<UserProfile> manager = new ProfileManager<>(context);
        UserProfile profile = manager.get(true);
        // Case : no user are authenticated
        if (profile == null) {
            // case : the user tries to login for the first time
            if (request.getSession().getAttribute("numberOfTry") == null) {
                request.getSession().setAttribute("numberOfTry", 1);
                response.sendRedirect("/login.jsp");
            } else {
                int numberOfTry = (int) request.getSession().getAttribute("numberOfTry");
                // the user tries 3 times to login
                if (numberOfTry >= 3) {
                    request.getSession().setAttribute("error", "You reach the limit of login try.");
                    response.sendRedirect("/");
                } else {
                    request.getSession().setAttribute("error", "Incorrect username or password.");
                    request.getSession().setAttribute("numberOfTry", ++numberOfTry);
                    response.sendRedirect("/login.jsp");
                }
            }
        } else {
            // A user is already authenticated
            response.sendRedirect("/workspace");
        }
    }
}
