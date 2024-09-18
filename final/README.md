# Épreuve finale

> Remise : 20 septembre \
> Pondération : 30%

Pour l'épreuve finale de ce cours, on vous demande de concevoir un jeu
de devinettes qui peut être joué sur la ligne de commande. Le but du jeu
est simple : deviner les trois mots d'un ensemble. Pour ce faire, le ou
la joueuse peut demander des indices : la lettre qui se trouve à une
position donnée, le nombre de voyelles, ou bien le nombre de consonnes.
Vous trouverez plus amples détails sur le fonctionnement du jeu
ci-dessous.

## Ensemble de mots

Pour accéder à l'ensemble de mots à deviner, il suffit d'appeler la
fonction `get_words` qui se trouve dans le fichier source `words.php`.
Bien sûr, vous devrez inclure le contenu de `words.php` dans votre
programme avant de pouvoir appeler la fonction.

Il n'est pas nécessaire pour vous de comprendre l'implémentation de
`get_words`. Sachez seulement que la fonction retourne un tableau qui
contient les trois mots à deviner. Il vous est d'ailleurs interdit de
modifier les fichiers `words.php` et `words.txt`.

## Tentative

Pour faire une tentative et essayer de deviner les trois mots, le joueur
doit entrer la commande `guess` suivie des trois mots.

```sh
php game.php guess apple orange kiwi
```

Si la tentative échoue (c'est-à-dire que les trois mots donnés par le
ou la joueuse ne sont pas les mêmes que ceux retournés par la fonction
`get_words`), alors votre programme doit écrire le message suivant dans
le flux de sortie.

```
Ce ne sont pas les bons mots. Veuillez essayer de nouveau.
```

Si la tentative est réussie, alors votre programme doit écrire le
message ci-dessous dans le flux de sortie, puis appeler la fonction
`next_set` (elle aussi définie dans le fichier `words.php`). La fonction
`next_set` permet de passer au prochain ensemble de mots.

```
Félicitation ! Vous avez deviné l'ensemble de mots correctement.
Veuillez demander un nouvel indice pour jouer de nouveau.
```

## Indices

Le ou la joueuse peut demander trois types d'indice différents pour
l'aider à deviner les mots de l'ensemble : la lettre qui se trouve à une
position donnée, le nombre de voyelles, ou bien le nombre de consonnes.

### Lettre à une position donnée

Si le ou la joueuse exécute votre programme avec les arguments `clue
letter` suivis d'un nombre, alors vous devez écrire dans le flux de
sortie la lettre à la position correspondant au nombre donné pour chaque
mot.

Considérons l'exemple ci-dessous.

```sh
php game.php clue letter 3
```

Étant donné l'ensemble de mots `chien chat lapin`, votre programme
devrait écrire `e t i` dans le flux de sortie.

Dans le cas où il n'y a pas de lettre à la position donnée, votre
programme doit afficher `_` au lieu de la lettre. Ainsi, si le nombre
était `4` plutôt que `3` dans l'exemple précédent, alors votre programme
devrait écrire `n _ n` dans le flux de sortie.

### Nombre de voyelles

Si le ou la joueuse exécute votre programme avec les arguments `clue
vowels`, alors vous devez écrire dans le flux de sortie le nombre de
voyelles que contient chaque mot. Aucun des mots retournés par la
fonction `get_words` ne contient des accents, des espaces ou des tirets.

Considérons l'exemple ci-dessous.

```sh
php game.php clue vowels
```

Étant donné l'ensemble de mots `chien chat lapin`, votre programme
devrait écrire `2 1 2` dans le flux de sortie.

### Nombre de consonnes

Si le ou la joueuse exécute votre programme avec les arguments `clue
consonants`, alors vous devez écrire dans le flux de sortie le nombre de
consonnes que contient chaque mot.

Considérons l'exemple ci-dessous.

```sh
php game.php clue consonants
```

Étant donné l'ensemble de mots `chien chat lapin`, votre programme
devrait écrire `3 3 3` dans le flux de sortie.

## Note

Portez une attention particulière à l'imbrication excessive des
instructions. Par exemple, évitez le plus possible d'imbriquer une
instruction conditionnelle dans une autre. Rappelez-vous que chaque
tâche devrait être prise en charge par une fonction différente.

Vous avez le droit d'utiliser toutes les fonctions natives de PHP, à
condition que vous comprenez celles-ci (voir ci-dessous).

## Remise

Le programme doit être remis dans un fichier nommé `game.php`, dans un
dépôt crée à cet effet. Pour créer le dépôt, cliquez [ici][].

[ici]: https://classroom.github.com/a/UlymPcW7

## Entretien

Enfin, une fois votre examen soumis, vous devrez expliquer le
fonctionnement lors d'un entretien individuel avec l'enseignant.
L'entretien aura lieu lors du dernier cours, et il sera d'une durée
approximative de 5 minutes.

## Critères d'évaluation

-   Lisibilité [10]

    -   le code est exempt de variables et fonctions inutilisées
    -   l'utilisation des espaces blancs est constante
    -   les lignes ne dépassent pas 80 caractères
    -   les noms de variables et fonctions sont descriptifs
    -   un nom est donné aux valeurs constantes
    -   des commentaires sont présents là où nécessaire
    -   les fonctions sont bien documentées
    -   la prose est correcte et utile
    -   les fonctions sont bien testées

-   Conception du programme [10]

    -   les exigences sont respectées
    -   le programme est décomposé en parties logiques
    -   les interfaces sont propres et bien encapsulées
    -   les algorithmes appropriés sont utilisés et codés proprement
    -   le code commun est unifié, non dupliqué

-   Structures de données [5]

    -   les structures de données sont appropriées
    -   pas de stockage/copie redondant des données
    -   pas de variables globales

-   Entretien [5]

    -   le code est bien expliqué
    -   les décisions sont correctement justifiées
