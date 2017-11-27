{
ALGORITHME : jeu_de_loie
//BUT : Le joueur est caracterisee par un nombre nomme "place" compris entre 0 et 66 qui situe sa poisition sur le jeu de loie, sachant qu apres jet des deux des on applique les regles suivantes:
		- On avance du nombre de case indiquer par le nombredes des, SI on arrive sur la case 66 le jeu est terminer, SINON on recule du nombre de case en trop.
		- Une oie toute les 9 cases sauf en 63, double le deplacement.
		- Une tete de mort en case 58 renvoie a la case 0.
		- Le jeu se joue seul.
//ENTREES : Lancer de des
//SORTIES : Deplacement sur les cases


CONST
	depart <- 0 : ENTIER
	arrive <- 66 : ENTIER
	mort <- 58 : ENTIER
	des_max <- 11 : ENTIER
	double_deplacement <- 9 : ENTIER
	non_double <- 63 : ENTIER

VAR
	des, place, surplus : ENTIER

DEBUT
	ECRIRE "Appuyez ENTREE pour lancer la partie."
	LIRE
	des <- 0 //Initialisation de la valeur des des
	place <- 0 //Initialisation de la case de depart
	ECRIRE "Vous etes a la case ", place
	REPETER
		ECRIRE "Appuyez sur ENTREE pour lancer les des."
		LIRE
		des <- aleatoire(des_max)+2 //Lance de des aleatoire entre 2(0+2) et 12(10+2)
		ECRIRE "Vous avancez de ", des, "cases."
		place <- (des + place) //Deplacement
		ECRIRE "Vous allez en case", place
		SI (place MOD double_deplacement = 0) ET (place <> non_double) ALORS //Condition case 9, 18,... pour doubler le deplacement
			place <- des + place
			ECRIRE "Votre lancer est double ! Vous allez directement en case : ", place
		FINSI
		SI (place = mort) ALORS //Condition de la case tete de mort
			place <- 0
			ECRIRE "Vous etes sur la case MORT... Vous retournez a la case depart"
		FINSI
		SI (place > arrive) ALORS //Condition si on depasse la case 66
			surplus <- 0 //Nombre de case en trop apres la case 66
			surplus <- place - arrive //Calcul du nombre de cases en trop
			place <- arrive - surplus //Calcul du nombre de cases a reculer si lance va plus loin que la case 66
			ECRIRE "Vous reculez en case ",place
		FINSI
	JUSQUA (place = arrive) //Condition de victoire
	ECRIRE "Vous avez gagner"
FIN
}



PROGRAM jeu_de_loie;
//BUT : Le joueur est caracterisee par un nombre nomme "PLACE" compris entre 0 et 66 qui situe sa poisition sur le jeu de loie, sachant qu apres jet des deux des on applique les regles suivantes:
		{- On avance du nombre de case indiquer par le nombredes des, SI on arrive sur la case 66 le jeu est terminer, SINON on recule du nombre de case en trop.
		- Une oie toute les 9 cases sauf en 63, double le deplacement.
		- Une tete de mort en case 58 renvoie a la case 0.
		- Le jeu se joue seul.}
//ENTREES : Lancer de des
//SORTIES : Deplacement sur les cases

USES crt;



CONST
	depart=0;
	arrive=66;
	mort=58;
	des_max=11;
	double_deplacement=9;
	non_double=63;
	non_double2=72;

VAR
	des, place, surplus, tour, caze: INTEGER;

BEGIN
	clrscr;

	writeln('Appuyez sur ENTREE pour lancer la partie.');
	readln;
	Randomize; //Fonction random pour avoir un nombre aleatoire
	des:=0; //Initialisation de la valeur des des
	place:=0; //Initialisation de la case depart
	tour:=0; //Compteur du nombre de tour
	writeln('Vous commencez en case ', place);

	REPEAT
		BEGIN
			writeln;
			writeln('Appuyez sur ENTREE pour lancer les des');
			readln;
			des:=random(des_max)+2; //Lance de des aleatoire entre 2(0+2) et 12(10+2)

			clrscr;

			
			tour:=tour+1;
			writeln('TOUR : ', tour);
			writeln;

			writeln('Les des affichent ', des, '. Vous avancez de ', des, ' cases');
			place:=(des+place); //Deplacement (reaffectation)
			writeln('Vous etes sur la case [', place,']');


			IF(place MOD double_deplacement=0) AND (place<>non_double) AND (place<>non_double2) THEN //Condition case 9, 18,... pour doubler le deplacement
				BEGIN
				place:=des+place;
				writeln('Votre lancer est double ! Vous allez directement en case : ', place)
				END;

			IF(place=mort) THEN //Condition de la case tete de mort
				BEGIN
				place:=0;
				writeln('Vous etes sur la case TETE DE MORT... Vous retournez en case depart');
				END;

			IF(place>arrive) THEN //Condition si on depasse la case 66
				BEGIN
				surplus:=0; //Nombre de case en trop apres la case 66
				surplus:=place-arrive; //Calcul du nombre de cases en trop
				place:=arrive-surplus; //Calcul du nombre de cases a reculer si lance va plus loin que l'arrivee
				writeln;
				writeln('Vous avez depasser la case 66 de ', surplus, ' cases.');
				writeln;
				writeln('Vous retourner en case [',place, ']');
				END;
		END;

		
	UNTIL (place=arrive); //Condition de victoire
	writeln;
	writeln('Vous avez gagner !');
	writeln('Vous avez jouer ', tour, ' tours.');
	readln;
END.
