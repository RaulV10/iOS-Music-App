<?php
  /* Hacer conexion con la base de datos */
  $con = mysqli_connect("127.0.0.1", "root", "", "music_app");

  if(mysqli_connect_errno()) {
    printf("No se pudo establecer la conexion con la base de datos:\n %s\n", mysqli_connect_error());
    exit();
  }

  $id = $_GET['idMusic'];

  $query = "UPDATE music SET escuchados = (escuchados + 1) WHERE idMusic = $id";
  mysqli_query($con, $query);

?>
