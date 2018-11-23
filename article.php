<?php
require "includes/config.php"
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php echo $config['title'];?></title>

    <!-- Bootstrap Grid -->
    <link rel="stylesheet" type="text/css" href="/media/assets/bootstrap-grid-only/css/grid12.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">

    <!-- Custom -->
    <link rel="stylesheet" type="text/css" href="/media/css/style.css">
</head>
<body>

<div id="wrapper">

    <?php include "pages/header.php"?>

    <?php
        $article = mysqli_query($connection, "SELECT * FROM `articles` WHERE `id` = " . (int) $_GET['id']);

        if (mysqli_num_rows($article) <= 0) {
            ?>
            <div id="content">
                <div class="container">
                    <div class="row">
                        <section class="content__left col-md-8">
                            <div class="block">
                                <h3>Статья не найдена</h3>
                                <div class="block__content">

                                    <div class="full-text">
                                        Запрашиваемая Вами статья не существует
                                    </div>
                                </div>
                            </div>
                        </section>

                        <?php include "pages/sidebar.php"?>

                    </div>
                </div>
            </div>
            <?php
        } else {
            $art = mysqli_fetch_assoc($article);

            mysqli_query($connection, "UPDATE  `articles` SET `views` = `views` + 1 WHERE `id` = " . (int) $_GET['id']);
          ?>
            <div id="content">
                <div class="container">
                    <div class="row">
                        <section class="content__left col-md-8">
                            <div class="block">
                                <a><?php echo $art['views'];?> просмотров</a>
                                <h3><?php echo $art['title'];?></h3>
                                <div class="block__content">
                                    <img src="media/images/<?php echo $art['image'];?>" alt="">
                                    <div class="full-text">
                                        <?php echo $art['text'];?>
                                    </div>
                                </div>
                            </div>
                            <div class="block">
                                <h3>Топ читаемых статей</h3>
                                <div class="block__content">
                                    <div class="articles articles__vertical">

                                        <div class="block">
                                            <a href="#comment-add-form">Добавить свой</a>
                                            <h3>Комментарии</h3>
                                            <div class="block__content">
                                                <div class="articles articles__vertical">

                                                    <?php
                                                    $comments = mysqli_query($connection, "SELECT * FROM `comments` WHERE `articles_id` = "  .(int) $art['id']);
                                                    if (mysqli_num_rows($comments) <= 0) {
                                                        echo "Нет комментариев";
                                                    }
                                                    while($comment = mysqli_fetch_assoc($comments))
                                                    {
                                                        ?>
                                                        <article class="article">
                                                            <div class="article__image" style="background-image: url(https://www.gravatar.com/avatar/<?php echo md5($comment['email']);?>?s=125);"></div>
                                                            <div class="article__info">
                                                                <div class="article__info__meta">Имя: <a href="/article.php?id=<?php echo $comment['articles_id'];?>"><small></small><?php echo $comment['author'];?></a></div>
                                                                <div class="article__info__meta"></div>
                                                                <div class="article__info__preview"><?php echo ($comment['text']);?></div>
                                                            </div>
                                                        </article>
                                                        <?php
                                                    }
                                                    ?>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div id="comment-add-form" class="block">
                                <h3>Комментарии</h3>
                                <div class="block__content">
                                    <form action="" class="form" method="POST" action="/article.php?id=<?php echo $art['id'];?>#comment-add-form">
                                        <?php
                                           if(isset ($_POST['do_post']))
                                           {
                                               $errors = array();
                                               if($_POST['name'] == '' )
                                               {
                                                   $errors[] = 'Введите имя!';
                                               }

                                               if($_POST['nickname'] == '' )
                                               {
                                                   $errors[] = 'Введите никнейм!';
                                               }

                                               if($_POST['email'] == '' )
                                               {
                                                   $errors[] = 'Введите email!';
                                               }

                                               if($_POST['text'] == '' )
                                               {
                                                   $errors[] = 'Введите текст комментария!';
                                               }

                                               if(empty($errors))
                                               {
                                                   echo ("INSERT INTO `comments` (`author`, `nickname`, `email`, `text`, `pubdate`, `articles_id`) VALUES('". $_POST['author'] ."', '". $_POST['nickname'] ."', '". $_POST['email'] ."', '". $_POST['text'] ."', '". $_POST[''] ."', NOW(), '". $art['id'] ."') ");
                                                   echo '<span style="color: green; font-weight: bold; margin-bottom: 10px; display: block;">Комментарий успешно добавлен!</span>';
                                                   exit();
                                                   mysqli_query($connection, "INSERT INTO `comments` (`author`, `nickname`, `email`, `text`, `pubdate`, `articles_id`) VALUES('". $_POST['author'] ."', '". $_POST['nickname'] ."', '". $_POST['email'] ."', '". $_POST['text'] ."', '". $_POST[''] ."', NOW(), '". $art['id'] ."') ");
                                               } else {
                                                   echo '<span style="color: red; font-weight: bold; margin-bottom: 10px; display: block;">' . $errors['0'] . '</span>';
                                               }
                                           }
                                        ?>
                                        <div class="form__group">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <input type="text" name="name" class="form__control" placeholder="Name" value="<?php echo $_POST['name'];?>">
                                                </div>
                                                <div class="col-md-4">
                                                    <input type="text" name="name" class="form__control" placeholder="Nickname" value="<?php echo $_POST['nickname'];?>">
                                                </div>
                                                <div class="col-md-4">
                                                    <input type="text" name="name" class="form__control" placeholder="Email (will not show)" value="<?php echo $_POST['email'];?>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form__group">
                                            <textarea class="form__control" name="text" id="" cols="30" rows="10" placeholder="Текст комментария ..."></textarea>
                                            <input class="form__control" type="submit" name="do_post" value="Добавить комментарий">
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </section>


                            <?php include "pages/sidebar.php"?>

                    </div>
                </div>
            </div>
          <?php
        }
    ?>

    <?php include "pages/footer.php"?>

</div>

</body>
</html>