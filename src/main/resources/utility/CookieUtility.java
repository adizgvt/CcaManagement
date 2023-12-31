package utility;

import javax.imageio.IIOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CookieUtility {

    public static String getUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String userId = "0";

        if(cookies == null){
            return userId;
        }

        for (Cookie cookie: cookies) {
            if(cookie.getName().equalsIgnoreCase("userId")){
                userId = cookie.getValue();
                break;
            }
        }
        return userId;
    }

    public static String getUserRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String role = "1";

        if(cookies == null){
            return role;
        }

        for (Cookie cookie: cookies) {
            if(cookie.getName().equalsIgnoreCase("role")){
                role = cookie.getValue();
                break;
            }
        }
        return role;
    }
}