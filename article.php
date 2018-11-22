<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Блог IT_Минималиста!</title>

  <!-- Bootstrap Grid -->
  <link rel="stylesheet" type="text/css" href="/media/assets/bootstrap-grid-only/css/grid12.css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">

  <!-- Custom -->
  <link rel="stylesheet" type="text/css" href="/media/css/style.css">
</head>
<body>

  <div id="wrapper">
    <?php
      include "pages/header.php";

      $article = mysqli_query($connection, "SELECT * FROM `articles` WHERE `id` = " . (int) $_GET['id']);

      if (mysqli_num_rows($article <= 0)) {
      ?>
      <div id="content">
          <div class="container">
              <div class="row">
                  <section class="content__left col-md-8">
                      <div class="block">
                          <h3>Статья не найдена!</h3>
                          <div class="block__content">
                              <img src="/media/images/post-image.jpg">

                              <div class="full-text">
                                  Запрашиваемая статья не существует
                              </div>
                          </div>
                      </div>
                  </section>
              </div>
          </div>
      </div>

      <?php

      }
    ?>



    <?php
        include "pages/footer.php";
    ?>

  </div>

</body>
</html>