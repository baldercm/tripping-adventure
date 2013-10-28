<form id="cursoForm" action="#" role="form">
  <legend>Crear Curso</legend>
  <div class="row">
    <div class="form-group col-md-4" id="nombre_field">
      <label for="nombre">Nombre</label>
      <input type="text" name="nombre" value="<%= nombre %>" id="nombre" class="form-control">
    </div>
  </div>
  <div class="form-group">
    <button id="save" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Guardar</button>
    <button id="back" type="button" class="btn btn-default"><span class="glyphicon glyphicon-chevron-left"></span> Volver</button>
  </div>
</form>