<?php
    /* choix de la valeur de la variable $content en fonction de parametre action transmis */
	if (isset($_GET['action'])) {
		switch ($_GET['action']) {
			case (""):
				$content = "pages/presentation.php";
				break;
			case ("accueil"):
				$content = "pages/presentation.php";
				break;
			default:
				$content = "pages/lostinspace.php";
		}
	} else {	
		$content = "pages/presentation.php";
	}

	if (isset($_GET['action'])) {
		switch ($_GET['action']) {
			case (""):
				$content = "pages/presentation.php";
				break;
			case ("accueil"):
				$content = "pages/presentation.php";
				break;
			case ("cours"):
				$content = "pages/cours.php";
				break;
			case ("enseignement"):
					$content = "pages/enseignement.php";
					break;
			case ("instrument"):
			   $content = "pages/instrument.php";
				 break;
			case ("contact"):
				$content = "pages/contact.php";
				break;
			default:
				$content = "pages/lostinspace.php";
		}
	} else {	
		$content = "pages/presentation.php";
	}
?>