package views.html.helper

/**
 * Contains template helpers, for example for generating HTML forms.
 */
package object custom {

  implicit val twitterBootstrapField = new FieldConstructor {
    def apply(elts: FieldElements) = twitterBootstrapFieldConstructor(elts)
  }

}