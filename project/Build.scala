import sbt._
import Keys._
import play.Project._

object ApplicationBuild extends Build {

  val appName         = "play-CP"
  val appVersion      = "0.2.0-SNAPSHOT"

  val appDependencies = Seq(
    // Add your project dependencies here,
    javaCore,
    javaJdbc,
    javaEbean,
    "postgresql" % "postgresql" % "9.2-1002.jdbc4"
  )

  val main = play.Project(appName, appVersion, appDependencies).settings(
    resolvers += "Local Maven Repository" at "file:///"+Path.userHome.absolutePath+"/.m2/repository",
    requireJsShim += "build.js",
    requireJs += "app.js",
    requireJs += "models/curso.js",
    requireJs += "collections/cursos.js",
    requireJs += "views/curso.js",
    requireJs += "views/cursos.js"
  )

}
