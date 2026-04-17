EXELNOID
Pour EXL 100 / EXELTEL
Version BETA 0.99-17
01/04/2026    DADA59



EXELNOID -------------------------------------------------


De retour dans les années .equ $1980, le courageux TMS7xx0, épaulé par ses
comparses Dada59, Claude et Codex et d'autres irréductibles, luttent avec
acharnement pour la libération des systèmes obscures.
La ligue des vilains MAINSTREAM, menée par les démoniaques Z80x et 6502y, a
envoyé le valeureux TMS dans le dédale de briques. Aidez notre héros à rejoindre la
planète wizord3556 et libérer ainsi ses amis de la ligue 8bits, videotext et obscures
consorts.
Détruisez toutes les briques pour avancer dans les niveaux. Quand la dernière
brique tombe, la ligue des vilains MAINSTREAM est déconfite, la bataille est
relancée — et le valeureux TMS7xx0 est prêt à repartir pour de nouvelles aventures.


démo : 
https://www.youtube.com/watch?v=c_FOsd-g2Co


Fichier ROM utilisable dans l'émulateur DCexel et sur EXL100 / EXELTEL 

Consultez le manuel pour plus d'informations sur le jeu

C'est une version BETA quelques bogues et instabilités sont possibles.



12/04/26 -------------------------------------------------

Ajout du fichier exelnoid_v099-17-exelmouse.rom

=> version compatible avec l'Exelmouse, testé OK sur Exeltel avec Exelmouse sur interface multifonction
Fonctionnement à vérifier sur EXL100 avec Exelmouse sur interface CRAM

17/04/26 -------------------------------------------------

-Ajout des sources assembleur des ROM exelnoid_v099-17.rom et exelnoid_v099-17-exelmouse.rom

-Ajout d'une version minimale dans le répertoire mini, cela permet de lancer le jeu en version allégée en utilsant l'exelmémoire si l'on ne dispose pas du matériel pour créer une rom.

fichier exelnoid_v17lite.cram => image cram pouvant être chargé dans l'émulateur DCexel
exelnoidcramlite.k7 => sauvegarde de cette cram via l'interface exelmémoire dans un fichier k7 Dcexel, nom du backup cram = NOID

exelnoidcramlite.wav => fichier wav issu de la conversion du fichier .k7
=> ce fichier peut être chargé dans un EXL100 / EXELTEL par l'interface exelmémoire via l'option BKP, 1 TAPE vers CRAM, nom de CRAM = NOID

un fois chargé dans une exelmémoire le jeu se lance ensuite par l'exelbasic / exelbasic par 
CALL EXEC (32772)

Les fichiers avec le suffixe mouse sont la version compatible avec exelmouse, testé OK sur interface multifonction sur exeltel, se lance de la même façon que la version classique


(le script make_cram.py permet de transformer un fichier obj issu de la compilation TASM en fichier CRAM pour utilisation dans DCexel (le fichier assembleur doit aoir un .org > 8000, 8004 ici) )

------------------------------------------------------------------------------------
Crédits :
Merci aux valeureux partisans des systèmes obscures :
Jester pour le dev kit et les outils : http://dcexel.free.fr/outils/index.html
Les superbes sites http://dcexel.free.fr/ avec l'emulateur Exl100/Exeltel et https://www.ti99.com/exelvision/website/
les membres actifs du forum : https://forum.system-cfg.com/
Brett Hallen pour les pcb de cartouche : https://github.com/BrettHallen/Exelvision/tree/main


« La bataille est relancée — et le valeureux TMS7xx0 est prêt à repartir pour de
nouvelles aventures. »
