package controllers;

import models.*;
import play.*;
import play.data.*;
import play.mvc.*;
import static play.libs.Json.*;

import views.html.curso.*;

public class Cursos extends Controller {

	public static Result index() {
		return ok(list.render("Cursos"));
	}
	
	public static Result listJson() {
		return ok(toJson(Curso.all()));
	}

	public static Result create() {
		Curso curso = Form.form(Curso.class).bindFromRequest().get();
		curso.save();
		return redirect(routes.Cursos.index());
	}
	
	public static Result createAjax() {
		Curso curso = Form.form(Curso.class).bindFromRequest().get();
		curso.save();
		return ok(toJson(curso));
	}

}
