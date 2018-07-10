<?php
  /* Hacer conexion con la base de datos */
  $con = mysqli_connect("127.0.0.1", "root", "", "music_app");

  if(mysqli_connect_errno()) {
    printf("No se pudo establecer la conexion con la base de datos:\n %s\n", mysqli_connect_error());
    exit();
  }

  /* Buscar archivos en el directorio */
  $files = glob('*.mp3');

  usort($files, function ($a, $b) {
    /* Ordena los archivos dependiendo de cuando fueron modificados */
    return filemtime($a) < filemtime($b);
  });

  /* Insertar los archivos en la base de datos SI ES QUE existe */
  $i = 0;

  while(isset($files[$i])) {
    /* Quita el nombre completo del directorio y
    nos deja con el nombre dentro del directorio actual */
    $nombre = basename($files[$i]);
    echo $i." - ".$nombre."<br>";

    $query = "INSERT INTO music VALUES(default, '$nombre', 0, 0)";
    mysqli_query($con, $query);

    $i++;
  }

?>
