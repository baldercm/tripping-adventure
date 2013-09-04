package controllers;

import models.*;
import play.*;
import play.data.*;
import play.mvc.*;
import static play.data.Form.*;
import static play.libs.Json.*;

import views.html.curso.*;

public class Cursos extends Controller {

	final static Form<Curso> cursoEmptyForm = form(Curso.class);
	
	public static Result index() {
		return ok(list.render(cursoEmptyForm));
	}
	
	public static Result listJson() {
		return ok(toJson(Curso.all()));
	}

	public static Result create() {
		Form<Curso> cursoForm = Form.form(Curso.class).bindFromRequest();
		if(cursoForm.hasErrors()) {
            return badRequest(list.render(cursoForm));
        } else {
			Curso curso = cursoForm.get();
			curso.save();
			return redirect(routes.Cursos.index());
        }
	}
	
	public static Result createAjax() {
		Curso curso = Form.form(Curso.class).bindFromRequest().get();
		curso.save();
		return ok(toJson(curso));
	}

}
