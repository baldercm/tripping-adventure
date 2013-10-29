package controllers;

import models.*;
import play.data.*;
import play.mvc.*;
import static play.data.Form.*;
import static play.libs.Json.*;

public class Cursos extends Controller {

	final static Form<Curso> cursoEmptyForm = form(Curso.class);

	public static Result view(Long id) {
		Curso curso = Curso.find.byId(id);
		return ok(toJson(curso));
	}

	public static Result list() {
		return ok(toJson(Curso.all()));
	}

	public static Result create() {
		Curso curso = Form.form(Curso.class).bindFromRequest().get();
		curso.save();
		return ok(toJson(curso));
	}

	public static Result update() {
		Curso curso = Form.form(Curso.class).bindFromRequest().get();
		curso.update();
		return ok(toJson(curso));
	}

}
