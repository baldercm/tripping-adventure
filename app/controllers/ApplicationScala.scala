package controllers

import play.api._
import play.api.mvc._

import views._

object ApplicationScala extends Controller {
  
  def index = Action {
    Ok(html.index("Your new application is ready in Scala."))
  }
  
}