<?php
$conexao = mysqli_connect("localhost", "root", "", "inner_join_mysqli_tres_tabelas"); 
mysqli_query($conexao, "SET NAMES 'utf8';");
   
   if(isset($_GET['busca'])){
      $busca = $_GET['busca'];
     
      $query =  mysqli_query($conexao,"SELECT * FROM cliente WHERE cpf = '$busca' ");	
      $total = mysqli_num_rows($query);
      $linha = mysqli_fetch_array($query);

      echo json_encode($linha);
  
   }
   