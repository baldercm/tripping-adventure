package controllers;

import play.*;
import play.mvc.*;

import views.html.*;

public class Application extends Controller {
  
    public static Result index() {
        return ok(index.render("Welcome to Play 2.2"));
    }
    
    public static Result jsRoutes() {
        return ok( Routes.javascriptRouter("jsRoutes",
        		routes.javascript.Cursos.list(),
        		routes.javascript.Cursos.create(),
        		routes.javascript.Cursos.view()));
    }
  
}
