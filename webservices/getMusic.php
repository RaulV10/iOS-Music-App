<?php
  /* Hacer conexion con la base de datos */
  $con = mysqli_connect("127.0.0.1", "root", "", "music_app");

  if(mysqli_connect_errno()) {
    printf("No se pudo establecer la conexion con la base de datos:\n %s\n", mysqli_connect_error());
    exit();
  }

  $query = "SELECT * FROM `music` ORDER BY idMusic DESC";

  if($result = mysqli_query($con, $query)) {
    $i = 0;
    while($row = mysqli_fetch_row($result)) {
      if($i == 0) {
        echo "$row[0],$row[1],$row[2],$row[3]";
      } else {
        echo "*$row[0],$row[1],$row[2],$row[3]";
      }
      $i++;
    }
    mysqli_free_result($result);
  }

mysqli_close($con);

?>
